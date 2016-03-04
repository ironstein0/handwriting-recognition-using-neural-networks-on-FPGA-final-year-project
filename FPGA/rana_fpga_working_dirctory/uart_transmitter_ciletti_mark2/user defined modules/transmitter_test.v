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
	( Serial_out, Data_Bus, Byte_ready, Load_XMT_datareg,T_byte, Clock, reset_, tick,
	XMT_datareg_test,
	XMT_shiftreg_test,
	Load_XMT_shiftreg_test,
	state_test,
	next_state_test,
	bit_count_test,shift_test );
	
	parameter word_size = 8;
	parameter one_hot_count = 3;
	parameter state_count = one_hot_count;
	parameter size_bit_count = 3;
	
	parameter idle = 3'b001;	
	parameter waiting = 3'b010;
	parameter sending = 3'b100;
	parameter all_ones = 9'b1_1111_1111;
	//  input-output
	output wire						Serial_out; 
	input wire[word_size-1:0]	Data_Bus;
	input wire							Byte_ready;
	input wire						Load_XMT_datareg;
	input wire						T_byte;
	input wire						Clock;
	input wire						reset_;
	output wire 					tick;
	
	// internal signals
	reg [word_size-1:0]     	XMT_datareg;
	reg [word_size:0] 	   		XMT_shiftreg;
	reg 						Load_XMT_shiftreg;
	reg [state_count-1:0]   	state,next_state ;
	reg [size_bit_count:0]  	bit_count;
	reg 						clear;
	reg 						shift;
	reg 						start;
	
	// test signals

	output wire[word_size-1:0] XMT_datareg_test;
	output wire[word_size:0] XMT_shiftreg_test;
	output wire Load_XMT_shiftreg_test;
	output wire[2:0] state_test;
	output wire[2:0]next_state_test;
	output wire bit_count_test;
	output wire shift_test; 

	// assignments
	assign Serial_out = XMT_shiftreg[0];
	assign XMT_datareg_test = XMT_datareg;
	assign XMT_shiftreg_test = XMT_shiftreg;
	assign Load_XMT_shiftreg_test = Load_XMT_shiftreg;
	assign state_test = state;
	assign next_state_test = next_state;
	assign bit_count_test = bit_count_test;
	assign shift_test = shift;
	
	// instantiation
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

//module stimulus();
//	
//	reg CLK,RESET;
//	reg BYTE_READY;
//	wire SERIAL_OUT;
//	reg [7:0] DATA_BUS;
//	reg LOAD_XMT_DATAREG;
//	reg T_BYTE;
//	wire TICK;
//	wire[7:0] DATAREG;
//	wire[8:0] SHIFTREG;
//	wire LOAD_SHIFTREG;
//	wire STATE;
//	wire NEXT_STATE;
//	wire SHIFT;
//
//	transmitter T(
// 	.Clock(CLK),
// 	.reset_(RESET),
// 	.Serial_out(SERIAL_OUT),
// 	.Byte_ready(BYTE_READY),
// 	.Data_Bus(DATA_BUS),
// 	.Load_XMT_datareg(LOAD_XMT_DATAREG),
//	.T_byte(T_BYTE),
//	.tick(TICK),
//	.XMT_datareg_test(DATAREG),
//	.XMT_shiftreg_test(SHIFTREG),
//	.Load_XMT_shiftreg_test(LOAD_SHIFTREG),
//	.state_test(STATE),
//	.next_state_test(NEXT_STATE),
//	.shift_test(SHIFT)
//	);
//
//
//	
//	initial begin
//		$dumpvars (CLK,RESET,
//					BYTE_READY,
//					SERIAL_OUT,
//					DATA_BUS,
//					LOAD_XMT_DATAREG,
//					T_BYTE,
//					TICK);
//		end
//
//		initial begin 
//			CLK = 1'b0;
//			DATA_BUS = 8'b0000_0011;
//			RESET = 1'b1;
//			BYTE_READY = 1'b0;
//			LOAD_XMT_DATAREG = 1'b0;
//			T_BYTE = 1'b0;
//		end 
//		always
//		 	#1 CLK = ~CLK;
//		initial begin
//			#10 RESET = 1'b0;
//			#20 BYTE_READY = 1'b1;
//			#1 LOAD_XMT_DATAREG = 1'b1;
//			#10 T_BYTE = 1'b1;
////			#50 T_BYTE = 1'b0;
//			
//		end	
//
//endmodule


