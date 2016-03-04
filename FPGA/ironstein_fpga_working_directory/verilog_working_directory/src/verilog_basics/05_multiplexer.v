module mux_4_to_1(i0,i1,i2,i3,s0,s1,o0);
	input s0,s1;
	input i0,i1,i2,i3;
	output o0;

	wire s0n,s1n;
	wire y0,y1,y2,y3;
	not (s0n,s0);
	not (s1n,s1);

	and (y0,i0,s0n,s1n);
	and (y1,i1,s0,s1n);
	and (y2,i2,s0n,s1);
	and (y3,i3,s0,s1);

	or (o0,y0,y1,y2,y3);
endmodule

module stimulus;
	reg IN0,IN1,IN2,IN3;
	reg S1,S0;
	wire OUTPUT;

	mux_4_to_1 m(IN0,IN1,IN2,IN3,S0,S1,OUTPUT);

	initial 
	begin
		$dumpfile("simulation.vcd");
		$dumpvars(IN0,IN1,IN2,IN3,S0,S1,OUTPUT);
	end

	initial
	begin
		IN0 = 1'b0;
		IN1 = 1'b1;
		IN2 = 1'b0;
		IN3 = 1'b1;
		S0 = 1'b0;
		S1 = 1'b0;
	end

	always
		#1 S0 = ~ S0;

	always 
		#2 S1 = ~ S1;

	initial 
		#10 $finish;
endmodule