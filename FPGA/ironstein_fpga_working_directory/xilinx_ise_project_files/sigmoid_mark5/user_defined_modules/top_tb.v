`include "top.v"

module test_bench();
	reg clk;
	reg reset_switch;
	wire reset;
	reg rx;
	wire tx;
	wire [7:0] tx_data_in_test;

	// module instantiation
	top top_instance1 (
		.clk(clk),
		.reset_switch(reset_switch),
		.reset(reset),
		.rx(rx),
		.tx(tx),
		.tx_data_in_test(tx_data_in_test)
	);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			clk,
			reset_switch,
			reset,
			rx,
			tx,
			tx_data_in_test
		);
	end

	initial begin
		// initializing registers
		clk = 0;
		reset_switch = 0;
		rx = 0;
	end
	
	initial begin
		reset_switch = 0;
		#2 reset_switch = 1;
	end
	
	always begin
		#1 clk = ~ clk;
	end
	
	initial begin
		#100 rx = 0;
		#10000 rx = 1;
	end

	initial begin
		#10000 $finish;
	end

endmodule