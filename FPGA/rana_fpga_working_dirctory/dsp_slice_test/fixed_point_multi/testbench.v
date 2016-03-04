`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:34:47 02/11/2016
// Design Name:   fixed_point
// Module Name:   D:/Xilinx_projects/dsp_slice_test/fixed_point_multi/testbench.v
// Project Name:  fixed_point_multi
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fixed_point
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg clk;
	reg ce;
	reg sclr;
	reg bypass;
	reg a;
	reg b;

	// Outputs
	wire s;

	// Instantiate the Unit Under Test (UUT)
	fixed_point uut (
		.clk(clk), 
		.ce(ce), 
		.sclr(sclr), 
		.bypass(bypass), 
		.a(a), 
		.b(b), 
		.s(s)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		ce = 0;
		sclr = 0;
		bypass = 0;
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
	initial begin
		
		// Wait 100 ns for global reset to finish
		//#100;
		a<=10;
		b<=20;
		
		#10
		a<=1;
		b<=2;
	
		#10
		a<=3;
		b<=2;

	end
	
	
	always begin:CLOCK
	#5 clock=~clock;
	end		
		// Add stimulus here

	end
      
endmodule

