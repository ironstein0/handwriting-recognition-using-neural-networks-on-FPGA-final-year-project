`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:23:10 10/24/2015
// Design Name:   ThreeInputOrGate
// Module Name:   D:/Xilinx_projects/OR/stimulus.v
// Project Name:  OR
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ThreeInputOrGate
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module stimulus;

	// Inputs
	reg i1;
	reg i2;
	reg i3;

	// Outputs
	wire gateOutput;
	
	integer i;

	// Instantiate the Unit Under Test (UUT)
	ThreeInputOrGate uut (
		.i1(i1), 
		.i2(i2), 
		.i3(i3), 
		.gateOutput(gateOutput)
	);

	initial begin
		// Initialize Inputs
		i1 = 0;
		i2 = 0;
		i3 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
			// Add stimulus here
		/*
		//Rana's stimulus
		#50 i1 = 1;
		#50 i1 = 0;
		#60 i3 = 1;
		*/
		//Dhr's stimulus
/*		#50 i3 = 1;
		#50 i3 = 0;
		i2 = 1;
		#50 i3 = 1;
		#50 i3 = 0;
		i2 = 0;
		i1 = 1;
		#50 i3 = 1;
		#50 i3 = 0;
		i2 = 1; 
		#50 i3 = 1;
		#50 i3 = 0;
		i2 = 0;
		i1 = 0;*/
		for (i = 0 ; i < 8 ; i = i + 1)
		begin
			#50 {i1,i2,i3}= i;
		end	
		#50 {i1,i2,i3}= 0;
	end
   
	initial begin
		$monitor("output=%d, i1=%d, i2=%d, i3=%d\n",gateOutput,i1,i2,i3);
	end	
endmodule

