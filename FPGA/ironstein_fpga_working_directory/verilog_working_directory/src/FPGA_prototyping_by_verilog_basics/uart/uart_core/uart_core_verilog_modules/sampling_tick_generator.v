module sampling_tick_generator #(
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
	reg [32:0] count;
	reg [32:0] count_threshold = (frequency)/(baudrate*16);
	reg [32:0] tick_threshold  = 5;
	reg state_reg,state_next;

	initial begin
		tick = 1'b0;
		count = 32'b0;
		state_reg = 1'b0;
	end

	always @(posedge(clk)) begin
		count = count + 1;
		state_reg = state_next;
	end

	always @* begin
		state_next = state_reg;
		case(state_reg)
			off :
				if(count == count_threshold) begin
					state_next = on;
					count = 0;
					tick = 1;
				end
			on :
				if(count == tick_threshold) begin
					state_next = off;
					tick = 0;
				end
		endcase
	end

endmodule