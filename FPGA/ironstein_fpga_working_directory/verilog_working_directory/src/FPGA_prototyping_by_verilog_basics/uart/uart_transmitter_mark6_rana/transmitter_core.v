//`timescale 1ns / 1ps
`include "tx_baudrate_tick_generator.v"
`include "pulse_generator.v"
`include "reset_controller.v"
`include "tick_generator.v"

module transmitter_core
	#(	parameter NO_OF_DATABITS = 8,
		parameter NO_OF_STOPBITS = 1
		)(
		// control signals
		input wire clk,
		input wire reset_switch,
		output wire reset,
		input wire start_transmission,
		output reg busy,
		// data signals
		input wire[NO_OF_DATABITS-1:0] parallel_data,
		output reg tx
		);
	
	// module instantitation
	reg tx_baudrate_tick_generator_enable;
	
	tx_baudrate_tick_generator #(.baudrate(32'd9600),.frequency(32'd100000000))
		T1(
			.clk(clk),
			.reset(reset),
			.enable(tx_baudrate_tick_generator_enable),
			.tick(tick)
		);
	
	pulse_generator #(.PULSE_WIDTH(32'd1))
		T2(
		.clk(clk),
		.generate_pulse(start_transmission),
		.pulse(tx_start_transmission)
	);
	
	reset_controller T3(
		.clk(clk),
		.switch_input(reset_switch),
		.reset(reset)
	);

	// state declarations
	localparam 
		idle = 1'b0,
		transmitting = 1'b1;

	// signals
	reg state_reg, state_next;
	reg [3:0] count,count_next;
	reg busy_next;
	reg shift_bit;
	reg [NO_OF_DATABITS-1 : 0] shift_reg, shift_reg_next;
	reg tx_next;

	// state

	initial begin
		state_reg = idle;
		shift_bit = 1'b0;
		state_reg = state_next;
		count = 4'd0;
	end

	// state updation logic
	always @(posedge(clk),posedge(reset)) begin
		if(reset) begin
			state_reg = idle;
			count = 0;
			busy = 0;
			shift_reg = 0;
			tx = 1;
			// reset related stuff
		end else begin
			state_reg = state_next;
			count = count_next;
			busy = busy_next;
			shift_reg = shift_reg_next;
			tx = tx_next;
			// clk related stuff
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

			if(tx_start_transmission == 1) begin
				shift_reg_next = parallel_data;	// load data
				tx_next = 0;
				state_next = transmitting;
			end else begin
				shift_reg_next = shift_reg;
				state_next = state_reg;
			end
		end else begin
			// mealey outputs
			busy_next = 1;
			tx_baudrate_tick_generator_enable = 1'b1;
			
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

//module stimulus();
//	// control signals
//	reg CLK;
//	wire RESET;
//	reg RESET_SWITCH;
//	reg START_TRANSMISSION;
//	wire BUSY;
//	// data signals
//	reg [7:0] PARALLEL_DATA;
//	wire TX;
//
//	transmitter_core T
//	(	
//		// control signals
//		.clk(CLK),
//		.reset_switch(RESET_SWITCH),
//		.reset(RESET),
//		.start_transmission(START_TRANSMISSION),
//		.busy(BUSY),
//		// data signals
//		.parallel_data(PARALLEL_DATA),
//		.tx(TX)
//	);
//		
//	initial begin
//		CLK = 1'b0;
//		PARALLEL_DATA = 8'b11;
//		RESET_SWITCH = 1'b1;
//		START_TRANSMISSION = 1'b0;
//	end	
//
//	initial begin
//		$dumpvars (
//			// control signals
//			CLK, 
//			RESET_SWITCH, 
//			RESET,
//			BUSY,
//			START_TRANSMISSION,
//			// data signals
//			PARALLEL_DATA,
//			TX
//		);
//	end 
//	
//	initial begin 
////		#10 RESET_SWITCH = 1'b1;
//	end
//	
//	reg [7:0] i = 0;
//	
//	initial begin
//		for(i=0;i<256;i=i+1) begin
//			#150000;
//			PARALLEL_DATA = i;
//			START_TRANSMISSION = ~ START_TRANSMISSION;
//		end
//	end
//	
//	always begin
//		#1 CLK = ~CLK;
//	end
//	
////	initial begin
////		#1000 $finish;
////	end
//endmodule

module stimulus(
	input wire CLK,
	input wire RESET_SWITCH,
	output wire RESET,
	output wire BUSY,
	output wire TX
	);
	
	// module instantiations
	tick_generator #(.tick_time(1000),.frequency(100000))
		t(
			.clk(CLK),
			.tick(TICK)
		);
	
	reg START_TRANSMISSION;
	reg [7:0] PARALLEL_DATA;
	reg [7:0] i;
	
	initial begin
		i = 8'b0;
	end

endmodule
