`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:35:40 03/07/2016 
// Design Name: 
// Module Name:    MAC_with_memory 
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
module MAC_with_memory(
    input [17:0] a,
    input [17:0] b,
    input [47:0] c,
    output [47:0] MAC_out,
    input clk,
	 input rst,
    input ce,
	 output [17:0] bcout,
	 output carryout,carryoutf
    );

wire [7:0] opmode;

assign opmode=8'b000010010;
DSP48A1 my_dsp (.A(a),
					 .B(b),
					 .C(c),
					 .P(MAC_out),
					 .CLK(clk),
					 .CARRYIN(1'b0),
					 .OPMODE(opmode),
					 .RSTA(rst),
					 .RSTB(rst),
					 .RSTC(rst),
					 .RSTP(rst),
					 .RSTCARRYIN(rst),
					 .RSTOPMODE(rst),
					 .CEA(ce),
					 .CEB(ce),
					 .CEC(ce),
					 .CEP(ce),
					 .CECARRYIN(ce),
					 .CEOPMODE(ce),
					 .PCIN(48'b0),
					 .BCOUT(bcout),
					 .CARRYOUT(carryout),
					 .CARRYOUTF(caryoutf)

);
		
endmodule
