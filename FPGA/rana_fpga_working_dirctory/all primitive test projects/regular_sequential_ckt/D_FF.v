`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:18:43 02/20/2016 
// Design Name: 
// Module Name:    D_FF 
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
module D_FF(
	input wire clk, reset,
	input wire en,
	input wire d,
	output reg q
    );

reg r_reg, r_next;

// D_FF body
always @(posedge clk, posedge reset)
	if(reset)
		r_reg <= 1'b0;
	else
		r_reg <= r_next;
		
//next state
always @* 
	if (en)
		r_next = d;
	else 
		r_next = r_reg;
	
//output
always @* 
	q = r_reg;
	
endmodule

module stimulus();

	reg CLK, RESET, EN, D;
	wire Q;

	D_FF d(
		.clk(CLK),
		.reset(RESET),
		.en(EN),
		.d(D),
		.q(Q)
		);
		
	initial 
		$dumpvars(CLK, RESET, EN, D, Q ); 
	
	initial
		begin
			CLK = 1'b0;
			EN = 1'b1;
			D = 1'b1;
			RESET = 1'b0;
	end
	always
		#2 CLK = ~ CLK;
	
	initial 
		begin 
			#20 RESET = 1'b1;
			#10 D = 1'b0;
			#10 RESET = 1'b0;
			#100 $finish;
	end	
		
	
endmodule
