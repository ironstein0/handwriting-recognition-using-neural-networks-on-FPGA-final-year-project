module tick_generator #(
	parameter tick_time = 32'd1000,
	parameter frequency = 32'd100000
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

// module stimulus();

// 	reg CLK;
// 	wire TICK;

// 	tick_generator #(.tick_time(32'd5),.frequency(32'd1)) t1(.clk(CLK),.tick(TICK));

// 	initial begin
// 		$dumpfile("simulation.vcd");
// 		$dumpvars(1,CLK,TICK);
// 	end

// 	initial	
// 		CLK = 1'b0;

// 	always
// 		#1 CLK = ~ CLK;

// 	initial
// 		#100 $finish;

module tick_generator #(
	parameter tick_time = 32'd1000,
	parameter frequency = 32'd100000
	)(
	input wire clk,
	output reg tick);

	reg [32:0] count;
	localparam [32:0] count_threshold = tick_time * frequency / 2;
	
	initial begin
		tick = 1'b0;
		count = 32'b0;
	end

	always @(posedge(clk)) begin
		count = count + 1;
		if(count == count_threshold) begin
			count = 0;
			tick = 1;
		end
		else begin
			tick = 0;
		end
	end

endmodule

// module stimulus();
//
// 	reg CLK;
// 	wire TICK;
//
// 	tick_generator #(.tick_time(32'd5),.frequency(32'd1)) t1(.clk(CLK),.tick(TICK));
//
// 	initial begin
// 		$dumpfile("simulation.vcd");
// 		$dumpvars(1,CLK,TICK);
// 	end
//
// 	initial	
// 		CLK = 1'b0;
//
// 	always
// 		#1 CLK = ~ CLK;
//
// 	initial
// 		#100 $finish;
//
// endmodule