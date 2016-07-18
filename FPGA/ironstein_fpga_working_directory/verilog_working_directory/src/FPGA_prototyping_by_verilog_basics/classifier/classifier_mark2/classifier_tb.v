`include "classifier.v"

module test_bench();
	reg clk;
	reg reset;
	reg start_conversion;
	// test signals 
	wire [31:0] no_neurons_layer0_test;
	wire [31:0] no_neurons_layer1_test;
	wire [31:0] no_neurons_layer2_test;

	// module instantiation
	classifier classifier_instance1 (
		.clk(clk),
		.reset(reset),
		.start_conversion(start_conversion),
		// test signals 
		.no_neurons_layer0_test(no_neurons_layer0_test),
		.no_neurons_layer1_test(no_neurons_layer1_test),
		.no_neurons_layer2_test(no_neurons_layer2_test)
	);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			clk,
			reset,
			start_conversion,
			// test signals 
			no_neurons_layer0_test,
			no_neurons_layer1_test,
			no_neurons_layer2_test
		);
	end

	initial begin
		// initializing registers
		clk = 0;
		reset = 0;
		start_conversion = 0;

		// add stimulus here


	end

	always #1 clk = ~ clk;

	initial begin
		#1000 $finish;
	end

endmodule