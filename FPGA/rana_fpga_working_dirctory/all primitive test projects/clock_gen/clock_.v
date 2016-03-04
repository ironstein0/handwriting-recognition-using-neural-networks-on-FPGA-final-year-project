`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:20:40 02/05/2016 
// Design Name: 
// Module Name:    clock_ 
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
module clock_( CLK_IN1, CLK_OUT1, CLK_OUT2, CLK_OUT3, CLK_OUT4
    );
	input CLK_IN1;
	output CLK_OUT1;
	output CLK_OUT2;
	output CLK_OUT3;
	output CLK_OUT4; 
	

  clk_ip_core instance_name
   (// Clock in ports
    .CLK_IN1(CLK_IN1),      // IN
    // Clock out ports
    .CLK_OUT1(CLK_OUT1),     // OUT
    .CLK_OUT2(CLK_OUT2),     // OUT
    .CLK_OUT3(CLK_OUT3),     // OUT
    .CLK_OUT4(CLK_OUT4),     // OUT
    // Status and control signals
    .RESET(RESET),// IN
    .LOCKED(LOCKED));      // OUT

endmodule
