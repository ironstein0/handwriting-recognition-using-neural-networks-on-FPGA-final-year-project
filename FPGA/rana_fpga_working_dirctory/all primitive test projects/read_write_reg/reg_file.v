`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:14:05 02/20/2016 
// Design Name: 
// Module Name:    reg_file 
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
module reg_file 
	#(
		parameter 	B = 8,  // number of bits to be read or write
						W = 2   // nuber of address bits
		)
	(
		input wire clk,
		input wire wr_en,
		input wire [W-1:0] w_addr, r_addr,
		input wire [B-1:0] w_data,
		output wire [B-1:0] r_data
		);

	// intermediate signal decleration  
	reg [B-1:0] array_reg [2**W-1: 0];

	// write operation
	always @(posedge clk) begin
		if (wr_en)
			array_reg[w_addr] <= w_data;
	end
	
	//read operation 
	assign r_data = array_reg[r_addr];
	
endmodule

module stimulus();
	reg CLK, WR_EN;
	reg [1:0] W_ADDR, R_ADDR;
	reg [7:0] W_DATA;
	wire[7:0] R_DATA;

	reg_file R(
				.clk(CLK),
				.wr_en(WR_EN),
				.w_addr(W_ADDR),
				.r_addr(R_ADDR),
				.w_data(W_DATA),
				.r_data(R_DATA)
				);
				
	initial 
		$dumpvars(CLK, WR_EN, W_DATA, R_DATA, W_ADDR, R_ADDR);
	
	initial begin
		CLK = 1'b0;
		W_ADDR = 1'b1;
		R_ADDR = 1'b1;
		W_DATA = 8'b1010;
		WR_EN = 1'b0;
	end

	always 
		#1 CLK = ~CLK;
		
	initial begin
		#10 WR_EN =1'b1;
		W_DATA = 8'd255;
		#10 WR_EN =1'b0;
		#100 $finish;
	end 
	
endmodule	