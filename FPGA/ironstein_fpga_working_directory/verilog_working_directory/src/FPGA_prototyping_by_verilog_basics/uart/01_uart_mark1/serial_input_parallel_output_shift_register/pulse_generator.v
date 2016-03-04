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
	reg state_next; 
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

// module stimulus();

// 	reg CLK,GENERATE_PULSE;
// 	wire PULSE;

// 	pulse_generator #(.PULSE_WIDTH(3))
// 		p(
// 			.clk(CLK),
// 			.generate_pulse(GENERATE_PULSE),
// 			.pulse(PULSE)
// 		);

// 	initial begin
// 		$dumpfile("simulation.vcd");
// 		$dumpvars(0,CLK,GENERATE_PULSE,PULSE);
// 	end

// 	initial begin
// 		CLK = 1'b0;
// 		GENERATE_PULSE = 1'b0;
// 	end

// 	always
// 		#1 CLK = ~ CLK;


// 	always 
// 		#20 GENERATE_PULSE = ~ GENERATE_PULSE;

// 	initial 
// 		#100 $finish;
// endmodule