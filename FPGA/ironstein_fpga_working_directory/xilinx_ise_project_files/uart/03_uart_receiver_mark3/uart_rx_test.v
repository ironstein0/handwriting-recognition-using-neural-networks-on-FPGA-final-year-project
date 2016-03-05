`include "rx_baudrate_tick_generator.v"

module uart_rx_core #(
	parameter NUMBER_OF_DATA_BITS = 8,
	parameter NUMBER_OF_STOP_BIT_TICKS = 16
	)(
	// control signals
	input wire clk, 
	input wire reset,
	// data
	input wire rx,
	output reg [NUMBER_OF_DATA_BITS-1:0] data_out,
	// status signals
	output reg rx_done_tick,
	output wire sample_tick,
	// test
	output wire [1:0] state_reg_test,
	output wire [1:0] state_next_test,
	output wire [3:0] sampling_tick_count_reg_test,
	output wire [3:0] sampling_tick_count_next_test,
	output wire [2:0] data_bits_count_reg_test,
	output wire [2:0] data_bits_count_next_test,
	output wire [7:0] data_reg_test,
	output wire [7:0] data_next_test
	);

	// module instantiations
	rx_baudrate_tick_generator #(.baudrate(32'd115200),.frequency(32'd100000000)) 
		t1(
			.clk(clk),
			.reset(reset),
			.tick(sample_tick)
		);

	// state declarations
	localparam [1:0]
		idle = 2'b00,
		start = 2'b01,
		data = 2'b10,
		stop = 2'b11;

	// signal declarations 
	reg [1:0] state_reg,state_next;
	reg [3:0] sampling_tick_count_reg,sampling_tick_count_next;			// number of sampling ticks encountered
	reg [2:0] data_bits_count_reg,data_bits_count_next;					// number of data bits received
	reg [7:0] data_reg = 8'b0, data_next;    							// register for storing data assigned to data_out
	reg [NUMBER_OF_DATA_BITS-1:0] data_out_next;

	// test assignments
	assign state_reg_test = state_reg;
	assign state_next_test = state_next;
	assign sampling_tick_count_reg_test = sampling_tick_count_reg;
	assign sampling_tick_count_next_test = sampling_tick_count_next;
	assign data_bits_count_reg_test = data_bits_count_reg;
	assign data_bits_count_next_test = data_bits_count_next;
	assign data_reg_test = data_reg;
	assign data_next_test = data_next;

	// state updation logic
	always @ (posedge(clk) , posedge(reset))
		if (reset) begin
			state_reg <= idle;
			sampling_tick_count_reg <= 0;
			data_bits_count_reg <= 0;
			data_reg <= 0;
			data_out <= 0;
		end
		
		else begin
			state_reg <= state_next;
			sampling_tick_count_reg <= sampling_tick_count_next;
			data_bits_count_reg <= data_bits_count_next;
			data_reg <= data_next;
			data_out <= data_out_next;
		end

	always @* begin
		state_next = state_reg;
		rx_done_tick = 1'b0;
		sampling_tick_count_next = sampling_tick_count_reg;
		data_bits_count_next = data_bits_count_reg;
		data_next = data_reg;
		data_out_next = data_out;

		case (state_reg)
			idle :
				if (~rx) begin
					state_next = start;
					sampling_tick_count_next = 0;
				end
			start :
				if (sample_tick)
					if (sampling_tick_count_reg == 7)begin
						state_next = data;
						sampling_tick_count_next = 0;
						data_bits_count_next = 0;
					end

					else 
						sampling_tick_count_next = sampling_tick_count_reg + 1;
			data :
				if (sample_tick)
					if (sampling_tick_count_reg == 15) begin
						sampling_tick_count_next = 0;
						data_next = {rx, data_reg[NUMBER_OF_DATA_BITS - 1:1]};
						if (data_bits_count_reg == (NUMBER_OF_DATA_BITS - 1)) begin
							state_next = stop;
						end else begin
							data_bits_count_next = data_bits_count_reg + 1;
						end
					end

					else begin
						sampling_tick_count_next = sampling_tick_count_reg + 1;
					end

			stop :
				if (sample_tick) begin
					if (sampling_tick_count_reg == (NUMBER_OF_STOP_BIT_TICKS - 1)) begin
						state_next = idle;
						rx_done_tick = 1'b1;
						data_out_next = data_reg;
					end else begin
						sampling_tick_count_next = sampling_tick_count_reg + 1;
						data_out_next = data_reg;
					end
				end
		endcase

	end

endmodule

module stimulus();
	// control signals
	reg CLK, RESET;
	// data
	reg RX;
	wire [7:0] DATA_OUT;
	// status signals
	wire RX_DONE_TICK;
	wire SAMPLE_TICK;
	// test
	wire [1:0] STATE_REG_TEST;
	wire [1:0] STATE_NEXT_TEST;
	wire [3:0] SAMPLING_TICK_COUNT_REG_TEST;
	wire [3:0] SAMPLING_TICK_COUNT_NEXT_TEST;
	wire [2:0] DATA_BITS_COUNT_REG_TEST;
	wire [2:0] DATA_BIT_COUNT_NEXT_TEST;
	wire [7:0] DATA_REG_TEST;
	wire [7:0] DATA_NEXT_TEST;

	uart_rx_core u(
		.clk(CLK),
		.reset(RESET),
		.rx(RX),
		.data_out(DATA_OUT),
		.rx_done_tick(RX_DONE_TICK),
		.sample_tick(SAMPLE_TICK),
		.state_reg_test(STATE_REG_TEST),
		.state_next_test(STATE_NEXT_TEST),
		.sampling_tick_count_reg_test(SAMPLING_TICK_COUNT_REG_TEST),
		.sampling_tick_count_next_test(SAMPLING_TICK_COUNT_NEXT_TEST),
		.data_bits_count_reg_test(DATA_BITS_COUNT_REG_TEST),
		.data_bits_count_next_test(DATA_BIT_COUNT_NEXT_TEST),
		.data_reg_test(DATA_REG_TEST),
		.data_next_test(DATA_NEXT_TEST)
	);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			CLK,
			RESET,
			RX,
			DATA_OUT,
			RX_DONE_TICK,
			SAMPLE_TICK,
			STATE_REG_TEST,
			STATE_NEXT_TEST,
			SAMPLING_TICK_COUNT_REG_TEST,
			SAMPLING_TICK_COUNT_NEXT_TEST,
			DATA_BITS_COUNT_REG_TEST,
			DATA_BIT_COUNT_NEXT_TEST,
			DATA_REG_TEST,
			DATA_NEXT_TEST
		);
	end

	initial begin
		CLK = 1'b0;
		RESET = 1'b0;
	end

	always begin
		#1 CLK = ~ CLK;
	end

	initial begin
		#10 RESET = 1'b1;
		#1000 RESET = 1'b0;
		#10 RX = 1'b0;
		#4000 RX = 1'b1;
	end

	initial begin
		#10000 $finish;
	end 

endmodule