`include "uart_core.v"

module stimulus();
	reg CLK;
	reg RX;
	wire [7:0] DATA;
	wire READ_FINISH;

	initial begin
		CLK = 1'b0;
		RX = 1'b1;
	end
	
	uart_receiver
		u(
			.clk(CLK),
			.rx(RX),
			.data(DATA),
			.read_finish(READ_FINISH)
		);

	initial begin
//		$dumpfile("simulation.vcd");
		$dumpvars(0,
			CLK,
			RX,
			DATA,
			READ_FINISH
		);
	end

	always 
		#1 clk = ~ clk;

	initial begin
		#100 rx = 0;
		#100 rx = 1;
		#17000 rx = 0;
	end
	
	initial begin
		#1000000000 $finish;
	end
endmodule