`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:54:54 02/25/2016 
// Design Name: 
// Module Name:    VG_ROM_8x18 
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
module VG_ROM_8x18(
    input [1:0] addr,
    output reg [17:0] dout1,
    output reg [17:0] dout2
    );


//BEWARE clock enabled memory causes uncertain behaviour at the output
//reg [1:0] local_addr;
//always@(posedge clk)
//	local_addr<=addr;
always @(*) begin 
	case(addr)
		4'h0: begin 
				dout1<=18'h00000;//+0.0
				dout2<=18'h00000;//+0.0
				end
		4'h1: begin 
				dout1<=18'b0_0000_000001000000;//+0.015625
				dout2<=18'b0_0000_0010000000000;//+0.125
				end
		4'h2: begin 
				dout1<=18'b0_0000_0100000000000;//+0.25
				dout2<=18'b0_0000_1000000000000;//+0.5
				end
		4'h3: begin 
				dout1<=18'b0_0000_0000010000000;//+0.015625
				dout2<=18'b0_0000_1110000000000;//+0.875
				end
	endcase

end


endmodule
