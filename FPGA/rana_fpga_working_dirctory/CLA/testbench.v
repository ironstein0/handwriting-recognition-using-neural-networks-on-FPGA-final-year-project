`timescale 1ns / 1ps

module testbench;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg Cin;

	// Outputs
	wire [7:0] S;
	wire Carry;
	wire PG;
	wire GG;
	
	integer i; 

	// Instantiate the Unit Under Test (UUT)
	CLA uut (
		.A(A), 
		.B(B), 
		.S(S), 
		.Carry(Carry), 
		.PG(PG), 
		.GG(GG), 
		.Cin(Cin)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Cin = 0;	
	end
     
	initial
			$monitor ( "A(%b) + B(%b)  = carry sum(%b %b)",A ,B ,Carry ,S );
		always @ (A or B or S)
		begin
		for (i = 10000; i < 65536 ; i = i + 1)
		#10 {A,B}= i;
		//A = 7'b101111001 ; B = 7'b101111100 ; Cin = 0 ;
		//#200 $stop;
		end
endmodule

