module adder_1_bit(a,b,sum,c_in,c_out);
	output sum,c_out;
	input a,b,c_in;
	wire s1,c1,c2;

	xor (s1,a,b);
	xor (sum,s1,c_in);

	and (c1,a,b);
	and (c2,s1,c_in);
	or (c_out,c1,c2);
endmodule

module stimulus;
	reg C_IN,A,B;
	wire C_OUT,SUM,DUMMY;
	adder_1_bit a1(A,B,SUM,C_IN,C_OUT);

	initial
	begin
		$dumpfile("simulation.vcd");
		$dumpvars(DUMMY,A,B,C_IN,SUM,C_OUT);
	end

	initial
	begin
		A = 0;
		B = 0;
		C_IN = 0;
	end

	always
		#1 A = ~ A;

	always
		#2 B = ~ B;

	always
		#4 C_IN = ~ C_IN;

	initial 
		#16 $finish;
endmodule