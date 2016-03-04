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

module ripple_carry_adder_4_bit(a,b,sum,c_in,c_out);

	input [3:0] a,b;
	input c_in;
	output [3:0] sum;
	output c_out,c_out_1,c_out_2,c_out_3;

	adder_1_bit a1(a[0],b[0],sum[0],c_in,c_out_1);
	adder_1_bit a2(a[1],b[1],sum[1],c_out_1,c_out_2);
	adder_1_bit a3(a[2],b[2],sum[2],c_out_2,c_out_3);
	adder_1_bit a4(a[3],b[3],sum[3],c_out_3,c_out);

endmodule

module stimulus;
	
	reg DUMMY;
	reg [3:0] A,B;
	reg C_IN;
	wire [3:0] SUM;
	wire C_OUT;
	ripple_carry_adder_4_bit a4_1(A,B,SUM,C_IN,C_OUT);

	initial 
	begin
		$dumpfile("simulation.vcd");
		$dumpvars(DUMMY,A,B,C_IN,C_OUT,SUM);
	end

	initial
	begin
		A = 4'd0;
		B = 4'd0;
		C_IN = 1'b0;
	end

	always
		#1 A[0] = ~ A[0];
	always
		#2 A[1] = ~ A[1];
	always 
		#4 A[2] = ~ A[2];
	always 
		#8 A[3] = ~ A[3];

	always
		#1 B[0] = ~ B[0];
	always
		#2 B[1] = ~ B[1];
	always 
		#4 B[2] = ~ B[2];
	always 
		#8 B[3] = ~ B[3];

	always 
		#16 C_IN = ~ C_IN;

	initial 
		#32 $finish;

endmodule