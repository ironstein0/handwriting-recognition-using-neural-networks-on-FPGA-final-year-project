`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:54:54 02/25/2016 
// Design Name: 
// Module Name:    VG_ROM
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
module VG_ROM(
input enable,
    input clk,
    input addr,
    output  dout1,
    output  dout2
    );
parameter DATA_WIDTH=18;
parameter ADDRESS_WIDTH=2;
parameter DATA_DEPTH=1<<ADDRESS_WIDTH;
reg [ADDRESS_WIDTH-1:0] local_addr;
reg [DATA_WIDTH-1:0] local_dout1,local_dout2;

assign dout1=enable?local_dout1:{(DATA_WIDTH-1)*0};
assign dout2=enable?local_dout2:{(DATA_WIDTH-1)*0};

always@(enable)
	local_addr=addr;
	
always @(*) begin 
	case(local_addr)
		4'h0: begin 
				local_dout1<=18'h00000;//+0.0
				local_dout2<=18'h00000;//+0.0
				end
		4'h1: begin 
				local_dout1<=18'b0_0000_000001000000;//+0.015625
				local_dout2<=18'b0_0000_0010000000000;//+0.125
				end
		4'h2: begin 
				local_dout1<=18'b0_0000_0100000000000;//+0.25
				local_dout2<=18'b0_0000_1000000000000;//+0.5
				end
		4'h3: begin 
				local_dout1<=18'b0_0000_0000010000000;//+0.015625
				local_dout2<=18'b0_0000_1110000000000;//+0.875
				end
	endcase

end


endmodule
