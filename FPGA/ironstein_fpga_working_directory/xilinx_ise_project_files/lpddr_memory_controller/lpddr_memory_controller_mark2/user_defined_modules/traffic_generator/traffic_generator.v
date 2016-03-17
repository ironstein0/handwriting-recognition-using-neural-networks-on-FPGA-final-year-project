`include "fifo.v"

module traffic_generator(
	// control signals
	input wire clk,
	input wire reset,
	// uart signals
	input wire [7:0] rx_data_out,
	output reg [7:0] tx_data_in,
	input wire rx_done_tick,
	output reg tx_start_transmission,
	// lpddr_memory_controller signals
	output wire wr_en,
	output wire [7:0] fifo_data_output,
	// test signals
	input wire wr_full
	);

	// signal declarations
	reg tx_stop_flag;		// if 1 means stop condition has been transmitted
							// if 0 means start condition has been transmitted

	// module instantiations
		reg fifo_pop;
		assign wr_en = fifo_pop;
		reg fifo_push;
		wire fifo_full;
		wire fifo_empty;
		wire [31:0] fifo_count;

		fifo #(.data_size(4'd8),.buffer_size(6'd63))
			intermediate_fifo(
				.clk(clk),
				.reset(reset),
				.read_data(fifo_pop),
				.write_data(fifo_push),
				.full(fifo_full),
				.empty(fifo_empty),
				.data_input(rx_data_out),
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

endmodule

module test_bench();
	reg CLK;
	reg RESET;
	reg RX_DONE_TICK;
	reg [7:0] RX_DATA_OUT;
	wire TX_START_TRANSMISSION;
	wire [7:0] TX_DATA_IN;
	wire WR_EN;
	wire [7:0] FIFO_DATA_OUT;

	
	// module instantiation
	traffic_generator traffic_generator_instance1(
		.clk(CLK),
		.reset(RESET),
		.rx_done_tick(RX_DONE_TICK),
		.rx_data_out(RX_DATA_OUT),
		.tx_start_transmission(TX_START_TRANSMISSION),
		.tx_data_in(TX_DATA_IN),
		.wr_en(WR_EN),
		.fifo_data_out(FIFO_DATA_OUT)
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
			FIFO_DATA_OUT
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