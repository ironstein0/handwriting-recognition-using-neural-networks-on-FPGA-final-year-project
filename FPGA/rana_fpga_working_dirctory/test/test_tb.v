`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:40:48 01/22/2016
// Design Name:   mul
// Module Name:   D:/Xilinx_projects/test/test_tb.v
// Project Name:  test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mul
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_tb;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire [7:0] prod;

	// Instantiate the Unit Under Test (UUT)
	mul uut (
		.a(a), 
		.b(b), 
		.prod(prod)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

