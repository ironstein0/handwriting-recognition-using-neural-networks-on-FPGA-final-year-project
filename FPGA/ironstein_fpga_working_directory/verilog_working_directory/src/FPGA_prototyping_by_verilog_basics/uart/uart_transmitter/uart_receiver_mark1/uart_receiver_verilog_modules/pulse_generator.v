module pulse_generator #(
	parameter PULSE_WIDTH = 4'd1
	)(
	input wire clk,
	input wire generate_pulse,
	output reg pulse
	);

	// state declarations
	localparam 
		off = 1'b0,
		on = 1'b1;

	// signal declarations
	reg state_reg = off;
	reg state_next = off; 
	reg [3:0] count = 0;

	// ---------- next state logic --------------
	always @(posedge(clk)) begin
		state_reg = state_next;
		count = count + 1;
	end

	always @(generate_pulse) begin
		if(state_reg == off) begin
				count = 0;
				pulse = 1;
				state_next = on;
		end
	end

	always @(count) begin
		if(state_reg == on) begin
				if(count == PULSE_WIDTH) begin
					pulse = 0;
					state_next = off;
				end
		end
	end
	//------------------------------------------

endmodule