module stimulus(
	input wire CLK,
	output wire TICK
	);
	
	tick_generator #(.tick_time(32'd5000),.frequency(32'd100000))
		t(
			.clk(CLK),
			.tick(TICK)
		);
endmodule