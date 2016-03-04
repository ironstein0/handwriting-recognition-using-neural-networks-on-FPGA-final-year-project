`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:

////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg [0:3] a;
	reg [0:3] b;

	// Outputs
	wire [0:3] sum;
	wire carry;
	
	integer i;
	// Instantiate the Unit Under Test (UUT)
	Multistages uut (
		.a(a), 
		.b(b), 
		.sum(sum), 
		.carry(carry) 
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
	end
	initial
          $monitor( "a(%b) + b(%b)  = carry sum(%b %b)", a, b, carry, sum );      
  always @(a or b)
           begin
			 
            for ( i = 0; i< 16 * 16; i = i + 1 ) 
            #10 {a,b} = i;
           end         
//           #10 $stop;	
		
     
endmodule

