`include "counter.v"
`include "pulse_generator.v"

module stimulus();

	// counter signals
	reg CLK;
	wire [3:0] COUNT;
	wire OVERFLOW;
	// pulse generator signals
	reg GENERATE_PULSE;
	wire PULSE;

	counter #(.N(4))
		c(
			.clk(CLK),
			.count(COUNT),
			.reset(PULSE),
			.overflow(OVERFLOW)
		);

	pulse_generator #(.PULSE_WIDTH(2))
		p(
			.clk(CLK),
			.generate_pulse(GENERATE_PULSE),
			.pulse(PULSE)
		);

	initial begin 
		$dumpfile("simulation.vcd");
		$dumpvars(0,CLK,COUNT,PULSE,GENERATE_PULSE,OVERFLOW);
	end

	initial begin
		CLK = 1'b0;
		GENERATE_PULSE = 1'b0;
	end

	always 
		#1 CLK = ~ CLK;

	always 
		#41 GENERATE_PULSE = ~ GENERATE_PULSE;

	initial 
		#100 $finish;

endmodule