`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:11:43 03/02/2016 
// Design Name: 
// Module Name:    My_Block_RAM 
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
module My_Block_RAM#(parameter DATA_WIDTH=18,
										 ADDRESS_WIDTH=10)(
	 input clock,
    input   [ADDRESS_WIDTH-1:0] read_addr,
    input   wr_en,
    input   [ADDRESS_WIDTH-1:0] write_addr,
    output [DATA_WIDTH-1:0] dout,
    input  [DATA_WIDTH-1:0] din
    );
	localparam  DATA_DEPTH=(1<<ADDRESS_WIDTH);
	reg [DATA_WIDTH-1:0] RAM [DATA_DEPTH-1:0];
	reg [ADDRESS_WIDTH-1:0] local_write_addr;
	reg [DATA_WIDTH-1:0] local_dout;
	
	always@(posedge clock) begin
		if(wr_en)
			RAM[write_addr]<=din;
		local_dout<=RAM[read_addr];
	end
	assign dout=local_dout;
endmodule
