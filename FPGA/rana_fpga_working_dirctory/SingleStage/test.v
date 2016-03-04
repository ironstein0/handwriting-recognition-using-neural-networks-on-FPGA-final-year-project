`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:24:23 10/30/2015
// Design Name:   SingleStage
// Module Name:   D:/GitHub/Handwriting_recognition_using_neural_nets_on_FPGA/Xilinx_projects/SingleStage/test.v
// Project Name:  SingleStage
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SingleStage
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire cout;
	wire s;

	integer i;
	// Instantiate the Unit Under Test (UUT)
	SingleStage uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.cout(cout), 
		.s(s)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 0;
	end
	always @ (a, b, cin)
		begin
		for (i = 0 ; i < 8  ; i = i + 1)
			#10 {a,b,cin} = i;

		#10 $stop;		
		end
      
endmodule

