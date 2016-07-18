`timescale 1ns / 1ps
`include "../my_fifo/my_fifo_test.v"
`include "../pulse_generator/pulse_generator.v"

module traffic_generator(
	input wire clk,
	input wire reset,
	input wire rx_done_tick,
	input wire [7:0] rx_data_out,
	output wire tx_start_transmission,
	output wire [7:0] tx_data_in,
	input wire tx_busy,
	// memory controller block interface signals
	input wire wr_full,
	output wire [31:0] wr_data,
	output wire wr_en
	);
	
	// module instantiations
		// inupt fifo
			wire input_fifo_pop;
			wire input_fifo_push;
			wire [31:0] input_fifo_input;
			wire [31:0] input_fifo_output;
			wire input_fifo_full;
			wire input_fifo_empty;
			wire [63:0] input_fifo_count;

			fifo #(.data_size(8'd32),.buffer_size(8'd64)) 
				input_fifo(
					.clk(clk),
					.reset(reset),
					.read_data(input_fifo_pop),
					.write_data(input_fifo_push),
					.data_input(input_fifo_input),
					.data_output(input_fifo_output),
					.empty(input_fifo_empty)
				);

		// output fifo
			wire output_fifo_pop;
			wire output_fifo_push;
			reg [7:0] output_fifo_input;
			wire [7:0] output_fifo_output;
			wire output_fifo_full;
			wire output_fifo_empty;
			wire [127:0] output_fifo_count;
			
			fifo #(.data_size(8'd8),.buffer_size(8'd128))
				output_fifo(
					.clk(clk),
					.reset(reset),
					.read_data(output_fifo_pop),
					.write_data(output_fifo_push),
					.data_input(output_fifo_input),
					.data_output(output_fifo_output),
					.empty(output_fifo_empty)
				);
			
		// input fifo pop pulse generator
			reg generate_input_fifo_pop_pulse;
			
			pulse_generator input_fifo_pop_pulse_generator (
				.clk(clk),
				.generate_pulse(generate_input_fifo_pop_pulse),
				.pulse(input_fifo_pop)
			);
			
		// input fifo push pulse generator
			reg generate_input_fifo_push_pulse;
			
			pulse_generator input_fifo_push_pulse_generator (
				.clk(clk),
				.generate_pulse(generate_input_fifo_push_pulse),
				.pulse(input_fifo_push)
			);
			
		// output fifo pop pulse generator
			reg generate_output_fifo_pop_pulse;
			
			pulse_generator output_fifo_pop_pulse_generator (
				.clk(clk),
				.generate_pulse(generate_output_fifo_pop_pulse),
				.pulse(output_fifo_pop)
			);
			
		// output fifo pop pulse generator
			reg generate_output_fifo_push_pulse;
			
			pulse_generator output_fifo_push_pulse_generator (
				.clk(clk),
				.generate_pulse(generate_output_fifo_push_pulse),
				.pulse(output_fifo_push)
			);

	// constants
		localparam [7:0] 
			DONE_BYTE = 100;		// "d"
		
	// logic
		// output fifo logic
			assign tx_data_in = output_fifo_output;
			
			/*
				generate_output_fifo_push_pulse
				output_fifo_input
			*/
			reg generate_output_fifo_push_pulse_next;
			
			always @(posedge(clk),posedge(reset)) begin
				if(reset) begin
					generate_output_fifo_push_pulse <= 1'b0;
				end else begin
					generate_output_fifo_push_pulse <= generate_output_fifo_push_pulse_next;
				end
			end

			always @* begin
				if((state_reg == reading) && (state_next == idle)) begin
					output_fifo_input = DONE_BYTE;
					generate_output_fifo_push_pulse_next = ~ generate_output_fifo_push_pulse;
				end else begin
					output_fifo_input = DONE_BYTE;
					generate_output_fifo_push_pulse_next = generate_output_fifo_push_pulse;
				end
			end
		
			/*
				generate_output_fifo_pop_pulse
			*/
			reg check_output_fifo_empty_flag;
			always @(posedge(clk),posedge(reset)) begin
				if(reset) begin
					generate_output_fifo_pop_pulse <= 1'b0;
					check_output_fifo_empty_flag <= 1'b1;
				end else begin
					if((~tx_busy) && (~output_fifo_empty)) begin
						if(check_output_fifo_empty_flag == 1) begin
							generate_output_fifo_pop_pulse <= ~ generate_output_fifo_pop_pulse;
							check_output_fifo_empty_flag <= 0;
						end else begin
							generate_output_fifo_pop_pulse <= generate_output_fifo_pop_pulse;
							check_output_fifo_empty_flag <= 1;
						end
					end else begin
						generate_output_fifo_pop_pulse <= generate_output_fifo_pop_pulse;
						check_output_fifo_empty_flag <= check_output_fifo_empty_flag;
					end
				end
			end

			// always @(posedge(clk),posedge(reset)) begin
			// 	if(reset) begin
			// 		generate_output_fifo_pop_pulse <= 1'b0;
			// 	end else begin
			// 		if((~tx_busy) && (~output_fifo_empty)) begin
			// 			generate_output_fifo_pop_pulse <= ~ generate_output_fifo_pop_pulse;
			// 		end else begin
			// 			generate_output_fifo_pop_pulse <= generate_output_fifo_pop_pulse;
			// 		end
			// 	end
			// end
			
		 //input fifo logic
			assign input_fifo_input = {24'b0,rx_data_out};
			assign wr_data = input_fifo_output;

			/*
				generate_input_fifo_push_pulse (state machine)
			*/
				// state declarations
				localparam [1:0]
					idle = 2'b00,
					read_incoming_data_length = 2'b01,
					reading = 2'b10;
				
				// constants
				localparam [7:0] 
					START_BYTE = 255;
				
				// signal declarations
				reg [1:0] state_reg,state_next;
				reg [7:0] count_reg,count_next;
				reg [7:0] number_of_incoming_data_bytes_reg,number_of_incoming_data_bytes_next;
				reg generate_input_fifo_push_pulse_next;
				
				// state updation logic
				always @(posedge(clk),posedge(reset)) begin
					if(reset) begin
						state_reg <= idle;
						count_reg <= 8'b0;
						number_of_incoming_data_bytes_reg <= 8'b0;
						generate_input_fifo_push_pulse <= 1'b0;
					end else begin
						state_reg <= state_next;
						count_reg <= count_next;
						number_of_incoming_data_bytes_reg <= number_of_incoming_data_bytes_next;
						generate_input_fifo_push_pulse <= generate_input_fifo_push_pulse_next;

					end
				end
				
				// next state logic
				always @* begin
					number_of_incoming_data_bytes_next = number_of_incoming_data_bytes_reg;	// changes only once in read_incoming_data_length state
					generate_input_fifo_push_pulse_next = generate_input_fifo_push_pulse;// changes only in reading state
					
					if(state_reg == idle) begin
						// mealey outputs
						count_next = 8'b0;
						
						if((rx_done_tick) && (rx_data_out == START_BYTE)) begin
							state_next = read_incoming_data_length;
						end else begin
							state_next = idle;
						end
					
					end else if(state_reg == read_incoming_data_length) begin
						// mealey outputs
						count_next = 8'b0;
						
						if(rx_done_tick) begin
							number_of_incoming_data_bytes_next = rx_data_out;
							state_next = reading;
						end else begin
							state_next = read_incoming_data_length;
						end
					
					end else if(state_reg == reading) begin
						
						if(count_reg == number_of_incoming_data_bytes_reg) begin
							state_next = idle;
							// do something to indicate that all the reading is done
							// and to send all the data in the fifo
						end else begin
							if(rx_done_tick) begin
								generate_input_fifo_push_pulse_next = ~ generate_input_fifo_push_pulse;
								count_next = count_reg + 1;
							end else begin
								count_next = count_reg;
							end
						end
					
					end else begin
						count_next = 8'b0;
						state_next = idle;
					end
				end

			/*
				generate_input_fifo_pop_pulse
			*/
			assign wr_en = input_fifo_pop;
			
			reg check_input_fifo_empty_flag;
			always @(posedge(clk),posedge(reset)) begin
				if(reset) begin
					generate_input_fifo_pop_pulse <= 1'b0;
					check_input_fifo_empty_flag <= 1'b1;
				end else begin
					if((~wr_full) && (~input_fifo_empty)) begin
						if(check_input_fifo_empty_flag == 1) begin
							generate_input_fifo_pop_pulse <= ~ generate_input_fifo_pop_pulse;
							check_input_fifo_empty_flag <= 0;
						end else begin
							generate_input_fifo_pop_pulse <= generate_input_fifo_pop_pulse;
							check_input_fifo_empty_flag <= 1;
						end
					end else begin
						generate_input_fifo_pop_pulse <= generate_input_fifo_pop_pulse;
						check_input_fifo_empty_flag <= check_input_fifo_empty_flag;
					end
				end
			end
		
endmodule
