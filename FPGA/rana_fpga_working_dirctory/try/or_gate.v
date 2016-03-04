`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:56:09 10/24/2015 
// Design Name: 
// Module Name:    or_gate 
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
module or_gate(A,B,Y);

input A , B ;

output Y; 

always @ (A==1 or B ==1)

Y = 1;

endmodule
