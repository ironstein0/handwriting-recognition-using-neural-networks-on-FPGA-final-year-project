`include "serial_input_parallel_output_shift_register.v"
`include "tick_generator.v"

module stimulus();

	// --------- tick_generator ------------
	reg CLK;
	wire SHIFT_REGISTER_TICK;

	tick_generator #(.tick_time(10),.frequency(1))
		tg1(
			.clk(CLK),
			.tick(SHIFT_REGISTER_TICK)
		);

	initial begin
		CLK = 1'b0;
	end
	//-------------------------------------

	// --- serial_input_parallel_output_shift_register ---
	reg START,S_IN;
	wire FINISH;
	wire [7:0] DATA;
	wire STATE;

	serial_input_parallel_output_shift_register #(.N(8))
		s(
			.clk(CLK),
			.shift_register_tick(SHIFT_REGISTER_TICK),
			.start(START),
			.s_in(S_IN),
			.finish(FINISH),
			.data(DATA),
			.state_reg(STATE)
		);

	initial begin
		S_IN = 1'b1;
		START = 1'b0;
	end
	//----------------------------------------------------

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			CLK,
			SHIFT_REGISTER_TICK,
			START,
			S_IN,
			STATE,
			DATA,
			FINISH
		);
	end

	always begin
		#1 CLK = ~ CLK;
	end

	initial begin
		#2 START = 1'b1;
		#4 START = 1'b0;
		#200 S_IN = 0;
		START = 1'b1;
		#202 START = 2'b0;
	end

	initial 
		#1000 $finish;

endmodule