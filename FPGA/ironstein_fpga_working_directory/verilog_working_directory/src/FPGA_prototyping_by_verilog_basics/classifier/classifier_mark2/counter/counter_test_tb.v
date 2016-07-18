`include "counter_test.v"

module test_bench();
	reg clk;
	reg tick;
	reg reset;
	reg enable;
	reg logic_reset;
	wire [31:0] count1;
	wire [31:0] count2;
	wire overflow1;
	wire overflow2;
	// test signals 
	wire [31:0] count_next_test1;
	wire [31:0] count_next_test2;
	reg [31:0] count_threshold;
	wire tick_pulse_test1;
	wire tick_pulse_test2;
	wire overflow_pulse_test1;
	wire overflow_pulse_test2;

	// module instantiation
	counter counter_instance1 (
			.clk(clk),
			.tick(tick),
			.reset(reset),
			.enable(enable),
			.logic_reset(logic_reset),
			.count(count1),
			.overflow(overflow1),
			.count_threshold(count_threshold),
			// test signals 
			.count_next_test(count_next_test1),
			.tick_pulse_test(tick_pulse_test1),
			.overflow_pulse_test(overflow_pulse_test1)
		);

	counter counter_instance2 (
			.clk(clk),
			.tick(overflow1),
			.reset(reset),
			.enable(enable),
			.logic_reset(logic_reset),
			.count(count2),
			.overflow(overflow2),
			.count_threshold(count_threshold),
			// test signals 
			.count_next_test(count_next_test2),
			.tick_pulse_test(tick_pulse_test2),
			.overflow_pulse_test(overflow_pulse_test2)
		);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			clk,
			tick,
			reset,
			enable,
			logic_reset,
			count1,
			count2,
			overflow1,
			overflow2,
			count_threshold,
			// test signals 
			count_next_test1,
			count_next_test2,
			tick_pulse_test1,
			tick_pulse_test2,
			overflow_pulse_test1,
			overflow_pulse_test2
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

	always begin
		#100;
		@(negedge(clk)) tick = ~ tick;
	end

	initial begin
		#50000 $finish;
	end

endmodule