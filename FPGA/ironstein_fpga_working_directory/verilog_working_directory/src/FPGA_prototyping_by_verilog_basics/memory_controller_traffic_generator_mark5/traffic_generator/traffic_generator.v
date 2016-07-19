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
		// command path signals
			output wire cmd_clk,
			output wire cmd_en,
			output wire [5:0] cmd_bl,
			output wire [2:0] cmd_instr,
			output reg [29:0] cmd_addr,
			input wire cmd_full,
			input wire cmd_empty,
		// write datapath signals
			output wire wr_clk,
			output wire wr_en,
			output wire [31:0] wr_data,
			// output wire wr_mask,
			input wire wr_full,
			input wire wr_empty,
			input wire wr_underrun,
			input wire [6:0] wr_count,
			input wire wr_error,
		// read datapath signals
			output wire rd_clk,
			output wire rd_en,
			input wire [31:0] rd_data,
			input wire rd_empty,
			input wire rd_full,
			input wire rd_overflow,
			input wire [6:0] rd_count,
			input wire rd_error
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

		// command enable pulse generator
			reg generate_command_enable_pulse;

			pulse_generator generate_command_enable_pulse_generator(
				.clk(clk),
				.generate_pulse(generate_command_enable_pulse),
				.pulse(cmd_en)
			);

	// constants
		localparam [7:0] 
			DONE_BYTE = 30;		// "d"
		
	// logic
		// output fifo logic
			assign tx_data_in = output_fifo_output;
			
			/*
				generate_output_fifo_push_pulse
				output_fifo_input
			*/
			reg generate_output_fifo_push_pulse_next;
			assign generate_output_fifo_push_pulse_next_test = generate_output_fifo_push_pulse_next;
			
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
			assign tx_start_transmission = output_fifo_pop;

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
			
		// input fifo logic
			assign input_fifo_input = {24'b0,rx_data_out};
			assign wr_data = input_fifo_output;

			/*
				generate_input_fifo_push_pulse (state machine)
			*/
				// state declarations
				localparam [1:0]
					idle = 2'b00,
					read_write_address = 2'b01,
					read_incoming_data_length = 2'b10,
					reading = 2'b11;
				
				// constants
				localparam [7:0] 
					START_BYTE = 255;
				
				// signal declarations
				reg [1:0] state_reg,state_next;
				reg [7:0] count_reg,count_next;
				reg [7:0] number_of_incoming_data_bytes_reg,number_of_incoming_data_bytes_next;
				reg generate_input_fifo_push_pulse_next;
				reg [29:0] write_address_reg,write_address_next;
				reg [2:0] write_address_byte_count_reg,write_address_byte_count_next;
				reg [29:0] cmd_addr_next;
				reg done_tick,done_tick_next;

				// state updation logic
				always @(posedge(clk),posedge(reset)) begin
					if(reset) begin
						state_reg <= idle;
						count_reg <= 8'b0;
						number_of_incoming_data_bytes_reg <= 8'b0;
						generate_input_fifo_push_pulse <= 1'b0;
						write_address_reg <= 0;
						write_address_byte_count_reg <= 0;
						cmd_addr <= 0;
						done_tick <= 0;
					end else begin
						state_reg <= state_next;
						count_reg <= count_next;
						number_of_incoming_data_bytes_reg <= number_of_incoming_data_bytes_next;
						generate_input_fifo_push_pulse <= generate_input_fifo_push_pulse_next;
						write_address_reg <= write_address_next;
						write_address_byte_count_reg <= write_address_byte_count_next;
						cmd_addr <= cmd_addr_next;
						done_tick <= done_tick_next;
					end
				end
				
				// next state logic
				always @* begin
					number_of_incoming_data_bytes_next = number_of_incoming_data_bytes_reg;	// changes only once in read_incoming_data_length state
					generate_input_fifo_push_pulse_next = generate_input_fifo_push_pulse;// changes only in reading state
					write_address_next = write_address_reg;
					cmd_addr_next = cmd_addr;
					done_tick_next = 0;
					
					if(state_reg == idle) begin
						// mealey outputs
						count_next = 8'b0;
						write_address_byte_count_next = 3'b0;

						if((rx_done_tick) && (rx_data_out == START_BYTE)) begin
							state_next = read_write_address;
						end else begin
							state_next = idle;
						end

					end else if(state_reg == read_write_address) begin
						// mealey outputs
						count_next = 8'b0;

						if(rx_done_tick) begin
							write_address_next = {write_address_reg[21:0],rx_data_out};
							if(write_address_byte_count_reg == 3) begin
								state_next = read_incoming_data_length;
								write_address_byte_count_next = 3'b0;
								cmd_addr_next = write_address_next;
							end else begin
								state_next = read_write_address;
								write_address_byte_count_next = write_address_byte_count_reg + 1;
							end
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
							done_tick_next = 1'b1;
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

		// command datapath logic

			always @(posedge(clk),posedge(reset)) begin
				if(reset) begin
					generate_command_enable_pulse <= 1'b0;
				end else begin
					if((wr_full) || (done_tick)) begin
						generate_command_enable_pulse <= ~ generate_command_enable_pulse;
					end
				end
			end
					
endmodule
