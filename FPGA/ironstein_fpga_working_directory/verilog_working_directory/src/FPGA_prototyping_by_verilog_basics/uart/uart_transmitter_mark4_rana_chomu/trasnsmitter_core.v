`timescale 1ns / 1ps
`include "tx_baudrate_tick_generator.v"
`include "pulse_generator.v"
`include "reset_controller.v"
module transmitter_core
	#(	parameter NO_OF_DATABITS = 8,
		parameter No_OF_STOPBITS = 1
		)(
		input wire clk,
		input wire reset_switch,
		input wire[NO_OF_DATABITS-1:0] parallel_data,
		input wire start_transmission,
//		input wire tick,
		output reg tx,
		output reg busy    
	);
	// module instantitation
	tx_baudrate_tick_generator #(.baudrate(32'd9600),.frequency(32'd100000000))
		T1(
			.clk(clk),
			.reset(reset),
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
	reg [2:0] count,count_next;
	reg busy_next;
	reg shift_bit;
	reg [NO_OF_DATABITS-1 : 0] shift_reg, shift_reg_next;
	reg tx_next;

	// state

	initial begin
		state_reg = idle;
		shift_bit = 1'b1;
		state_reg = state_next;
		count = 3'd0;
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

			if(tx_start_transmission == 1) begin
				shift_reg_next = parallel_data;	// load data
				state_next = transmitting;
			end else begin
				shift_reg_next = shift_reg;
				state_next = state_reg;
			end
		end else begin
			// mealey outputs
			busy_next = 1;
			if(tick==1) begin
				if(count == 8) begin
					tx_next = 1;
					count_next = 0;
					shift_reg_next = shift_reg;
					state_next = idle;
				end else begin
					tx_next = shift_reg[0];
					shift_reg_next = {shift_bit,shift_reg[NO_OF_DATABITS-2:0]};
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

	// if (count == 0)
	// 	if(state_reg == idle) begin
	// 	// mealy outputs
	// 	busy = 0'b0;
	// 	tx = 0'b0;
	// 	end	else 
	// 	state_next = state;
	// else if (start_trasnmission == 1)
	// 	shift_reg_next = parallel_data;		 

	// else if (state_reg == transmitting) begin
	// 	// mealy outputs
	// 	busy = 1; 
	// 	if (count < 8) begin
	// 		shift_reg = {(shift_bit):(parallel_data[NO_OF_DATABITS-2:0])};
	// 		count = count + 1;
	// 		count_next = count;
	// 	end else if (count == 8)
	// 		state = idle;

module stimulus();
		reg CLK;
		reg RESET;
		reg [7:0] PARALLEL_DATA;
		reg START_TRANSMISSION;
		reg TICK;
		wire TX;
		wire BUSY;
	

	trasnsmitter_core T
	(	.clk(CLK),
		.reset_switch(RESET),
		.parallel_data(PARALLEL_DATA),
		.start_transmission(START_TRANSMISSION),
		.tx(TX),
		.busy(BUSY)
		);
	initial begin
		CLK = 1'b0;
		PARALLEL_DATA = 8'b11;
		RESET = 1'b0;
		START_TRANSMISSION = 1'b0;
	end	

	initial begin
		$dumpvars (CLK, RESET, PARALLEL_DATA, START_TRANSMISSION, TICK, TX, BUSY);
	end // initial

	always 
	#1 CLK = ~CLK;

	initial begin
		#30 START_TRANSMISSION = 1'b1;
		#150 RESET = 1'b1;
		#200 $finish;
	end
endmodule	