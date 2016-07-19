`include "traffic_generator.v"

module test_bench();
	reg clk;
	reg reset;
	reg rx_done_tick;
	reg [7:0] rx_data_out;
	wire tx_start_transmission;
	wire [7:0] tx_data_in;
	reg tx_busy;
	// test 
	reg wr_full;
	wire [31:0] wr_data;
	wire wr_en;

	// module instantiation
	traffic_generator traffic_generator_instance1 (
		.clk(clk),
		.reset(reset),
		.rx_done_tick(rx_done_tick),
		.rx_data_out(rx_data_out),
		.tx_start_transmission(tx_start_transmission),
		.tx_data_in(tx_data_in),
		.tx_busy(tx_busy),
		// test 
		.wr_full(wr_full),
		.wr_data(wr_data),
		.wr_en(wr_en)
	);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			clk,
			reset,
			rx_done_tick,
			rx_data_out,
			tx_start_transmission,
			tx_data_in,
			tx_busy,
			// test 
			wr_full,
			wr_data,
			wr_en
		);
	end

	initial begin
		// initializing registers
		clk <= 0;
		reset <= 0;
		rx_done_tick <= 0;
		rx_data_out <= 0;
		tx_busy <= 0;
		wr_full <= 0;
	end

	always begin
		#1 clk = ~ clk;
	end

	initial begin
		#10 reset <= 1;
		#2 reset <= 0;
	end

	reg [7:0] i;
	initial begin
		#30 rx_data_out <= 255;
		@(posedge(clk));
		rx_done_tick <= 1;
		#2 rx_done_tick <= 0;

		#29 rx_data_out <= 4;
		@(posedge(clk));
		rx_done_tick <= 1;
		#2 rx_done_tick <= 0;
		
		#29 rx_data_out <= 10;
		@(posedge(clk));
		rx_done_tick <= 1;
		#2 rx_done_tick <= 0;
		
		#10 wr_full <= 1;
		for(i=0;i<=3;i++) begin
			#29 rx_data_out <= i;
			@(posedge(clk));
			rx_done_tick <= 1;
			#2 rx_done_tick <= 0;
		end
		@(posedge(clk));
		wr_full <= 0;
	end	

	initial begin
		#1000 $finish;
	end

endmodule