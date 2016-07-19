`include "counter.v"

module test_bench();
	reg clk;
	reg tick;
	reg reset;
	reg enable;
	reg logic_reset;
	wire [31:0] count;
	wire overflow;
	reg [31:0] count_threshold;

	// module instantiation
	counter counter_instance1 (
			.clk(clk),
			.tick(tick),
			.reset(reset),
			.enable(enable),
			.logic_reset(logic_reset),
			.count(count),
			.overflow(overflow),
			.count_threshold(count_threshold)
		);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			clk,
			tick,
			reset,
			enable,
			logic_reset,
			count,
			overflow,
			count_threshold
		);
	end

	initial begin
		// initializing registers
		clk = 0;
		tick = 0;
		reset = 1;
		enable = 1;
		logic_reset = 0;
		count_threshold = 10;

		// add stimulus here
		#59;
		@(posedge(clk));
		reset = 0;
		#59;
		@(posedge(clk));
		enable = 0;
		#59;
		@(posedge(clk));
		enable = 1;
		#59;
		@(posedge(clk));
		logic_reset = 1;
		#59;
		@(posedge(clk));
		logic_reset = 0;

	end

	always #1 clk = ~ clk;

	// always @(posedge(clk))begin
	// 	tick = ~ tick;
	// end

	always begin
		#10;
		@(negedge(clk));
		tick = ~ tick;
	end

	initial begin
		#1000 $finish;
	end

endmodule