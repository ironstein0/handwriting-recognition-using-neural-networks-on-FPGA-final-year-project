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