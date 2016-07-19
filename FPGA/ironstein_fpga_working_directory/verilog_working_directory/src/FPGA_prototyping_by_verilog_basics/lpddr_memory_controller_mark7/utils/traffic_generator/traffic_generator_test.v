 `timescale 1ns / 1ps
`include "utils/my_fifo.v"
`include "utils/traffic_generator_pulse_generator.v"

module traffic_generator(
	// control signals
		input wire clk,
		input wire reset,
	// uart signals	
		input wire rx_done_tick,
		input wire [7:0] rx_data_out,
		output wire tx_start_transmission,
		output wire [7:0] tx_data_in,
		input wire tx_busy,
	// memory controller block interface signals
		// command path signals
			output wire cmd_clk,
			output wire cmd_en,
			output reg [5:0] cmd_bl,
			output reg [2:0] cmd_instr,
			output reg [29:0] cmd_byte_addr,
			input wire cmd_empty,
			input wire cmd_full,
		// write datapath signals
			output wire wr_clk,
			output wire wr_en,
			output wire [31:0] wr_data,
			output reg [3:0] wr_mask,
			input wire wr_full,
			input wire wr_empty,
			input wire [6:0] wr_count,
			input wire wr_underrun,
			input wire wr_error,
		// read datapath signals
			output wire rd_clk,
			output reg rd_en,
			input wire [31:0] rd_data,
			input wire rd_full,
			input wire rd_empty,
			input wire [6:0] rd_count,
			input wire rd_overflow,
			input wire rd_error,
	// test signals
	output wire  input_fifo_pop_test,
	output wire  input_fifo_push_test,
	output wire [31:0] input_fifo_input_test,
	output wire [31:0] input_fifo_output_test,
	output wire  input_fifo_full_test,
	output wire  input_fifo_empty_test,
	output wire [63:0] input_fifo_count_test,
	output wire  output_fifo_pop_test,
	output wire  output_fifo_push_test,
	output wire [7:0] output_fifo_input_test,
	output wire [7:0] output_fifo_input_next_test,
	output wire [7:0] output_fifo_output_test,
	output wire  output_fifo_full_test,
	output wire  output_fifo_empty_test,
	output wire [127:0] output_fifo_count_test,
	output wire  generate_input_fifo_pop_pulse_test,
	output wire  generate_input_fifo_push_pulse_test,
	output wire  generate_output_fifo_pop_pulse_test,
	output wire  generate_output_fifo_push_pulse_test,
	output wire  generate_command_enable_pulse_test,
	output wire  generate_output_fifo_push_pulse_next_test,
	output wire  check_output_fifo_empty_flag_test,
	output wire [2:0] state_reg_test,
	output wire [2:0] state_next_test,
	output wire [7:0] write_instruction_byte_count_reg_test,
	output wire [7:0] write_instruction_byte_count_next_test,
	output wire [7:0] read_instruction_byte_count_reg_test,
	output wire [7:0] read_instruction_byte_count_next_test,
	output wire [7:0] number_of_incoming_data_bytes_reg_test,
	output wire [7:0] number_of_incoming_data_bytes_next_test,
	output wire  generate_input_fifo_push_pulse_next_test,
	output wire [29:0] address_reg_test,
	output wire [29:0] address_next_test,
	output wire [2:0] address_byte_count_reg_test,
	output wire [2:0] address_byte_count_next_test,
	output wire [29:0] cmd_byte_addr_next_test,
	output wire  write_instruction_done_tick_test,
	output wire  write_instruction_done_tick_next_test,
	output wire  read_instruction_done_tick_test,
	output wire  read_instruction_done_tick_next_test,
	output wire  read_instruction_start_command_test,
	output wire  read_instruction_start_command_next_test,
	output wire [1:0] instruction_reg_test,
	output wire [1:0] instruction_next_test,
	output wire  check_input_fifo_empty_flag_test,
	output wire read_instruction_done_tick_delay_flag_test,
	output wire read_instruction_done_tick_delay_flag_next_test
	);
	
	// module instantiations
		// inupt fifo
			wire input_fifo_pop;
			assign input_fifo_pop_test = input_fifo_pop;
			wire input_fifo_push;
			assign input_fifo_push_test = input_fifo_push;
			wire [31:0] input_fifo_input;
			assign input_fifo_input_test = input_fifo_input;
			wire [31:0] input_fifo_output;
			assign input_fifo_output_test = input_fifo_output;
			wire input_fifo_full;
			assign input_fifo_full_test = input_fifo_full;
			wire input_fifo_empty;
			assign input_fifo_empty_test = input_fifo_empty;
			wire [63:0] input_fifo_count;
			assign input_fifo_count_test = input_fifo_count;

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
			assign output_fifo_pop_test = output_fifo_pop;
			wire output_fifo_push;
			assign output_fifo_push_test = output_fifo_push;
			reg [7:0] output_fifo_input;
			assign output_fifo_input_test = output_fifo_input;
			wire [7:0] output_fifo_output;
			assign output_fifo_output_test = output_fifo_output;
			wire output_fifo_full;
			assign output_fifo_full_test = output_fifo_full;
			wire output_fifo_empty;
			assign output_fifo_empty_test = output_fifo_empty;
			wire [127:0] output_fifo_count;
			assign output_fifo_count_test = output_fifo_count;
			
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
			assign generate_input_fifo_pop_pulse_test = generate_input_fifo_pop_pulse;
			
			traffic_generator_pulse_generator input_fifo_pop_pulse_generator (
				.clk(clk),
				.generate_pulse(generate_input_fifo_pop_pulse),
				.pulse(input_fifo_pop)
			);
			
		// input fifo push pulse generator
			reg generate_input_fifo_push_pulse;
			assign generate_input_fifo_push_pulse_test = generate_input_fifo_push_pulse;
			
			traffic_generator_pulse_generator input_fifo_push_pulse_generator (
				.clk(clk),
				.generate_pulse(generate_input_fifo_push_pulse),
				.pulse(input_fifo_push)
			);
			
		// output fifo pop pulse generator
			reg generate_output_fifo_pop_pulse;
			assign generate_output_fifo_pop_pulse_test = generate_output_fifo_pop_pulse;
			
			traffic_generator_pulse_generator output_fifo_pop_pulse_generator (
				.clk(clk),
				.generate_pulse(generate_output_fifo_pop_pulse),
				.pulse(output_fifo_pop)
			);
			
		// output fifo pop pulse generator
			reg generate_output_fifo_push_pulse;
			assign generate_output_fifo_push_pulse_test = generate_output_fifo_push_pulse;
			
			traffic_generator_pulse_generator output_fifo_push_pulse_generator (
				.clk(clk),
				.generate_pulse(generate_output_fifo_push_pulse),
				.pulse(output_fifo_push)
			);

		// command enable pulse generator
			reg generate_command_enable_pulse;
			assign generate_command_enable_pulse_test = generate_command_enable_pulse;

			traffic_generator_pulse_generator generate_command_enable_pulse_generator(
				.clk(clk),
				.generate_pulse(generate_command_enable_pulse),
				.pulse(cmd_en)
			);

	// constants
		localparam [7:0] 
			DONE_BYTE = 30;		// "d"
		
	// logic
			
		// uart and memory controller (only datapath) interface logic
			
			assign tx_data_in = output_fifo_output;
			
			/*
				generate_output_fifo_push_pulse
				output_fifo_input
			*/
				reg generate_output_fifo_push_pulse_next;
				assign generate_output_fifo_push_pulse_next_test = generate_output_fifo_push_pulse_next;
				reg [7:0] output_fifo_input_next;
				assign output_fifo_input_next_test = output_fifo_input_next;
				reg read_instruction_done_tick_delay_flag,read_instruction_done_tick_delay_flag_next;
				assign read_instruction_done_tick_delay_flag_test = read_instruction_done_tick_delay_flag;
				assign read_instruction_done_tick_delay_flag_next_test = read_instruction_done_tick_delay_flag_next;
				
				always @(posedge(clk),posedge(reset)) begin
					if(reset) begin
						generate_output_fifo_push_pulse <= 1'b0;
						output_fifo_input <= 0;
						read_instruction_done_tick_delay_flag <= 0;
					end else begin
						generate_output_fifo_push_pulse <= generate_output_fifo_push_pulse_next;
						output_fifo_input <= output_fifo_input_next;
						read_instruction_done_tick_delay_flag <= read_instruction_done_tick_delay_flag_next;
					end
				end

				always @* begin
					read_instruction_done_tick_delay_flag_next = 0;
					if((state_reg == reading_write_data) && (state_next == idle)) begin
						output_fifo_input_next = DONE_BYTE;
						generate_output_fifo_push_pulse_next = ~ generate_output_fifo_push_pulse;

					end else if(rd_en) begin
						output_fifo_input_next = rd_data[7:0];
						generate_output_fifo_push_pulse_next = ~ generate_output_fifo_push_pulse;

					end else if(read_instruction_done_tick_delay_flag == 1) begin
						output_fifo_input_next = DONE_BYTE;
						read_instruction_done_tick_delay_flag_next = 0;
						generate_output_fifo_push_pulse_next = ~ generate_output_fifo_push_pulse;
			
					end else if(read_instruction_done_tick_delay_flag == 0) begin
						generate_output_fifo_push_pulse_next = generate_output_fifo_push_pulse;
						output_fifo_input_next = output_fifo_input;
						
						if(read_instruction_done_tick) begin
							read_instruction_done_tick_delay_flag_next = 1;
						end else begin
							read_instruction_done_tick_delay_flag_next = read_instruction_done_tick_delay_flag;
						end

					end else begin
						output_fifo_input_next = output_fifo_input;
						generate_output_fifo_push_pulse_next = generate_output_fifo_push_pulse;
					end
				end
		
			/*
				generate_output_fifo_pop_pulse
			*/
				assign tx_start_transmission = output_fifo_pop;

				reg check_output_fifo_empty_flag;
				assign check_output_fifo_empty_flag_test = check_output_fifo_empty_flag;
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

			assign input_fifo_input = {24'b0,rx_data_out};
			assign wr_data = input_fifo_output;

			/*
				generate_input_fifo_push_pulse (state machine)
			*/
				// state declarations
				localparam [2:0]
					idle = 3'b000,
					read_address = 3'b001,
					read_data_length = 3'b010,
					reading_write_data = 3'b011,
					generate_read_data_command = 3'b100,
					reading_read_data = 3'b101;

				// constants
				localparam [7:0] 
					WRITE_START_BYTE = 255,
					READ_START_BYTE = 254;

				localparam [1:0] 
					WRITE_INSTRUCTION = 2'b00,
					READ_INSTRUCTION = 2'b01;
				
				// signal declarations
				reg [2:0] state_reg,state_next;
				assign state_reg_test = state_reg;
				assign state_next_test = state_next;
				reg [7:0] write_instruction_byte_count_reg,write_instruction_byte_count_next;
				assign write_instruction_byte_count_reg_test = write_instruction_byte_count_reg;
				assign write_instruction_byte_count_next_test = write_instruction_byte_count_next;
				reg [7:0] read_instruction_byte_count_reg,read_instruction_byte_count_next;
				assign read_instruction_byte_count_reg_test = read_instruction_byte_count_reg;
				assign read_instruction_byte_count_next_test = read_instruction_byte_count_next;
				reg [7:0] number_of_incoming_data_bytes_reg,number_of_incoming_data_bytes_next;
				assign number_of_incoming_data_bytes_reg_test = number_of_incoming_data_bytes_reg;
				assign number_of_incoming_data_bytes_next_test = number_of_incoming_data_bytes_next;
				reg generate_input_fifo_push_pulse_next;
				assign generate_input_fifo_push_pulse_next_test = generate_input_fifo_push_pulse_next;
				reg [29:0] address_reg,address_next;
				assign address_reg_test = address_reg;
				assign address_next_test = address_next;
				reg [2:0] address_byte_count_reg,address_byte_count_next;
				assign address_byte_count_reg_test = address_byte_count_reg;
				assign address_byte_count_next_test = address_byte_count_next;
				reg [29:0] cmd_byte_addr_next;
				assign cmd_byte_addr_next_test = cmd_byte_addr_next;
				reg write_instruction_done_tick,write_instruction_done_tick_next;
				assign write_instruction_done_tick_test = write_instruction_done_tick;
				assign write_instruction_done_tick_next_test = write_instruction_done_tick_next;
				reg read_instruction_done_tick,read_instruction_done_tick_next;
				assign read_instruction_done_tick_test = read_instruction_done_tick;
				assign read_instruction_done_tick_next_test = read_instruction_done_tick_next;
				reg read_instruction_start_command,read_instruction_start_command_next;
				assign read_instruction_start_command_test = read_instruction_start_command;
				assign read_instruction_start_command_next_test = read_instruction_start_command_next;
				reg [1:0] instruction_reg,instruction_next;
				assign instruction_reg_test = instruction_reg;
				assign instruction_next_test = instruction_next;
				reg rd_en_next;

				// state updation logic
				always @(posedge(clk),posedge(reset)) begin
					if(reset) begin
						state_reg <= idle;
						write_instruction_byte_count_reg <= 8'b0;
						read_instruction_byte_count_reg <= 8'b0;
						number_of_incoming_data_bytes_reg <= 8'b0;
						generate_input_fifo_push_pulse <= 1'b0;
						address_reg <= 0;
						address_byte_count_reg <= 0;
						cmd_byte_addr <= 0;
						write_instruction_done_tick <= 0;
						read_instruction_done_tick <= 0;
						read_instruction_start_command <= 0;
						instruction_reg <= 0;
						rd_en <= 0;
					end else begin
						state_reg <= state_next;
						write_instruction_byte_count_reg <= write_instruction_byte_count_next;
						read_instruction_byte_count_reg <= read_instruction_byte_count_next;
						number_of_incoming_data_bytes_reg <= number_of_incoming_data_bytes_next;
						generate_input_fifo_push_pulse <= generate_input_fifo_push_pulse_next;
						address_reg <= address_next;
						address_byte_count_reg <= address_byte_count_next;
						cmd_byte_addr <= cmd_byte_addr_next;
						write_instruction_done_tick <= write_instruction_done_tick_next;
						read_instruction_done_tick <= read_instruction_done_tick_next;
						read_instruction_start_command <= read_instruction_start_command_next;
						instruction_reg <= instruction_next;
						rd_en <= rd_en_next;
					end
				end
				
				// next state logic
				always @* begin
					number_of_incoming_data_bytes_next = number_of_incoming_data_bytes_reg;	// changes only once in read_data_length state
					generate_input_fifo_push_pulse_next = generate_input_fifo_push_pulse;// changes only in reading_write_data state
					address_next = address_reg;
					cmd_byte_addr_next = cmd_byte_addr;
					write_instruction_done_tick_next = 0;
					read_instruction_done_tick_next = 0;
					read_instruction_done_tick_next = 0;
					read_instruction_start_command_next = 0;
					instruction_next = instruction_reg;
					rd_en_next = 0;
					
					if(state_reg == idle) begin
						// mealey outputs
						write_instruction_byte_count_next = 8'b0;
						read_instruction_byte_count_next = 8'b0;
						address_byte_count_next = 3'b0;

						if(rx_done_tick) begin
							if(rx_data_out == WRITE_START_BYTE) begin
								state_next = read_address;
								instruction_next = WRITE_INSTRUCTION;
							end else if(rx_data_out == READ_START_BYTE) begin
								state_next = read_address;
								instruction_next = READ_INSTRUCTION;
							end else begin
								state_next = idle;
							end
						end else begin
							state_next = idle;
						end

					end else if(state_reg == read_address) begin
						// mealey outputs
						write_instruction_byte_count_next = 8'b0;
						read_instruction_byte_count_next = 8'b0;

						if(rx_done_tick) begin
							address_next = {address_reg[21:0],rx_data_out};
							if(address_byte_count_reg == 3) begin
								state_next = read_data_length;
								address_byte_count_next = 3'b0;
								cmd_byte_addr_next = address_next;
							end else begin
								state_next = read_address;
								address_byte_count_next = address_byte_count_reg + 1;
							end
						
						end else begin
							state_next = state_reg;
							address_byte_count_next = address_byte_count_reg;
						end
					
					end else if(state_reg == read_data_length) begin
						// mealey outputs
						write_instruction_byte_count_next = 8'b0;
						read_instruction_byte_count_next = 8'b0;
						address_byte_count_next = 3'b0;
						
						if(rx_done_tick) begin
							number_of_incoming_data_bytes_next = rx_data_out;
							if(instruction_reg == WRITE_INSTRUCTION) begin
								state_next = reading_write_data;
							end else if(instruction_reg == READ_INSTRUCTION) begin
								state_next = generate_read_data_command;
							end else begin
								state_next = idle;
							end
						end else begin
							state_next = read_data_length;
						end
					
					end else if(state_reg == reading_write_data) begin
						// mealey outputs
						address_byte_count_next = 3'b0;
						read_instruction_byte_count_next = 8'b0;
						
						if(write_instruction_byte_count_reg == number_of_incoming_data_bytes_reg) begin
							state_next = idle;
							write_instruction_done_tick_next = 1'b1;
							write_instruction_byte_count_next = 8'b0;
						end else begin
							state_next = reading_write_data;
							if(rx_done_tick) begin
								generate_input_fifo_push_pulse_next = ~ generate_input_fifo_push_pulse;
								write_instruction_byte_count_next = write_instruction_byte_count_reg + 1;
							end else begin
								write_instruction_byte_count_next = write_instruction_byte_count_reg;
							end
						end

					end else if(state_reg == generate_read_data_command) begin
						// mealey outputs
						address_byte_count_next = 3'b0;
						write_instruction_byte_count_next = 8'b0;
						read_instruction_byte_count_next = 8'b0;
						read_instruction_start_command_next = 1'b1;
						state_next = reading_read_data;

					end else if(state_reg == reading_read_data) begin
						// mealey outputs
						address_byte_count_next = 3'b0;
						write_instruction_byte_count_next = 8'b0;
						read_instruction_start_command_next = 1'b0;

						if(read_instruction_byte_count_reg == number_of_incoming_data_bytes_reg) begin
							state_next = idle;
							read_instruction_done_tick_next = 1'b1;
							read_instruction_byte_count_next = 8'b0;
						end else begin
							if(~rd_empty) begin
								read_instruction_byte_count_next = read_instruction_byte_count_reg + 1;
								if(rd_en == 1) begin
									rd_en_next = 0;
								end else begin
									rd_en_next = 1;
								end
							end else begin
								rd_en_next = 1'b0;
							end
						end
					
					end else begin
						write_instruction_byte_count_next = 8'b0;
						state_next = idle;
						address_byte_count_next = 3'b0;
					end
				end

			/*
				generate_input_fifo_pop_pulse
			*/
			assign wr_en = input_fifo_pop;
			
			reg check_input_fifo_empty_flag;
			assign check_input_fifo_empty_flag_test = check_input_fifo_empty_flag;
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

		// command path logic

			assign cmd_clk = clk;

			always @(posedge(clk),posedge(reset)) begin
				if(reset) begin
					generate_command_enable_pulse <= 1'b0;
					cmd_bl <= 0;
					cmd_instr <= 0;
					wr_mask <= 0;
				end else begin
					if(wr_full) begin
						cmd_bl <= 63;
						cmd_instr <= 2;
						generate_command_enable_pulse <= ~ generate_command_enable_pulse;
						wr_mask <= wr_mask;
					
					end else if(write_instruction_done_tick) begin
						cmd_bl <= number_of_incoming_data_bytes_reg;
						cmd_instr <= 2;
						generate_command_enable_pulse <= ~ generate_command_enable_pulse;
						wr_mask <= wr_mask;

					end else if(read_instruction_start_command) begin
						cmd_bl <= number_of_incoming_data_bytes_reg;
						cmd_instr <= 3;
						generate_command_enable_pulse <= ~ generate_command_enable_pulse;
						wr_mask <= wr_mask;

					end else begin
						cmd_bl <= cmd_bl;
						cmd_instr <= cmd_instr;
						generate_command_enable_pulse <= generate_command_enable_pulse;
						wr_mask <= wr_mask;
					end 
				end
			end

		// write datapath logic

			assign wr_clk = clk;

		// read datapath logic

			assign rd_clk = clk;
					
endmodule
