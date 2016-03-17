`include "fifo.v"

module traffic_generator(
	// control signals
	input wire clk,
	input wire reset,
	// data signals
	input wire rx_done_tick,
	input wire [7:0] rx_data_out,
	output reg tx_start_transmission,
	output reg [7:0] tx_data_in,
	output wire wr_en,
	// test_signals
	output wire fifo_pop_test,
	output wire fifo_push_test,
	output wire fifo_full_test,
	output wire fifo_empty_test,
	output wire [7:0] fifo_data_input_test,
	output wire [7:0] fifo_data_output_test,
	output wire [7:0] fifo_count_test,
	output wire [7:0] wr_count_test,
	input wire wr_full,
	output wire tx_stop_flag_test
	);

	// module instantiations
		reg fifo_pop;
		reg fifo_push;
		wire fifo_full;
		wire fifo_empty;
		wire [7:0] fifo_data_input;
		assign fifo_data_input = rx_data_out;
		assign wr_en = fifo_pop;
		wire [7:0] fifo_data_output;
		wire [31:0] fifo_count;
		// test assignments
		assign fifo_pop_test = fifo_pop;
		assign fifo_push_test = fifo_push;
		assign fifo_full_test = fifo_full;
		assign fifo_empty_test = fifo_empty;
		assign fifo_data_input_test = fifo_data_input;
		assign fifo_data_output_test = fifo_data_output;
		assign fifo_count_test = fifo_count;

		fifo #(.data_size(4'd8),.buffer_size(6'd63))
			intermediate_fifo(
				.clk(clk),
				.reset(reset),
				.read_data(fifo_pop),
				.write_data(fifo_push),
				.full(fifo_full),
				.empty(fifo_empty),
				.data_input(fifo_data_input),
				.data_output(fifo_data_output),
				.fifo_count(fifo_count)
			);

	// logic
		// fifo_push updation logic
		always @(posedge(clk),posedge(rx_done_tick),posedge(reset)) begin
			if(reset) begin
				fifo_push = 1'b0;
			end else begin
				if(rx_done_tick) begin
					fifo_push = 1'b1;
				end else begin
					fifo_push = 1'b0;
				end
			end
		end

		// fifo_pop updation logic
		// reg wr_full = 1'b0;	//
		always @(posedge(clk),negedge(clk),posedge(reset)) begin
			if(reset) begin
				fifo_pop = 1'b0;
			end else begin
				if((!wr_full) && (fifo_count != 0)) begin
					fifo_pop = 1'b1;
				end else begin
					fifo_pop = 1'b0;
				end
			end
		end

		
		reg tx_stop_flag;
		assign tx_stop_flag_test = tx_stop_flag;


		// tx_start_transmission and tx_stop_flag_next updation logic
		localparam [7:0]
			TX_START_TRANSMISSION_BYTE = 8'b1,
			TX_STOP_TRANSMISSION_BYTE = 8'b0;

		always @(posedge(clk),posedge(reset)) begin
			if(reset) begin
				tx_stop_flag = 1'b0;
				tx_start_transmission = 1'b0;
				tx_data_in = 8'b0;
			end else begin
				if(wr_full) begin
					if(tx_stop_flag == 1'b1) begin
						// stop signal already sent
						tx_data_in = tx_data_in;
						tx_start_transmission = tx_start_transmission;
						tx_stop_flag = tx_stop_flag;
					end else begin
						// transmit stop signal
						tx_data_in = TX_STOP_TRANSMISSION_BYTE;
						tx_start_transmission = ~ tx_start_transmission;
						tx_stop_flag = 1'b1;
					end
				end else begin
					if(tx_stop_flag == 1'b1) begin
						// transmit start signal
						tx_data_in = TX_START_TRANSMISSION_BYTE;
						tx_start_transmission = ~ tx_start_transmission;
						tx_stop_flag = 1'b0;
					end else begin
						tx_data_in = tx_data_in;
						tx_start_transmission = tx_start_transmission;
						tx_stop_flag = tx_stop_flag;
					end
				end
			end
		end

		// buffer test logic
		reg [7:0] wr_count;
		initial begin
			wr_count = 8'b0;
		end
		assign wr_count_test = wr_count;

		always @(fifo_data_output) begin
			wr_count = wr_count + 1;
		end


endmodule

module test_bench();
	reg CLK;
	reg RESET;
	reg RX_DONE_TICK;
	reg [7:0] RX_DATA_OUT;
	wire TX_START_TRANSMISSION;
	wire [7:0] TX_DATA_IN;
	wire WR_EN;
	// test signals
	wire FIFO_POP;
	wire FIFO_PUSH;
	wire FIFO_FULL;
	wire FIFO_EMPTY;
	wire [7:0] FIFO_DATA_INPUT;
	wire [7:0] FIFO_DATA_OUTPUT;
	wire [7:0] FIFO_COUNT;
	wire [7:0] WR_COUNT;
	reg WR_FULL;
	wire TX_STOP_FLAG;

	// module instantiation
	traffic_generator traffic_generator_instance1(
		.clk(CLK),
		.reset(RESET),
		.rx_done_tick(RX_DONE_TICK),
		.rx_data_out(RX_DATA_OUT),
		.tx_start_transmission(TX_START_TRANSMISSION),
		.tx_data_in(TX_DATA_IN),
		.wr_en(WR_EN),
		// test signals
		.fifo_pop_test(FIFO_POP),
		.fifo_push_test(FIFO_PUSH),
		.fifo_empty_test(FIFO_EMPTY),
		.fifo_full_test(FIFO_FULL),
		.fifo_data_input_test(FIFO_DATA_INPUT),
		.fifo_data_output_test(FIFO_DATA_OUTPUT),
		.fifo_count_test(FIFO_COUNT),
		.wr_count_test(WR_COUNT),
		.wr_full(WR_FULL),
		.tx_stop_flag_test(TX_STOP_FLAG)
	);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			CLK,
			RESET,
			RX_DONE_TICK,
			RX_DATA_OUT,
			TX_START_TRANSMISSION,
			TX_DATA_IN,
			WR_EN,
			// test signals
			FIFO_POP,
			FIFO_PUSH,
			FIFO_EMPTY,
			FIFO_FULL,
			FIFO_DATA_INPUT,
			FIFO_DATA_OUTPUT,
			FIFO_COUNT,
			WR_COUNT,
			WR_FULL,
			TX_STOP_FLAG
		);
	end

	// clk
	initial begin
		CLK = 1'b0;
	end
	always begin
		#1 CLK = ~ CLK;
	end

	// reset
	initial begin
		RESET = 1'b0;
		#10 RESET = 1'b1;
		#2 RESET = 1'b0;	
	end

	// wr_full
	initial begin
		WR_FULL = 1'b0;
		#50 WR_FULL = 1'b1;
		#30 WR_FULL = 1'b0;
		#50 WR_FULL = 1'b1;
		#800 WR_FULL = 1'b0;
	end

	reg i = 1'b0;
	initial begin
		#1 RX_DATA_OUT = 0;
		for(i=0;i<100;i++) begin
			#10;
			RX_DATA_OUT = RX_DATA_OUT + 1;
			RX_DONE_TICK = 1'b1;
			#2 RX_DONE_TICK = 1'b0;
		end
	end

	initial begin
		#2000 $finish;
	end

endmodule