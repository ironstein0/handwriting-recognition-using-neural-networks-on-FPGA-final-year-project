`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:39:29 03/07/2016
// Design Name:   MAC_with_memory
// Module Name:   /home/kishore/Desktop/verilog_files/MAC_with_memory/MAC_with_memory_tb.v
// Project Name:  MAC_with_memory
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MAC_with_memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MAC_with_memory_tb;

	// Inputs
	reg [17:0] a;
	reg [17:0] b;
	reg [47:0] c;
	reg clk;
	reg rst;
	reg ce;
	wire [17:0] bcout;
	wire carryout,carryoutf;
	// Outputs
	wire [47:0] MAC_out;

	// Instantiate the Unit Under Test (UUT)
	MAC_with_memory uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.MAC_out(MAC_out), 
		.clk(clk), 
		.rst(rst), 
		.ce(ce),
		.bcout(bcout),
		.carryout(carryout),
		.carryoutf(carryoutf)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		ce=1;
		rst=0;
		#200
		a = 100;
		b = 10;
		c=10;
		
		
		

		
		//clear all internal registers
	
	end
  
	always begin
		#100
		clk=~clk;
	end

endmodule

