`include "classifier_test.v"

module test_bench();
	reg clk;
	reg reset;
	reg start_conversion;
	wire end_of_conversion;
	// test signals 
		wire [31:0] number_of_neurons_test;
		wire [31:0] number_of_weights_test;
		wire [31:0] layer_number_reg_test;
		wire [31:0] neuron_number_reg_test;
		wire [31:0] weight_number_reg_test;
		// address offset signals 
		wire [31:0] layer_address_offset_test;
		wire [31:0] weight_address_offset_test;
		wire [31:0] neuron_address_offset_test;
		// weight address offset counter signals 
		wire weight_address_offset_counter_tick_test;
		// neuron address offset counter signals 
		wire neuron_address_offset_counter_tick_test;
		wire neuron_address_offset_counter_pulse_test;
		// layer address offset counter signals 
		wire layer_address_offset_counter_tick_test;
		wire layer_address_offset_counter_pulse_test;
		// rom signals 
		wire rom_enable_test;
		wire [11:0] rom_address_test;
		wire [15:0] rom_data1_test;
		wire [15:0] rom_data2_test;
		// state machine related signals 
		wire [1:0] state_reg_test;
		wire [1:0] state_next_test;
		// rom related signals 
		wire rom_enable_next_test;
		// weight address offset counter signals 
		wire weight_address_offset_counter_enable_test;
		wire weight_address_offset_counter_enable_next_test;
		wire weight_address_offset_counter_logic_reset_test;
		wire weight_address_offset_counter_logic_reset_next_test;
		// neuron address offset counter signals 
		wire neuron_address_offset_counter_enable_test;
		wire neuron_address_offset_counter_enable_next_test;
		wire neuron_address_offset_counter_logic_reset_test;
		wire neuron_address_offset_counter_logic_reset_next_test;
		// layer address offset counter signals 
		wire layer_address_offset_counter_enable_test;
		wire layer_address_offset_counter_enable_next_test;
		wire layer_address_offset_counter_logic_reset_test;
		wire layer_address_offset_counter_logic_reset_next_test;
		// arithematic signals 
		wire [15:0] weight_test;
		wire [15:0] bias_test;
		wire [15:0] _input_test;
		wire [47:0] weighted_sum_test;
		wire [47:0] weighted_sum_next_test;
		wire sign_bit_test;
		wire [3:0] magnitude_test;
		wire [12:0] precision_test;
		// bram signals 
		wire [31:0] bram_write_address_offset_test;
		wire [31:0] bram_read_address_offset_test;
		wire [31:0] bram_write_address_test;
		wire [31:0] bram_read_address_test;
		wire bram_write_enable_test;
		// sigmoid signals 
		wire sigmoid_enable_test;
		wire [17:0] sigmoid_input_test;
		wire [47:0] sigmoid_output_test;

	// module instantiation
	classifier classifier_instance1 (
		.clk(clk),
		.reset(reset),
		.start_conversion(start_conversion),
		.end_of_conversion(end_of_conversion),
		// test signals 
		.number_of_neurons_test(number_of_neurons_test),
		.number_of_weights_test(number_of_weights_test),
		.layer_number_reg_test(layer_number_reg_test),
		.neuron_number_reg_test(neuron_number_reg_test),
		.weight_number_reg_test(weight_number_reg_test),
		// address offset signals 
		.layer_address_offset_test(layer_address_offset_test),
		.weight_address_offset_test(weight_address_offset_test),
		.neuron_address_offset_test(neuron_address_offset_test),
		// weight address offset counter signals 
		.weight_address_offset_counter_tick_test(weight_address_offset_counter_tick_test),
		// neuron address offset counter signals 
		.neuron_address_offset_counter_tick_test(neuron_address_offset_counter_tick_test),
		.neuron_address_offset_counter_pulse_test(neuron_address_offset_counter_pulse_test),
		// layer address offset counter signals 
		.layer_address_offset_counter_tick_test(layer_address_offset_counter_tick_test),
		.layer_address_offset_counter_pulse_test(layer_address_offset_counter_pulse_test),
		// rom signals 
		.rom_enable_test(rom_enable_test),
		.rom_address_test(rom_address_test),
		.rom_data1_test(rom_data1_test),
		.rom_data2_test(rom_data2_test),
		// state machine related signals 
		.state_reg_test(state_reg_test),
		.state_next_test(state_next_test),
		// rom related signals 
		.rom_enable_next_test(rom_enable_next_test),
		// weight address offset counter signals 
		.weight_address_offset_counter_enable_test(weight_address_offset_counter_enable_test),
		.weight_address_offset_counter_enable_next_test(weight_address_offset_counter_enable_next_test),
		.weight_address_offset_counter_logic_reset_test(weight_address_offset_counter_logic_reset_test),
		.weight_address_offset_counter_logic_reset_next_test(weight_address_offset_counter_logic_reset_next_test),
		// neuron address offset counter signals 
		.neuron_address_offset_counter_enable_test(neuron_address_offset_counter_enable_test),
		.neuron_address_offset_counter_enable_next_test(neuron_address_offset_counter_enable_next_test),
		.neuron_address_offset_counter_logic_reset_test(neuron_address_offset_counter_logic_reset_test),
		.neuron_address_offset_counter_logic_reset_next_test(neuron_address_offset_counter_logic_reset_next_test),
		// layer address offset counter signals 
		.layer_address_offset_counter_enable_test(layer_address_offset_counter_enable_test),
		.layer_address_offset_counter_enable_next_test(layer_address_offset_counter_enable_next_test),
		.layer_address_offset_counter_logic_reset_test(layer_address_offset_counter_logic_reset_test),
		.layer_address_offset_counter_logic_reset_next_test(layer_address_offset_counter_logic_reset_next_test),
		// arithematic signals 
		.weight_test(weight_test),
		.bias_test(bias_test),
		._input_test(_input_test),
		.weighted_sum_test(weighted_sum_test),
		.weighted_sum_next_test(weighted_sum_next_test),
		.sign_bit_test(sign_bit_test),
		.magnitude_test(magnitude_test),
		.precision_test(precision_test),
		// bram signals 
		.bram_write_address_offset_test(bram_write_address_offset_test),
		.bram_read_address_offset_test(bram_read_address_offset_test),
		.bram_write_address_test(bram_write_address_test),
		.bram_read_address_test(bram_read_address_test),
		.bram_write_enable_test(bram_write_enable_test),
		// sigmoid signals 
		.sigmoid_enable_test(sigmoid_enable_test),
		.sigmoid_input_test(sigmoid_input_test),
		.sigmoid_output_test(sigmoid_output_test)
	);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			clk,
			reset,
			start_conversion,
			end_of_conversion,
			// test signals 
				number_of_neurons_test,
				number_of_weights_test,
				layer_number_reg_test,
				neuron_number_reg_test,
				weight_number_reg_test,
				// address offset signals 
					layer_address_offset_test,
					weight_address_offset_test,
					neuron_address_offset_test,
				// weight address offset counter signals 
					weight_address_offset_counter_tick_test,
				// neuron address offset counter signals 
					neuron_address_offset_counter_tick_test,
					neuron_address_offset_counter_pulse_test,
				// layer address offset counter signals 
					layer_address_offset_counter_tick_test,
					layer_address_offset_counter_pulse_test,
				// rom signals 
					// rom_enable_test,
					// rom_address_test,
					rom_data1_test,
					rom_data2_test,
				// state machine related signals 
						// state_reg_test,
						// state_next_test,
						// rom related signals 
							// rom_enable_next_test,
						// weight address offset counter signals 
							// weight_address_offset_counter_enable_test,
							// weight_address_offset_counter_enable_next_test,
							// weight_address_offset_counter_logic_reset_test,
							// weight_address_offset_counter_logic_reset_next_test,
						// neuron address offset counter signals 
							// neuron_address_offset_counter_enable_test,
							// neuron_address_offset_counter_enable_next_test,
							// neuron_address_offset_counter_logic_reset_test,
							// neuron_address_offset_counter_logic_reset_next_test,
						// layer address offset counter signals 
							// layer_address_offset_counter_enable_test,
							// layer_address_offset_counter_enable_next_test,
							// layer_address_offset_counter_logic_reset_test,
							// layer_address_offset_counter_logic_reset_next_test,
				// arithematic signals 
					// weight_test,
					// bias_test,
					// _input_test,
					weighted_sum_test,
					// weighted_sum_next_test,
					// sign_bit_test,
					// magnitude_test,
					// precision_test,
				// bram signals 
					// bram_write_address_offset_test,
					// bram_read_address_offset_test,
					// bram_write_address_test,
					// bram_read_address_test,
					// bram_write_enable_test,
				// sigmoid signals 
					sigmoid_enable_test,
					sigmoid_input_test,
					sigmoid_output_test
		);
	end

	initial begin
		// initializing registers
		clk = 0;
		reset = 0;
		start_conversion = 0;

		// add stimulus here
		#10 reset = 1;
		#2 reset = 0;

		#10;
		@(posedge(clk));
		start_conversion = 1;
		#1;
		@(posedge(clk));
		start_conversion = 0;
		#10000;
		@(posedge(clk));
		start_conversion = 1;
		#1;
		@(posedge(clk));
		start_conversion = 0;

	end

	always #1 clk = ~ clk;

	initial begin
		#20000 $finish;
	end

endmodule