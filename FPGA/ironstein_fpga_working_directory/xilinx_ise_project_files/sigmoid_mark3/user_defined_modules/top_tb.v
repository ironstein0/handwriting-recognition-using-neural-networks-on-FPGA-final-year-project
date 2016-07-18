`include "top.v"

module test_bench();
	reg clk;
	reg reset_switch;
	wire reset;
	reg rx;
	wire tx;

	// module instantiation
	top top_instance1 (
		.clk(clk),
		.reset_switch(reset_switch),
		.reset(reset),
		.rx(rx),
		.tx(tx)
	);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			clk,
			reset_switch,
			reset,
			rx,
			tx
		);
	end

	initial begin
		// initializing registers
		clk = 0;
		reset_switch = 0;
		rx = 0;

		// add stimulus here


	end

	initial begin
		#1000 $finish;
	end

endmodule