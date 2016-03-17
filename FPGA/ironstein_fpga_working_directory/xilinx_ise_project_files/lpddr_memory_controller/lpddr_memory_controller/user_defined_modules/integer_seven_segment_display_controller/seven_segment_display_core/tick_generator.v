module tick_generator #(
	parameter tick_time = 32'd1000,
	parameter frequency = 32'd100000
	)(
	input wire clk,
	input wire reset,
	output reg tick);

	reg [32:0] count;
	localparam [32:0] count_threshold = tick_time * frequency / 2;
	
	initial begin
		tick = 1'b0;
		count = 32'b0;
	end

	always @(posedge(clk),posedge(reset)) begin
		if(reset) begin
			count = 0;
			tick = 0;
		end else begin
			count = count + 1;
			if(count == count_threshold) begin
				count = 0;
				tick = ~ tick;
			end
		end
	end

endmodule

 // module stimulus();

 // 	reg CLK,RESET;
 // 	wire TICK;

 // 	tick_generator #(.tick_time(32'd5),.frequency(32'd1)) 
	// t1(
	// 	.clk(CLK),
	// 	.tick(TICK),
	// 	.reset(RESET)
	// );

 // 	initial begin
 // 		$dumpfile("simulation.vcd");
 // 		$dumpvars(0,
 // 			CLK,
 // 			TICK,
 // 			RESET
 // 		);
 // 	end

 // 	initial begin
 // 		CLK = 1'b0;
	// 	RESET = 1'b0;
	// end

 // 	always
 // 		#1 CLK = ~ CLK;

	// initial begin
	// 	#20 RESET = 1'b1;
	// 	#10 RESET = 1'b0;
	// end

 // 	initial
 // 		#100 $finish;

 // endmodule