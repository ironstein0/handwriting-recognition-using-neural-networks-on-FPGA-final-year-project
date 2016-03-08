`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:38:31 03/02/2016 
// Design Name: 
// Module Name:    Random_size_Block_RAM 
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
module Random_size_Block_RAM#(parameter my_data_width=18,
													 my_address_width=14)(
	 input clock,
    input [my_address_width-1:0] read_addr,
    input [my_address_width-1:0]write_addr,
    input wr_en,
    input [my_data_width-1:0]write_data,
    output[my_data_width-1:0]read_data
    );

My_Block_RAM #(.DATA_WIDTH(my_data_width),.ADDRESS_WIDTH(my_address_width)) RAM18x12kB 
(.read_addr(read_addr),
	.write_addr(write_addr),
	.wr_en(wr_en),
	.din(write_data),
	.dout(read_data),
	.clock(clock)
	);



endmodule
