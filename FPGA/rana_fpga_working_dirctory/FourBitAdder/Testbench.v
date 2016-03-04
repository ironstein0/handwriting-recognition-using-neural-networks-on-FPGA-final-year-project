`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:14:02 10/25/2015
// Design Name:   FourBitFullAdder
// Module Name:   D:/Xilinx_projects/FourBitAdder/Testbench.v
// Project Name:  FourBitAdder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FourBitFullAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Testbench;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;

	// Outputs
	wire [3:0] Sum;
	wire Cout;
	
	//vars 
	integer i;
	
	// Instantiate the Unit Under Test (UUT)
	FourBitFullAdder uut (.A(A), .B(B), .Sum(Sum), .Cout(Cout) );

	initial begin
		// Initialize Inputs
//		A = 4'b0000;B = 4'b0000;Cin = 1'b0;
//		#40 A = 4'b0010;B = 4'b1111;Cin = 1'b0;
//		#80 A = 4'b0100;B = 4'b1110;Cin = 1'b1;
//		#120 A = 4'b1000;B = 4'b1010;Cin = 1'b1;
//		repeat(10)
//		input_generate(A,B,Cin);
//		#150 $finish;
		A = 0;
		B = 0;

	end

	initial
			$monitor( "A(%b) + B(%b)  = carry sum(%b %b)",A ,B ,Cout ,Sum );

	always @ (A or B)
		begin
		for (i = 0 ; i < 16*16 ; i = i + 1)
			 #10 {A,B}= i;
		end
		// Wait 100 ns for global reset to finish
        
		// Add stimulus here

     
endmodule

