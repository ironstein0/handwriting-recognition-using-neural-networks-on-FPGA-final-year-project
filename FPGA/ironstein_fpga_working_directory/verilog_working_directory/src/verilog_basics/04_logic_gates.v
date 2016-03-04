module logic_gates;
	wire OUT_AND,OUT_NAND,OUT_OR,OUT_NOR,OUT_XOR,OUT_XNOR;
	reg IN1,IN2;
	reg clock;
	and a1(OUT_AND,IN1,IN2);
	nand na1(OUT_NAND,IN1,IN2);
	or or1(OUT_OR,IN1,IN2);
	nor nor1(OUT_NOR,IN1,IN2);
	xor xor1(OUT_XOR,IN1,IN2);
	xnor xnor1(OUT_XNOR,IN1,IN2);
	
	initial
		begin
			$dumpfile("logic_gates.vcd");
			$dumpvars(clock,IN1,IN2,OUT_AND,OUT_NAND,OUT_OR,OUT_NOR,OUT_XOR,OUT_XNOR);
			clock = 1'b0;
			IN1 = 1'b0;
			IN2 = 1'b0;
		end

	always
		#5 clock = ~clock;

	always 
		#5 IN1 = ~ IN1;

	always 
		#10 IN2 = ~ IN2;
		
	initial 
		#50 $finish;

endmodule