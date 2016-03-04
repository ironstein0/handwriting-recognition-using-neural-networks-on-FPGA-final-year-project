module stimulus();
	reg CLK;
	wire TICK;
	
	localparam BAUDRATE = 32'd115200;
	
	baudrate_tick_generator #(.baudrate(BAUDRATE))
	b(
		.clk(CLK),
		.tick(TICK)
	);	
	
	initial 
		CLK = 1'b0;
	
	always 
		#1 CLK = ~ CLK;
endmodule