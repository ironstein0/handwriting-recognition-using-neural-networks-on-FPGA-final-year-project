`include "counter.v"

module stimulus();
	
	reg CLK,RESET;
	wire [3:0] COUNT;

	counter #(.N(4))
		c(
			.clk(CLK),
			.count(COUNT),
			.reset(RESET)
		);

	initial begin 
		$dumpfile("simulation.vcd");
		$dumpvars(0,CLK,COUNT,RESET);
	end

	initial begin
		CLK = 1'b0;
		RESET = 1'b0;
	end

	always 
		#1 CLK = ~ CLK;

	initial begin
		#20 RESET = 1'b1;
		#2 RESET = 1'b0;
	end

	initial 
		#100 $finish;
endmodule