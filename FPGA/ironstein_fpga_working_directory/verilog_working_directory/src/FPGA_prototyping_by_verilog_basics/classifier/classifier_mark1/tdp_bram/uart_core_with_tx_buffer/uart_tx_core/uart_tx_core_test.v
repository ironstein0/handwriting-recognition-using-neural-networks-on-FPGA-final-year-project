//`timescale 1ns / 1ps
`include "utils/tx_baudrate_tick_generator.v"
`include "utils/pulse_generator.v"
`include "utils/my_fifo.v"
`include "utils/fifo_ipcore_dir/FIFO.v"
//`include "utils/reset_controller.v"
//`include "utils/tx_tick_generator.v"

module uart_tx_core
	#(	parameter NO_OF_DATABITS = 8,
		parameter NO_OF_STOPBITS = 1,
		parameter BAUDRATE = 32'd9600,
		parameter FREQUENCY = 32'd100000000
		)(
		// control signals
		input wire clk,				
		input wire reset,       	
		input wire start_transmission,
		output reg busy,
		// data signals
		input wire [NO_OF_DATABITS-1:0] data_in,
		output reg tx,
		// test signals
		output wire  tx_baudrate_tick_generator_enable_test,
		output wire  fifo_push_test,
		output wire  fifo_pop_test,
		output wire  fifo_full_test,
		output wire  fifo_empty_test,
		output wire [7:0] fifo_input_test,
		output wire [7:0] fifo_output_test,
		output wire [6:0] fifo_count_test,
		output wire  generate_fifo_push_pulse_test,
		output wire  generate_fifo_pop_pulse_test,
		output wire [1:0] state_reg_test,
		output wire [1:0] state_next_test,
		output wire [3:0] count_test,
		output wire [3:0] count_next_test,
		output wire  busy_next_test,
		output wire [NO_OF_DATABITS-1:0] shift_reg_test,
		output wire [NO_OF_DATABITS-1:0] shift_reg_next_test,
		output wire  tx_next_test,
		output wire  generate_fifo_pop_pulse_next_test,
		output wire [1:0] wait_count_test,
		output wire [1:0] wait_count_next_test
		);
	
	// module instantitation
		// tx baudrate tick generator initialization
		reg tx_baudrate_tick_generator_enable;
		assign tx_baudrate_tick_generator_enable_test = tx_baudrate_tick_generator_enable;
		
		tx_baudrate_tick_generator #(.baudrate(BAUDRATE),.frequency(FREQUENCY))
			T1(
				.clk(clk),
				.reset(reset),
				.enable(tx_baudrate_tick_generator_enable),
				.tick(tick)
			);
		
		// pulse generator initialization
		pulse_generator #(.PULSE_WIDTH(32'd1))
			T2(
			.clk(clk),
			.reset(reset),
			.generate_pulse(start_transmission),
			.pulse(tx_start_transmission)
		);

		wire fifo_push;
		assign fifo_push_test = fifo_push;
		wire fifo_pop;
		assign fifo_pop_test = fifo_pop;
		wire fifo_full;
		assign fifo_full_test = fifo_full;
		wire fifo_empty;
		assign fifo_empty_test = fifo_empty;
		wire [7:0] fifo_input;
		assign fifo_input_test = fifo_input;
		assign fifo_input = data_in;
		wire [7:0] fifo_output;
		assign fifo_output_test = fifo_output;
		wire [6:0] fifo_count;
		assign fifo_count_test = fifo_count;

		// my_fifo initialization
		localparam [2:0] 
			POP_DELAY = 0;
			
		fifo #(.data_size(4'd8),.buffer_size(8'd64))
			my_fifo_instance1(
				.clk(clk),
				.reset(reset),
				.read_data(fifo_pop),
				.write_data(fifo_push),
				.full(fifo_full),
				.empty(fifo_empty),
				.data_input(fifo_input),
				.data_output(fifo_output),
				.fifo_count(fifo_count)
			);
		
