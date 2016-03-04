`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:32:58 10/30/2015 
// Design Name: 
// Module Name:    Multistages 
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
module Multistages(
    input [0:3] a,
    input [0:3] b,
    output [0:3] sum,
    output carry
    );
wire cin;
        
        assign cin = 1'b0;
        SingleStage s0( .a( a[0] ), .b( b[0]), .cin( cin ), .s( sum[0]), .cout( ripple0 ) );
        SingleStage s1( .a( a[1] ), .b( b[1]), .cin( ripple0 ), .s( sum[1]), .cout( ripple1 ) );
        SingleStage s2( .a( a[2] ), .b( b[2]), .cin( ripple1 ), .s( sum[2]), .cout( ripple2 ) );
        SingleStage s3( .a( a[3] ), .b( b[3]), .cin( ripple2 ), .s( sum[3]), .cout( carry ) );

endmodule
