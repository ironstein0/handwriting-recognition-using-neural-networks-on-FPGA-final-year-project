//`timescale 1ns / 1ps
`include "utils/tx_baudrate_tick_generator.v"
`include "utils/pulse_generator.v"
`include "utils/my_fifo.v"
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
		output reg tx
		);
	
	// module instantitation
		// tx baudrate tick generator initialization
		reg tx_baudrate_tick_generator_enable;
		
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
			.generate_pulse(start_transmission),
			.pulse(tx_start_transmission)
		);

		reg fifo_push;
		reg fifo_pop;
		wire fifo_full;
		wire fifo_empty
		reg [7:0] fifo_input;
		wire [7:0] fifo_output;
		wire [63:0] fifo_count;

		// my_fifo initialization
		my_fifo #(.data_size(4'd8),.buffer_size(8'd64))
			my_fifo_instance1(
				.clk(clk),
				.reset(reset),
				.read_data(fifo_push),
				.write_data(fifo_pop),
				.full(fifo_full),
				.empty(fifo_empty),
				.data_input(fifo_input),
				.data_output(fifo_output),
				.fifo_count(fifo_count)
			);

		// fifo push pulse generator initialization
		wire generate_fifo_push_pulse;
		assign generate_fifo_push_pulse = tx_start_transmission;

		pulse_generator push_pulse_generator(
			.clk(clk),
			.generate_pulse(generate_fifo_push_pulse),
			.pulse(fifo_push)
		);

		// fifo pop pulse generator initialization
		reg generate_fifo_pop_pulse;
		pulse_generator pop_pulse_generator(
			.clk(clk),
			.generate_pulse(generate_fifo_pop_pulse),
			.pulse(fifo_pop)
		);


	// state declarations
	localparam 
		idle = 1'b00,
		fetching = 1'b01,
		transmitting = 1'b10;

	// signals
	reg [1:0] state_reg, state_next;
	reg [3:0] count,count_next;
	reg busy_next;
	reg shift_bit;
	reg [NO_OF_DATABITS-1 : 0] shift_reg, shift_reg_next;
	reg tx_next;
	reg generate_fifo_pop_pulse_next;
	reg [1:0] wait_count,wait_count_next;


	// state updation logic
	always @(posedge(clk),posedge(reset)) begin
		if(reset) begin
			state_reg <= idle;
			count <= 0;
			busy <= 0;
			shift_reg <= 0;
			tx <= 1;
			generate_fifo_pop_pulse <= 0;
			wait_count <= 0;
		end else begin
			state_reg <= state_next;
			count <= count_next;
			busy <= busy_next;
			shift_reg <= shift_reg_next;
			tx <= tx_next;
			generate_fifo_pop_pulse <= generate_fifo_pop_pulse_next;
			wait_count <= wait_count_next;
		end
	end

	// next state logic
	always @* begin
		if(state_reg == idle) begin
			// mealey outputs
			busy_next = 0;
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
			busy_next = 0;
			count_next = 0;
			tx_baudrate_tick_generator_enable = 1'b0;
			generate_fifo_pop_pulse_next = generate_fifo_pop_pulse;

			if(wait_count == 2) begin
				shift_reg_next = fifo_data_out;
				state_next = transmitting;
				wait_count_next = 0;
				tx_next = 0;
			end else begin
				shift_reg_next = shift_reg;
				state_next = fetching;
				wait_count_next = wait_count + 1;
				tx_next = 0;
			end

		end else begin
			// mealey outputs
			busy_next = 1;
			tx_baudrate_tick_generator_enable = 1'b1;
			wait_count_next = wait_count;
			generate_fifo_pop_pulse_next = generate_fifo_pop_pulse;
			
			if(tick==1) begin
				if(count == 8) begin
					tx_next = 1;
					count_next = 0;
					shift_reg_next = shift_reg;
					state_next = idle;
				end else begin
					tx_next = shift_reg[0];
					shift_reg_next = {shift_bit,shift_reg[NO_OF_DATABITS-1:1]};
					count_next = count + 1;
					state_next = state_reg;
				end
			end else begin
				count_next = count;
				shift_reg_next = shift_reg;
				state_next = state_reg;
				tx_next = tx;
			end
		end
	end

endmodule // transmitter_core

// module stimulus();
// 	// control signals
// 	reg CLK;
// 	wire RESET;
// 	reg RESET_SWITCH;
// 	reg START_TRANSMISSION;
// 	wire BUSY;
// 	// data signals
// 	reg [7:0] DATA_IN;
// 	wire TX;

// 	// module instantiations
// 	reset_controller rst1(
// 		.clk(CLK),
// 		.switch_input(RESET_SWITCH),
// 		.reset(RESET)
// 	); 

// 	uart_tx_core T
// 	(
// 		// control signals
// 		.clk(CLK),
// 		.reset(RESET),
// 		.start_transmission(START_TRANSMISSION),
// 		.busy(BUSY),
// 		// data signals
// 		.data_in(DATA_IN),
// 		.tx(TX)
// 	);
		
// 	initial begin
// 		CLK = 1'b0;
// 		DATA_IN = 8'b11;
// 		RESET_SWITCH = 1'b1;
// 		START_TRANSMISSION = 1'b0;
// 	end	

// 	initial begin
// 		$dumpfile("simulation.vcd");
// 		$dumpvars (0,
// 			// control signals
// 			CLK, 
// 			RESET_SWITCH, 
// 			RESET,
// 			BUSY,
// 			START_TRANSMISSION,
// 			// data signals
// 			DATA_IN,
// 			TX
// 		);
// 	end 
	
// 	initial begin 
// //		#10 RESET_SWITCH = 1'b1;
// 	end
	
// 	reg [7:0] i = 0;
	
// 	initial begin
// 		for(i=0;i<256;i=i+1) begin
// 			#150000;
// 			DATA_IN = i;
// 			START_TRANSMISSION = ~ START_TRANSMISSION;
// 		end
// 	end
	
// 	always begin
// 		#1 CLK = ~CLK;
// 	end
	
// 	initial begin
// 		#1000000 $finish;
// 	end
// endmodule

// module synthesis_stimulus(
// 	input wire CLK,
// 	input wire RESET_SWITCH,
// 	output wire RESET,
// 	output wire BUSY,
// 	output wire TX
// 	);
	
// 	// module instantiations
// 	tx_tick_generator #(.tick_time(1000),.frequency(100000))
// 		ti(
// 			.clk(CLK),
// 			.reset(RESET),
// 			.tick(TICK)
// 		);
		
// 	reg START_TRANSMISSION;
// 	reg [7:0] DATA_IN;
	
// 	reset_controller T3(
// 		.clk(CLK),
// 		.switch_input(RESET_SWITCH),
// 		.reset(RESET)
// 	);

// 	uart_tx_core t(
// 		.clk(CLK),
// 		.reset(RESET),
// 		.start_transmission(START_TRANSMISSION),
// 		.busy(BUSY),
// 		.data_in(DATA_IN),
// 		.tx(TX)
// 	);
	
// 	reg [7:0] i;
// 	initial begin
// 		i = 8'b0;
// 	end
	
// 	always @(posedge(TICK),posedge(RESET)) begin
// 		if(RESET) begin
// 			DATA_IN = 0;
// 			i = 0;
// 		end else begin
// 			DATA_IN = i;
// 			START_TRANSMISSION = ~ START_TRANSMISSION;
// 			i = i + 1;
// 		end
// 	end
	
// endmodule
