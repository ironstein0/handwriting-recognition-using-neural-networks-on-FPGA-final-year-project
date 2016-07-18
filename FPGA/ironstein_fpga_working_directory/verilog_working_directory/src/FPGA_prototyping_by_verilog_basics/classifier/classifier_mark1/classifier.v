`include "counter.v"
`include "ROM/ROM.v"

module classifier(
	input wire clk,
	input wire reset,
	input wire start_conversion,
	// test signals
	output wire [31:0] no_neurons_layer0_test,
	output wire [31:0] no_neurons_layer1_test,
	output wire [31:0] no_neurons_layer2_test
	);
	
	/* 
		no_neurons
	*/
		// defined like so because localparams need not be initialized
		// but localparams can not be declared as register files
		localparam [31:0] 
			no_neurons_layer0 = 400,
			no_neurons_layer1 = 10,
			no_neurons_layer2 = 5;

		reg [31:0] no_neurons [2:0];

		always @(posedge(clk),posedge(reset)) begin
			no_neurons[0] <= no_neurons_layer0;
			no_neurons[1] <= no_neurons_layer1;
			no_neurons[2] <= no_neurons_layer2;
		end

		// test signals
		assign no_neurons_layer0_test = no_neurons[0];
		assign no_neurons_layer1_test = no_neurons[1];
		assign no_neurons_layer2_test = no_neurons[2];

	reg [31:0] layer_number_reg;
	wire [31:0] neuron_number_reg;
	wire [31:0] weight_number_reg;

	always @* begin
		number_of_neurons = no_neurons[layer_number_reg+1];
		number_of_weights = no_neurons[layer_number_reg];
	end
	localparam [31:0] number_of_layers = 3;

	/*
		Ymi = summation(Xi * Wij)
	*/
	wire [31:0] layer_address_offset;	// m
	wire [31:0] weight_address_offset;	// i
	wire [31:0] neuron_address_offset;	// j
	assign layer_address_offset = layer_number_reg;
	assign weight_address_offset = weight_number_reg;
	assign neuron_address_offset = neuron_number_reg;

	// module instantiations

		// counter instantiations
			// weight address offset counter
			reg weight_address_offset_counter_tick;
			reg weight_address_offset_counter_enable;
			reg weight_address_offset_counter_logic_reset;
			// neuron address offset counter
			wire neuron_address_offset_counter_tick;
			reg neuron_address_offset_counter_enable;
			reg neuron_address_offset_counter_logic_reset;
			// layer address offset counter
			wire layer_address_offset_counter_tick;
			reg layer_address_offset_counter_enable;
			reg layer_address_offset_counter_logic_reset;

			counter weight_address_offset_counter(
				.clk(clk),
				.tick(),
				.reset(reset),
				.enable(weight_address_offset_counter_enable),
				.logic_reset(weight_address_offset_counter_logic_reset),
				.count(weight_number_reg),
				.overflow(neuron_address_offset_counter_tick),
				.count_threshold(number_of_weights)
			);

			counter neuron_address_offset_counter(
				.clk(clk),
				.tick(neuron_address_offset_counter_tick),
				.reset(reset),
				.enable(neuron_address_offset_counter_enable),
				.logic_reset(neuron_address_offset_counter_logic_reset),
				.count(neuron_number_reg),
				.overflow(layer_address_offset_counter_tick),
				.count_threshold(number_of_neurons)
			);

			counter layer_address_offset_counter(
				.clk(clk),
				.tick(layer_address_offset_counter_tick),
				.reset(reset),
				.enable(layer_number_reg),
				.logic_reset(layer_address_offset_counter_logic_reset),
				.count(layer_address_offset),
				.overflow(layer_address_offset_counter_output_tick),
				.count_threshold(number_of_layers)
			);

		// ROM instantiation
			reg rom_enable;
			reg [11:0] rom_address;
			wire [15:0] rom_data;

			ROM ROM_instance1(
				.clk(clk),
				.enable(rom_enable),
				.address(rom_address),
				.data(rom_data)
			);

	// state declarations
	localparam [1:0] 
		first_layer = 3'b00,
		second_layer = 3'b01;


endmodule