`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:28:45 02/08/2016 
// Design Name: 
// Module Name:    dsp_test 
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
module dsp_test(
	 input clock,
    input [17:0] a,
    input [17:0] b,
    input [47:0] c,
    output [47:0] MAC_op
    );

dsp48_macro MAC0 (clock,a,b,c,MAC_op); //Instantiate a  DSP48 slice

endmodule
