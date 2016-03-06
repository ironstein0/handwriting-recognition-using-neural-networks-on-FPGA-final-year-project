module baudrate_tick_generator #(
	parameter baudrate = 32'd9600,
	parameter frequency = 32'd100000000	// in Hz
	)(
	input wire clk,
	output reg tick);

	// state declaration
	localparam 
		off = 1'b0,
		on = 1'b1;

	// signal declaration
	reg [31:0] count = 0, tick_count = 0;
	reg [31:0] count_threshold = (frequency)/(baudrate*2);
	reg [31:0] tick_threshold = 1;

	initial begin
		tick = 1'b0;
		count = 32'b0;
	end

	always @(posedge(clk)) begin
		if(count == count_threshold) begin
			tick <= 1;
			count <= 0;
			tick_count <= 0;
		end else begin
			if(tick_count != tick_threshold) begin
				tick_count <= tick_count + 1;
			end else begin
				tick <= 0;
			end
			count <= count + 1;
		end
	end

endmodule
