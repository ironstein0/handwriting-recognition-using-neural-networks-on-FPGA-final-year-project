`timescale 1ns / 1ps
`include "uart_transmitter_core.v"

//-----------------------tick generator--------------------------------

module tick_generator #(
	parameter tick_time = 32'd10,
	parameter frequency = 32'd1
	)(
	input wire clk,
	output reg tick);

	reg [32:0] count;
	reg [32:0] count_threshold = tick_time * frequency / 2;
	
	initial begin
		tick = 1'b0;
		count = 32'b0;
	end

	always @(posedge(clk)) begin
		count = count + 1;
		if(count == count_threshold) begin
			count = 0;
			tick = ~ tick;
		end
	end

endmodule
// ----------------------------------------------------------------------
	
module stimulus();

	reg CLK;
	reg START;
	reg [7:0] D;
	wire FINISH;
	wire BIT_OUT;

	uart_transmitter_core R(
		.clk(CLK),
		.start(START),
		.shift_clk(TICK),
		.d(D),
		.bit_out(BIT_OUT),
		.finish(FINISH)
	);
	
	wire TICK;
	tick_generator T(
		.clk(CLK), 
		.tick(TICK)
	);
	
	initial begin 
		$dumpvars (CLK,TICK, START, D, BIT_OUT, FINISH);
	end	
	
	//assign OUT = 1'b0;
	
	
	initial begin
		CLK = 1'b0; 
		START = 1'b0;
		D = 8'b10101011;
		
	end
	
	always 
		#1 CLK = ~CLK;
		
	initial begin
		#10 START = 1'b1;
		#10 START = 1'b0;
		
		#1000 $finish;
	end
	
endmodule
