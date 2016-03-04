module stimulus(
	input wire CLK,
	output wire GENERATED_PULSE,
	output wire TICK
	);
	
	tick_generator #(.tick_time(32'd6000),.frequency(32'd100000))
		t(
			.clk(CLK),
			.tick(TICK)
		);
		
	pulse_generator #(.PULSE_WIDTH(32'd1000000))
		p(
			.clk(CLK),
			.generate_pulse(TICK),
			.pulse(GENERATED_PULSE)
		);
	
endmodule