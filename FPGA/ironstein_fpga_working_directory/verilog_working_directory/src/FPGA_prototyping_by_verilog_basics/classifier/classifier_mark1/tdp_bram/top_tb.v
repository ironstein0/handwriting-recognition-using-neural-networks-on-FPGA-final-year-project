`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:51:45 03/24/2016
// Design Name:   top
// Module Name:   E:/projects_working_directory/block_ram_mark1/user_defined_modules/top_tb.v
// Project Name:  block_ram_mark1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_tb;

	// Inputs
	reg clk;
	reg reset_switch;
	reg rx;

	// Outputs
	wire reset;
	wire tx;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.reset_switch(reset_switch), 
		.reset(reset), 
		.rx(rx), 
		.tx(tx)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset_switch = 0;
		rx = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset_switch = 1;
		#2 reset_switch = 0;
		
		#10 rx = 0;
		#10 rx = 1;

	end
	
	always #1 clk = ~ clk;
      
endmodule

