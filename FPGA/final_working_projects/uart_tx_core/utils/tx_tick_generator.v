module tx_tick_generator #(
	parameter tick_time = 32'd1000,
	parameter frequency = 32'd100000
	)(
	input wire clk,
	input wire reset,
	output reg tick,
	);

	reg [32:0] count;
	localparam [32:0] count_threshold = tick_time * frequency / 2;
	
	initial begin
		tick = 1'b0;
		count = 32'b0;
	end

	always @(posedge(clk),posedge(reset)) begin
		if(reset) begin
			count = 32'b0;
			tick = 1'b0;
		end else begin
			if(count == count_threshold) begin
				count = 32'b0;
				tick = 1'b1;
			end else begin
				tick = 1'b0;
				count = count + 1;
			end
		end
	end

endmodule