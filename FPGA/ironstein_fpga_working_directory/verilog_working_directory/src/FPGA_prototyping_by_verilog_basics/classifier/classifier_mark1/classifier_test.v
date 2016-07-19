`include "counter/counter.v"
`include "ROM/ROM.v"
`include "classifier_pulse_generator/classifier_pulse_generator.v"
`include "sigmoid_mark2/sigmoid_mark2.v"

module classifier(
	input wire clk,
	input wire reset,
	input wire start_conversion,
	output reg end_of_conversion,
	// test signals
		output wire [31:0] number_of_neurons_test,
		output wire [31:0] number_of_weights_test,
		output wire [31:0] layer_number_reg_test,
		output wire [31:0] neuron_number_reg_test,
		output wire [31:0] weight_number_reg_test,
		// address offset signals
			output wire [31:0] layer_address_offset_test,
			output wire [31:0] weight_address_offset_test,
			output wire [31:0] neuron_address_offset_test,
		// weight address offset counter signals
			output wire weight_address_offset_counter_tick_test,
		// neuron address offset counter signals
			output wire neuron_address_offset_counter_tick_test,
			output wire neuron_address_offset_counter_pulse_test,
		// layer address offset counter signals
			output wire layer_address_offset_counter_tick_test,
			output wire layer_address_offset_counter_pulse_test,
		// rom signals
			output wire rom_enable_test,
			output wire [11:0] rom_address_test,
			output wire [15:0] rom_data1_test,
			output wire [15:0] rom_data2_test,
		// state machine related signals
			output wire [1:0] state_reg_test,
			output wire [1:0] state_next_test,
			// rom related signals
				output wire rom_enable_next_test,
			// weight address offset counter signals
				output wire weight_address_offset_counter_enable_test,
				output wire weight_address_offset_counter_enable_next_test,
				output wire weight_address_offset_counter_logic_reset_test,
				output wire weight_address_offset_counter_logic_reset_next_test,
			// neuron address offset counter signals
				output wire neuron_address_offset_counter_enable_test,
				output wire neuron_address_offset_counter_enable_next_test,
				output wire neuron_address_offset_counter_logic_reset_test,
				output wire neuron_address_offset_counter_logic_reset_next_test,
			// layer address offset counter signals
				output wire layer_address_offset_counter_enable_test,
				output wire layer_address_offset_counter_enable_next_test,
				output wire layer_address_offset_counter_logic_reset_test,
				output wire layer_address_offset_counter_logic_reset_next_test,
		// arithematic signals
			output wire [15:0] weight_test,
			output wire [15:0] bias_test,
			output wire [15:0] _input_test,
			output wire [47:0] weighted_sum_test,
			output wire [47:0] weighted_sum_next_test,
			output wire sign_bit_test,
			output wire [3:0] magnitude_test,
			output wire [12:0] precision_test,
		// bram signals
			output wire [31:0] bram_write_address_offset_test,
			output wire [31:0] bram_read_address_offset_test,
			output wire [31:0] bram_write_address_test,
			output wire [31:0] bram_read_address_test,
			output wire bram_write_enable_test,
		// sigmoid signals
			output wire sigmoid_enable_test,
			output wire [17:0] sigmoid_input_test,
			output wire [47:0] sigmoid_output_test
	);
	
	// -------------- CONSTANTS AND ADDRESS OFFSET VALUES ---------------

		/* 
			no_neurons
			number_of_neurons
			number_of_weights
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

			reg [31:0] number_of_weights;
			assign number_of_weights_test = number_of_weights;
			reg [31:0] number_of_neurons;
			assign number_of_neurons_test = number_of_neurons;
			localparam [31:0] number_of_layers = 3;

			always @* begin
				number_of_neurons = no_neurons[layer_number_reg+1];
				number_of_weights = no_neurons[layer_number_reg];
			end

		/*
			bram_offset
			bram_write_address_offset
			bram_read_address_offset
		*/
			localparam [31:0] 
				bram_offset_layer0 = 0,
				bram_offset_layer1 = bram_offset_layer0 + no_neurons_layer0,
				bram_offset_layer2 = bram_offset_layer1 + no_neurons_layer1;

			reg [31:0] bram_offset [2:0];
			always @(posedge(clk),posedge(reset)) begin
				bram_offset[0] <= bram_offset_layer0;
				bram_offset[1] <= bram_offset_layer1;
				bram_offset[2] <= bram_offset_layer2;
			end

			reg [31:0] bram_write_address_offset;
			assign bram_write_address_offset_test = bram_write_address_offset;
			reg [31:0] bram_read_address_offset;
			assign bram_read_address_offset_test = bram_read_address_offset;

			always @* begin
				bram_write_address_offset = bram_offset[layer_number_reg + 1];
				bram_read_address_offset = bram_offset[layer_number_reg];
			end

		/*
			layer_number_reg
			neuron_number_reg
			weight_number_reg
			layer_address_offset
			weight_address_offset
			neuron_address_offset
		*/
		wire [31:0] layer_number_reg;
		assign layer_number_reg_test = layer_number_reg;
		wire [31:0] neuron_number_reg;
		assign neuron_number_reg_test = neuron_number_reg;
		wire [31:0] weight_number_reg;
		assign weight_number_reg_test = weight_number_reg;

		
		/*
			Ymi = summation(Xi * Wij)
		*/
		wire [31:0] layer_address_offset;	// m
		assign layer_address_offset_test = layer_address_offset;
		wire [31:0] weight_address_offset;	// i
		assign weight_address_offset_test = weight_address_offset;
		wire [31:0] neuron_address_offset;	// j
		assign neuron_address_offset_test = neuron_address_offset;

		assign layer_address_offset = layer_number_reg;
		assign neuron_address_offset = neuron_number_reg;
		assign weight_address_offset = weight_number_reg;

	// ---------------------- MODULE INSTANTIATIONS ---------------------

		/*
			weight_address_offset_counter_tick
			weight_address_offset_counter_enable
			weight_address_offset_counter_logic_reset
			neuron_address_offset_counter_tick
			neuron_address_offset_counter_enaable
			neuron_address_offset_counter_logic_reset
			layer_address_offset_counter_tick
			layer_address_offset_counter_enaable
			layer_address_offset_counter_logic_reset
			rom_address
			rom_enable
			rom_data
			bram_write_address
			bram_read_address
			bram_write_enable
		*/
			// module instantiations

				// counter instantiations
					// weight address offset counter
					reg weight_address_offset_counter_tick;
					assign weight_address_offset_counter_tick_test = weight_address_offset_counter_tick;
					reg weight_address_offset_counter_enable;
					assign weight_address_offset_counter_enable_test = weight_address_offset_counter_enable;
					reg weight_address_offset_counter_logic_reset;
					assign weight_address_offset_counter_logic_reset_test = weight_address_offset_counter_logic_reset;
					// neuron address offset counter
					wire neuron_address_offset_counter_tick;
					assign neuron_address_offset_counter_tick_test = neuron_address_offset_counter_tick;
					reg neuron_address_offset_counter_enable;
					assign neuron_address_offset_counter_enable_test = neuron_address_offset_counter_enable;
					reg neuron_address_offset_counter_logic_reset;
					assign neuron_address_offset_counter_logic_reset_test = neuron_address_offset_counter_logic_reset;
					// layer address offset counter
					wire layer_address_offset_counter_tick;
					assign layer_address_offset_counter_tick_test = layer_address_offset_counter_tick;
					reg layer_address_offset_counter_enable;
					assign layer_address_offset_counter_enable_test = layer_address_offset_counter_enable;
					reg layer_address_offset_counter_logic_reset;
					assign layer_address_offset_counter_logic_reset_test = layer_address_offset_counter_logic_reset;

					counter weight_address_offset_counter(
						.clk(clk),
						.tick(weight_address_offset_counter_tick),
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
						.enable(layer_address_offset_counter_enable),
						.logic_reset(layer_address_offset_counter_logic_reset),
						.count(layer_number_reg),
						.overflow(layer_address_offset_counter_output_tick),
						.count_threshold(number_of_layers)
					);

				// ROM instantiation
					reg rom_enable;
					assign rom_enable_test = rom_enable;
					reg [11:0] rom_address;
					assign rom_address_test = rom_address;
					wire [15:0] rom_data1;
					assign rom_data1_test = rom_data1;
					wire [15:0] rom_data2;
					assign rom_data2_test = rom_data2;

					ROM ROM_instance1(
						.clk(clk),
						.enable(rom_enable),
						.address(rom_address),
						.data1(rom_data1),
						.data2(rom_data2)
					);

				// BRAM instantiation
					reg [31:0] bram_read_address;
					assign bram_read_address_test = bram_read_address;
					reg [31:0] bram_write_address;
					assign bram_write_address_test = bram_write_address;
					reg bram_write_enable;
					assign bram_write_enable_test = bram_write_enable;

				// layer address offset counter pulse generator
					wire layer_address_offset_counter_pulse;
					assign layer_address_offset_counter_pulse_test = layer_address_offset_counter_pulse;

					classifier_pulse_generator layer_address_offset_counter_pulse_generator(
						.clk(clk),
						.reset(reset),
						.generate_pulse(layer_address_offset_counter_tick),
						.pulse(layer_address_offset_counter_pulse)
					);

				// neuron address offset counter pulse generator
					wire neuron_address_offset_counter_pulse;
					assign neuron_address_offset_counter_pulse_test = neuron_address_offset_counter_pulse;

					classifier_pulse_generator neuron_address_offset_counter_pulse_generator(
						.clk(clk),
						.reset(reset),
						.generate_pulse(neuron_address_offset_counter_tick),
						.pulse(neuron_address_offset_counter_pulse)
					);

				// sigmoid instantiations
					wire sigmoid_enable;
					assign sigmoid_enable_test = sigmoid_enable;
					assign sigmoid_enable = neuron_address_offset_counter_pulse;
					reg [17:0] sigmoid_input;
					assign sigmoid_input_test = sigmoid_input;
					wire [15:0] sigmoid_output;
					assign sigmoid_output_test = sigmoid_output;

					sigmoid sigmoid_instance1(
						.clk(clk),
						.reset(reset),
						.enable(sigmoid_enable),
						.x1(sigmoid_input),
						.fixed_op(sigmoid_output)
					);

	// --------- ENABLE AND LOGIC RESET SIGNALS  (STATE MACHINE) --------

		// state declarations
			localparam [1:0] 
				idle = 3'b00,
				first_layer = 3'b01,
				second_layer = 3'b10;

		/*
			weight_address_offset_counter_enable_next
			weight_address_offset_counter_logic_reset_next
			neuron_address_offset_counter_enable_next
			neuron_address_offset_counter_logic_reset_next
			layer_address_offset_counter_enable_next
			layer_address_offset_counter_logic_reset_next
			rom_enable_next
		*/
			reg weight_address_offset_counter_enable_next;
			assign weight_address_offset_counter_enable_next_test = weight_address_offset_counter_enable_next;
			reg weight_address_offset_counter_logic_reset_next;
			assign weight_address_offset_counter_logic_reset_next_test = weight_address_offset_counter_logic_reset_next;
			reg neuron_address_offset_counter_enable_next;
			assign neuron_address_offset_counter_enable_next_test = neuron_address_offset_counter_enable_next;
			reg neuron_address_offset_counter_logic_reset_next;
			assign neuron_address_offset_counter_logic_reset_next_test = neuron_address_offset_counter_logic_reset_next;
			reg layer_address_offset_counter_enable_next;
			assign layer_address_offset_counter_enable_next_test = layer_address_offset_counter_enable_next;
			reg layer_address_offset_counter_logic_reset_next;
			assign layer_address_offset_counter_logic_reset_next_test = layer_address_offset_counter_logic_reset_next;
			reg rom_enable_next;
			assign rom_enable_next_test = rom_enable_next;

		/*
			weight_address_offset_counter_tick
		*/
			always @(negedge(clk),posedge(reset)) begin
				if(reset) begin
					weight_address_offset_counter_tick <= 0;;
				end else begin
					if(state_reg == idle) begin
						weight_address_offset_counter_tick <= 0;
					end else begin
						weight_address_offset_counter_tick <= ~ weight_address_offset_counter_tick;					
					end
				end
			end

		// state machine for controlling enable and logic reset signals

			reg [1:0] state_reg,state_next;
			assign state_reg_test = state_reg;
			assign state_next_test = state_next;
			reg end_of_conversion_next;

			always @(posedge(clk),posedge(reset)) begin
				if(reset) begin
					state_reg <= idle;
					weight_address_offset_counter_enable <= 1;
					weight_address_offset_counter_logic_reset <= 0;
					neuron_address_offset_counter_enable <= 1;
					neuron_address_offset_counter_logic_reset <= 0;
					layer_address_offset_counter_enable <= 1;
					layer_address_offset_counter_logic_reset <= 0;
					rom_enable <= 1;
					end_of_conversion <= 0;
					// arithematic signals
				end else begin
					state_reg <= state_next;
					weight_address_offset_counter_enable <= weight_address_offset_counter_enable_next;
					weight_address_offset_counter_logic_reset <= weight_address_offset_counter_logic_reset_next;
					neuron_address_offset_counter_enable <= neuron_address_offset_counter_enable_next;
					neuron_address_offset_counter_logic_reset <= neuron_address_offset_counter_logic_reset_next;
					layer_address_offset_counter_enable <= layer_address_offset_counter_enable_next;
					layer_address_offset_counter_logic_reset <= layer_address_offset_counter_logic_reset_next;
					rom_enable <= rom_enable_next;
					end_of_conversion <= end_of_conversion_next;
					// arithematic signals
				end
			end

			always @* begin
				if(state_reg == idle) begin
					end_of_conversion_next <= 0;
					if(start_conversion) begin
						state_next = first_layer;
						weight_address_offset_counter_logic_reset_next = 0;
						neuron_address_offset_counter_logic_reset_next = 0;
						layer_address_offset_counter_logic_reset_next = 0;
						weight_address_offset_counter_enable_next = 1;
						neuron_address_offset_counter_enable_next = 1;
						layer_address_offset_counter_enable_next = 1;
						rom_enable_next = 1;
					end else begin
						state_next = idle;
						weight_address_offset_counter_logic_reset_next = 1;
						neuron_address_offset_counter_logic_reset_next = 1;
						layer_address_offset_counter_logic_reset_next = 1;
						weight_address_offset_counter_enable_next = 0;
						neuron_address_offset_counter_enable_next = 0;
						layer_address_offset_counter_enable_next = 0;
						rom_enable_next = 0;
					end

				end else if(state_reg == first_layer) begin
					// mealey outputs
					end_of_conversion_next <= 0;
					weight_address_offset_counter_enable_next = 1;
					neuron_address_offset_counter_enable_next = 1;
					layer_address_offset_counter_enable_next = 1;
					weight_address_offset_counter_logic_reset_next = 0;
					neuron_address_offset_counter_logic_reset_next = 0;
					layer_address_offset_counter_logic_reset_next = 0;
					rom_enable_next = 1;

					if(layer_address_offset_counter_pulse) begin
						state_next = second_layer;
					end else begin
						state_next = first_layer;
					end

				end else if(state_reg == second_layer) begin
					weight_address_offset_counter_enable_next = 1;
					neuron_address_offset_counter_enable_next = 1;
					layer_address_offset_counter_enable_next = 1;
					weight_address_offset_counter_logic_reset_next = 0;
					neuron_address_offset_counter_logic_reset_next = 0;
					layer_address_offset_counter_logic_reset_next = 0;
					rom_enable_next = 1;

					if(layer_address_offset_counter_pulse) begin
						end_of_conversion_next <= 1;
						state_next = idle;
					end else begin
						end_of_conversion_next <= 0;
						state_next = second_layer;
					end

				end else begin
					state_next = idle;
					weight_address_offset_counter_logic_reset_next = 1;
					neuron_address_offset_counter_logic_reset_next = 1;
					layer_address_offset_counter_logic_reset_next = 1;
					weight_address_offset_counter_enable_next = 0;
					neuron_address_offset_counter_enable_next = 0;
					layer_address_offset_counter_enable_next = 0;
					rom_enable_next = 0;
				end
			end

	// ---------- ROM AND BRAM ADDRESS ( AND BRAM WRITE ENABLE) ---------

		/*
			rom_address
			bram_read_address
		*/
			always @(negedge(clk),posedge(reset)) begin
				if(reset) begin
					rom_address <= 0;
					bram_read_address <= 0;
				end else begin
					if(state_reg == idle) begin
						rom_address <= 0;
						bram_read_address <= bram_read_address_offset;
					end else begin
						rom_address <= rom_address + 1;
						if(bram_write_address == bram_write_address_offset + number_of_neurons - 1) begin
							if(bram_read_address + bram_read_address_offset == bram_write_address_offset - 1) begin
								bram_read_address <= bram_write_address_offset;
							end else begin
								bram_read_address <= bram_read_address + 1;
							end
						end else begin
							if(bram_read_address == bram_write_address_offset - 1) begin
								bram_read_address <= bram_read_address_offset;
							end else begin
								bram_read_address <= bram_read_address + 1;
							end
						end
					end
				end
			end

		/*
			bram_write_address
			bram_write_enable
		*/
			always @(posedge(clk),posedge(reset)) begin
				if(reset) begin
					bram_write_address <= 0;
					bram_write_enable <= 0;
				end else begin
					if(state_reg == idle) begin
						bram_write_address <= bram_write_address_offset;
						bram_write_enable <= 0;
					end else begin
						if(neuron_address_offset_counter_pulse) begin
							bram_write_address <= bram_write_address + 1;
							bram_write_enable <= 1;
						end else begin
							bram_write_address <= bram_write_address;
							bram_write_enable <= 0;
						end	
					end
				end
			end

	// ------------------------ ARITHEMATIC -----------------------------

		/*
			weighted_sum
			weighted_sum_next
		*/
			reg [47:0] weighted_sum,weighted_sum_next;
			assign weighted_sum_test = weighted_sum;
			assign weighted_sum_next_test = weighted_sum_next;

			always @(negedge(clk),posedge(reset)) begin
				if(reset) begin
					weighted_sum <= 0;
				end else begin
					weighted_sum <= weighted_sum_next;
				end
			end

			always @* begin
				if(state_reg == idle) begin
					weighted_sum_next = weighted_sum;
				end else begin
					if(bram_write_enable) begin
						weighted_sum_next = 0;
					end else begin
						weighted_sum_next = _input_*weight + weighted_sum;
					end
				end
			end

		/*
			weight
			_input_
		*/

			reg [15:0] weight;
			assign weight_test = weight;
			reg [15:0] bias;
			assign bias_test = bias;
			reg [15:0] _input_;
			assign _input_test = _input_;
			
			always @* begin
				weight = rom_data1;
			end

			always @* begin
				bias = rom_data2;
			end

			always @(posedge(clk),posedge(reset)) begin
				if(reset) begin
					// weight <= 0;
					_input_ <= 0;
				end else begin
					// weight <= rom_data;
					_input_ <= 1;
					// _input_ <= bram_data;
				end
			end

		/*
			sigmoid_input
			sign_bit,sign_bit_next,
			magnitude,magnitude_next,
			precision,precision_next
		*/
			reg sign_bit;
			assign sign_bit_test = sign_bit;
			reg [3:0] magnitude;
			assign magnitude_test = magnitude;
			reg [12:0] precision;
			assign precision_test = precision;

			always @* begin
				sign_bit = weighted_sum[47];
			end

			always @* begin
				if(weighted_sum[46:27] > 16) begin
					magnitude = 16;
				end else begin
					magnitude = weighted_sum[30:27];
				end
			end

			always @* begin
				precision = weighted_sum[26:14];
			end

			always @* begin
				sigmoid_input = {sign_bit,magnitude,precision};
			end

	// ------------------------------------------------------------------

endmodule