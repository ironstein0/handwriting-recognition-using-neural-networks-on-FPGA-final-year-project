`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:26:29 02/11/2016 
// Design Name: 
// Module Name:    fixed_point 
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
module fixed_point( clk, ce, sclr, bypass, a, b, s
    );
	 
	 input clk;
	 input ce;
	 input sclr;
	 input bypass;
	 input a ;
	 input b ;
	 output s;

fixed_point_core your_instance_name (
  .clk(clk), // input clk
  .ce(ce), // input ce
  .sclr(sclr), // input sclr
  .bypass(bypass), // input bypass
  .a(a), // input [15 : 0] a
  .b(b), // input [15 : 0] b
  .s(s) // output [15 : 0] s
);

endmodule
