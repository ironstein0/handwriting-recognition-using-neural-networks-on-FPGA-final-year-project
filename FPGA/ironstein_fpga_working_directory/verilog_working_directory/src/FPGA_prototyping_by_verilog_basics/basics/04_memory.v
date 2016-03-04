module d_flip_flop(
	input wire clk,
	input wire d,
	output reg q
	);

	always @(posedge(clk))
		q = d;
endmodule

module d_flip_flop_with_async_reset(
	input wire clk,
	input wire d,
 	input wire reset,
	output reg q
	);

	always @(posedge(clk), posedge(reset)) begin
		if (reset) 
			q = 1'b0;
		else
			q = d;
	end
endmodule

module d_flip_flop_with_async_reset_sync_enable(
	input wire clk,
	input wire d,
	input wire reset,
	input wire enable,
	output reg q
	);

	always @(posedge(clk), posedge(reset)) begin
		if(reset) 	
			q = 1'b0;
		else if(enable) 
			q = d;
	end
endmodule

module register(
	input wire clk,reset,
	input wire [7:0] d,
	output reg [7:0] q 	
	);

	always @(posedge(clk)) begin
		if(reset) 
			q = 8'b0;
		else 
			q = d;
	end
endmodule

module stimulus();
	// reg d = 1'b0;
	// wire q;
	reg [7:0] d = 0;
	wire [7:0] q;
	reg clk = 1'b0;
	reg reset = 1'b0;
	reg enable = 1'b1;	
	// d_flip_flop_with_async_reset_sync_enable f1(.clk(clk),.d(d),.q(q),.reset(reset),.enable(enable));
	register r(.clk(clk),.reset(reset),.d(d),.q(q)); 
	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(1,clk,d,q,reset);	
	end

	always 
		#1 clk = ~clk;

	always
		#5 d = d + 1;

	always begin	
		#3 reset = ~ reset;
		#1 reset = ~ reset;
	end

	initial 
		#20 $finish;
endmodule	
