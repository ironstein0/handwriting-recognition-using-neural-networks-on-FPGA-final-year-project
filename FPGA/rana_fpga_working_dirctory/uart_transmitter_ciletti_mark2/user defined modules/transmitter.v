`timescale 1ns / 1ps
`include "tick_generator.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: Rana & co.
// Engineer: Akash
// 
// Create Date:    01:57:39 03/02/2016 
// Design Name: 
// Module Name:    transmitter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module transmitter
	( Serial_out, Data_Bus, Byte_ready, Load_XMT_datareg,T_byte, Clock, reset_, tick);
	
	parameter word_size = 8;
	parameter one_hot_count = 3;
	parameter state_count = one_hot_count;
	parameter size_bit_count = 3;
	
	parameter idle = 3'b001;	
	parameter waiting = 3'b010;
	parameter sending = 3'b100;
	parameter all_ones = 9'b1_1111_1111;
	
	output wire						Serial_out; 
	input wire[word_size-1:0]	Data_Bus;
	input wire							Byte_ready;
	input wire						Load_XMT_datareg;
	input wire						T_byte;
	input wire						Clock;
	input	wire						reset_;
	output wire 					tick;
	
	reg [word_size-1:0]     	XMT_datareg;
	reg [word_size:0] 	   		XMT_shiftreg;
	reg 						Load_XMT_shiftreg;
	reg [state_count-1:0]   	state,next_state ;
	reg [size_bit_count:0]  	bit_count;
	reg 						clear;
	reg 						shift;
	reg 						start;
	
	assign Serial_out = XMT_shiftreg[0];
	
	tick_generator Tick(Clock, reset_, tick);
	
	always @(state or Byte_ready or bit_count or T_byte)
		begin
			Load_XMT_shiftreg = 0;
			clear = 0;
			shift = 0;
			start = 0;
			next_state = state;
			
			case(state)
			idle:
				if (Byte_ready==1) begin
					Load_XMT_shiftreg = 1;
					next_state = waiting;
				end
			waiting :
				if(T_byte ==1) begin
					start = 1;
					next_state = sending;
				end
			sending:
				if(bit_count != word_size + 1)
					shift = 1;
				else begin
					clear = 1;
					next_state = idle;
				end
			default:
				next_state = idle;
		endcase
	end
	
	always @(posedge tick or posedge reset_) begin
		if (reset_ == 1) begin
			state <= idle;
		end else 
			state <= next_state;
		
	 end
	always @ (posedge tick or posedge reset_) begin
		if (reset_ == 1) begin
			XMT_shiftreg <= all_ones;
			bit_count <= 0;
		end else begin
			if (Load_XMT_datareg == 1)
				XMT_datareg <= Data_Bus;
				
			if (Load_XMT_shiftreg ==1)
				XMT_shiftreg <= {XMT_datareg,1'b1};
				
			if(start ==1)
				XMT_shiftreg[0]<=0;
				
			if(clear == 1) 
				bit_count <= 0;
			else if (shift == 1) 
				bit_count <= bit_count + 1;
				
			if (shift==1)
				XMT_shiftreg <= {1'b1,XMT_shiftreg[word_size:1]};
			end
		end
endmodule

// module stimulus();
	
// 	reg CLK,RESET;
// 	reg BYTE_READY;
// 	wire SERIAL_OUT;
// 	reg [7:0] DATA_BUS;
// 	reg LOAD_XMT_DATAREG;
// 	reg T_BYTE;
// 	wire TICK;

// 	transmitter T(
//  	.Clock(CLK),
//  	.reset_(RESET),
//  	.Serial_out(SERIAL_OUT),
//  	.Byte_ready(BYTE_READY),
//  	.Data_Bus(DATA_BUS),
//  	.Load_XMT_datareg(LOAD_XMT_DATAREG),
// 	.T_byte(T_BYTE),
// 	.tick(TICK)
// 	);


	
// 	initial begin
// 		$dumpvars ( CLK,RESET,
// 					BYTE_READY,
// 					SERIAL_OUT,
// 					DATA_BUS,
// 					LOAD_XMT_DATAREG,
// 					T_BYTE,
// 					TICK);
// 		end

// 		initial begin 
// 			CLK = 1'b0;
// 			DATA_BUS = 8'b0000_0011;
// 			RESET = 1'b1;
// 			BYTE_READY = 1'b0;
// 			LOAD_XMT_DATAREG = 1'b0;
// 			T_BYTE = 1'b0;
// 		end 
// 		always
// 		 	#1 CLK = ~CLK;
// 		initial begin
// 			#10 RESET = 1'b0;
// 			#20 BYTE_READY = 1'b1;
// 			#1 LOAD_XMT_DATAREG = 1'b1;
// 			#10 T_BYTE = 1'b1;
// //			#50 T_BYTE = 1'b0;
			
// 		end	

// endmodule


`include "reset_controller.v"
module stimulus(
	input wire CLK,
	output wire TX,
	input wire RESET_SWITCH,
	output wire RESET
	);

	// signal declarations
	reg T_byte,reset_,Byte_ready,Load_XMT_datareg;
	reg [7:0] Data_Bus;
	wire tick;

	transmitter T (
		T_byte, 
		.Clock(CLK),
		reset_,
		.Serial_out(TX), 
		Data_Bus,
		Byte_ready,
		Load_XMT_datareg,
		tick
	);

	tick_generator #(.tick_time(1000),.frequency(100000))
		t1(
			.clk(CLK),
			.tick(TICK),
			.reset(RESET)
		);

	reset_controller r(
		.clk(CLK),
		.switch_input(RESET_SWITCH),
		.reset(RESET)
	);

	reg Data_Bus_next;

	always @(posedge(CLK)) begin
		Data_Bus = Data_Bus_next;
	end

	always @(posedge(TICK),posedge(RESET)) begin
		if(RESET) begin
			Data_Bus_next = 1'b0;
		end else begin
			Load_XMT_datareg = 1'b1;
			Byte_ready = 1'b1;
			Data_Bus_next = Data_Bus + 1;
		end
	end