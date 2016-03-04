module mux4_to_1(i0,i1,i2,i3,s0,s1,out);
	input i0,i1,i2,i3,s0,s1;
	output out;

	// assign out = (s0 & s1 & i3) |
	// 		(~s0 & s1 & i2) |
	// 		(s0 & ~s1 & i1) | 
	// 		(~s0 & ~s1 & i0);
	assign out = s1 ? (s0 ? i3 : i2) : (s0 ? i1 : i0);

endmodule

module stimulus;

	reg DUMMY;
	reg [3:0] I;
	reg [1:0] S;
	wire OUT;
	mux4_to_1 m1(I[0],I[1],I[2],I[3],S[0],S[1],OUT);

	initial	
	begin
		$dumpfile("simulation.vcd");
		$dumpvars(DUMMY,I,S,OUT);
	end

	initial
	begin
		I = 4'b1100;
		S = 2'd0;
	end

	always
		#1 S[0] = ~ S[0];

	always 
		#2 S[1] = ~ S[1];

	initial
		#4 $finish;
endmodule