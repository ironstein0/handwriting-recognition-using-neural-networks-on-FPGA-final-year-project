module stimulus();

	reg CLK;
	wire TICK;

	sampling_tick_generator #(.baudrate(32'd112000),.frequency(32'd100000000)) 
		t1(
			.clk(CLK),
			.tick(TICK)
		);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(1,CLK,TICK);
	end

	initial	
		CLK = 1'b0;

	always
		#1 CLK = ~ CLK;

	initial
		#500 $finish;

endmodule