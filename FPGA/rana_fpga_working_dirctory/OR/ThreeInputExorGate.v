`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:08:39 10/25/2015 
// Design Name: 
// Module Name:    ThreeInputExorGate 
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
module ThreeInputExorGate(
    input i1,
    input i2,
    input i3,
    output Output
    );

xor (Output,i1,i2,i3);

endmodule
