`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:33:51 02/08/2016
// Design Name:   dsp_test
// Module Name:   D:/Xilinx_projects/dsp_slice_test/dsp_test_tb.v
// Project Name:  dsp_slice_test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dsp_test
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dsp_test_tb;

	// Inputs
	reg clock;
	reg [17:0] a;
	reg [17:0] b;
	reg [47:0] c;

	// Outputs
	wire [47:0] MAC_op;

	// Instantiate the Unit Under Test (UUT)
	dsp_test uut (
		.clock(clock), 
		.a(a), 
		.b(b), 
		.c(c), 
		.MAC_op(MAC_op)
	);

	
	initial begin
		clock = 0;
		// Initialize Inputs
		a = 0;
		b = 0;
		c = 0;
		#100
		
		// Wait 100 ns for global reset to finish
		//#100;
		a<=10;
		b<=20;
		c<=30;
		
		#10
		a<=1;
		b<=2;
		c<=3;
	
		#10
		a<=3;
		b<=2;
		c<=3;

	end
	
	always begin:CLOCK
	#5 clock=~clock;
	end
      
endmodule
