`include "pulse_generator.v"

module stimulus();

	reg CLK,GENERATE_PULSE;
	wire PULSE;

	pulse_generator #(.PULSE_WIDTH(3))
		p(
			.clk(CLK),
			.generate_pulse(GENERATE_PULSE),
			.pulse(PULSE)
		);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,CLK,GENERATE_PULSE,PULSE);
	end

	initial begin
		CLK = 1'b0;
		GENERATE_PULSE = 1'b0;
	end

	always
		#1 CLK = ~ CLK;


	always 
		#20 GENERATE_PULSE = ~ GENERATE_PULSE;

	initial 
		#100 $finish;
endmodule