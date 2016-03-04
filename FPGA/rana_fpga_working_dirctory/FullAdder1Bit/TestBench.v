`timescale 1ns / 1ps

module TestBench;

	// Inputs
	reg A;
	reg B;
	reg Cin;

	// Outputs
	wire Sum;
	wire Cout;
	
	integer i;
	// Instantiate the Unit Under Test (UUT)
	FullAdder1Bit uut (
		.A(A),
		.B(B),
		.Cin(Cin), 
		.Sum(Sum), 
		.Cout(Cout)
	);

  initial begin
         // Initialize Inputs
				A = 0;
            B = 0;
            Cin = 0;
         end

   always @ ( A, B, Cin )
          begin
          // generate truth table
          for ( i = 0; i < 8; i = i + 1 )
          // every 10 ns set a, b, and cin to the binary rep. of i
               #10 {A, B, Cin} = i;
                        
          // stop 10ns after last change of inputs
               #10 $stop;
			 end

endmodule
