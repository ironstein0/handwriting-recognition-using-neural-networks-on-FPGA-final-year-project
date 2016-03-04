`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:22:21 10/30/2015 
// Design Name: 
// Module Name:    SingleStage 
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
module SingleStage(
    input a,
    input b,
    input cin,
    output cout,
    output s
    );
    assign s = a ^ b ^ cin;
    assign cout = (a & b)  |  (a & cin)  |  (b & cin);

endmodule