//		// FIFO initialization
//		localparam [2:0] 
//			POP_DELAY = 1;
//		
//		FIFO FIFO_instance1(
//			.clk(clk),
//			.srst(reset),
//			.din(fifo_input),
//			.dout(fifo_output),
//			.wr_en(fifo_push),
//			.rd_en(fifo_pop),
//			.full(fifo_full),
//			.empty(fifo_empty),
//			.data_count(fifo_count)
//		);

		// fifo push pulse generator initialization
		wire generate_fifo_push_pulse;
		assign generate_fifo_push_pulse_test = generate_fifo_push_pulse;
		assign generate_fifo_push_pulse = start_transmission;

		pulse_generator push_pulse_generator(
			.clk(clk),
			.reset(reset),
			.generate_pulse(generate_fifo_push_pulse),
			.pulse(fifo_push)
		);

		// fifo pop pulse generator initialization
		reg generate_fifo_pop_pulse;
		assign generate_fifo_pop_pulse_test = generate_fifo_pop_pulse;
		pulse_generator pop_pulse_generator(
			.clk(clk),
			.reset(reset),
			.generate_pulse(generate_fifo_pop_pulse),
			.pulse(fifo_pop)
		);


	// state declarations
	localparam [1:0]
		idle = 2'b00,
		fetching = 2'b01,
		transmitting = 2'b10,
		stop = 3'b11;

	// signals
	reg [1:0] state_reg, state_next;
	assign state_reg_test = state_reg;
	assign state_next_test = state_next;
	reg [3:0] count,count_next;
	assign count_test = count;
	assign count_next_test = count_next;
	reg busy_next;
	assign busy_next_test = busy_next;
	reg [NO_OF_DATABITS-1 : 0] shift_reg, shift_reg_next;
	assign shift_reg_test = shift_reg;
	assign shift_reg_next_test = shift_reg_next;
	reg tx_next;
	assign tx_next_test = tx_next;
	reg generate_fifo_pop_pulse_next;
	assign generate_fifo_pop_pulse_next_test = generate_fifo_pop_pulse_next;
	reg [1:0] wait_count,wait_count_next;
	assign wait_count_test = wait_count;
	assign wait_count_next_test = wait_count_next;

	// state updation logic

		always @(negedge(clk),posedge(reset)) begin
			if(reset) begin
				busy <= 0;
			end else begin
				busy <= busy_next;
			end
		end

		always @(posedge(clk),posedge(reset)) begin
			if(reset) begin
				state_reg <= idle;
				count <= 0;
				shift_reg <= 0;
				tx <= 1;
				generate_fifo_pop_pulse <= 0;
				wait_count <= 0;
			end else begin
				state_reg <= state_next;
				count <= count_next;
				shift_reg <= shift_reg_next;
				tx <= tx_next;
				generate_fifo_pop_pulse <= generate_fifo_pop_pulse_next;
				wait_count <= wait_count_next;
			end
		end

	// next state logic
	
		always @* begin
			if(tx_start_transmission) begin
				busy_next = 1;
			end else begin
				if((state_reg == stop) && (state_next == idle) && (fifo_empty)) begin
					busy_next = 0;
				end else begin
					busy_next = busy;
				end
			end
		end

		always @* begin
			if(state_reg == idle) begin
				// mealey outputs
				tx_next = 1;
				count_next = 0;
				tx_baudrate_tick_generator_enable = 1'b0;
				shift_reg_next = shift_reg;
				wait_count_next = 0;

				if(~fifo_empty) begin
					state_next = fetching;
					generate_fifo_pop_pulse_next = ~ generate_fifo_pop_pulse;
				end else begin
					state_next = state_reg;
					generate_fifo_pop_pulse_next = generate_fifo_pop_pulse;
				end

			end else if(state_reg == fetching) begin
				count_next = 0;
				tx_baudrate_tick_generator_enable = 1'b0;
				generate_fifo_pop_pulse_next = generate_fifo_pop_pulse;

				if(wait_count == POP_DELAY) begin
					shift_reg_next = fifo_output;
					state_next = transmitting;
					wait_count_next = 0;
					tx_next = 0;
				end else begin
					shift_reg_next = shift_reg;
					state_next = fetching;
					wait_count_next = wait_count + 1;
					tx_next = 0;
				end

			end else if(state_reg == transmitting) begin
				// mealey outputs
				tx_baudrate_tick_generator_enable = 1'b1;
				wait_count_next = wait_count;
				generate_fifo_pop_pulse_next = generate_fifo_pop_pulse;
				
				if(tick==1) begin
					if(count == 8) begin
						tx_next = 1;
						count_next = 0;
						shift_reg_next = shift_reg;
						state_next = stop;
					end else begin
						tx_next = shift_reg[0];
						shift_reg_next = {1'b0,shift_reg[NO_OF_DATABITS-1:1]};
						count_next = count + 1;
						state_next = state_reg;
					end
				end else begin
					count_next = count;
					shift_reg_next = shift_reg;
					state_next = state_reg;
					tx_next = tx;
				end
				
			end else if(state_reg == stop) begin
				// mealey outputs
				tx_baudrate_tick_generator_enable = 1'b1;
				wait_count_next = wait_count;
				generate_fifo_pop_pulse_next = generate_fifo_pop_pulse;
				tx_next = 1;
				shift_reg_next = shift_reg;
				
				if(tick == 1) begin
					if(count == NO_OF_STOPBITS-1) begin
						count_next = 0;
						state_next = idle;
					end else begin
						count_next = count + 1;
						state_next = state_reg;
					end
				end else begin
					count_next = count;
					state_next = state_reg;
				end

			end else begin
				state_next = state_reg;
				count_next = count;
				shift_reg_next = shift_reg;
				tx_next = tx;
				generate_fifo_pop_pulse_next = generate_fifo_pop_pulse;
				wait_count_next = wait_count;
				tx_baudrate_tick_generator_enable = 1'b0;
			end

		end

endmodule // transmitter_core