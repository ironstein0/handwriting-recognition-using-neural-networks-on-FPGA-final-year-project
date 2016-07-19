`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:00:54 02/26/2016
// Design Name:   sigmoid
// Module Name:   /home/kishore/Desktop/verilog_files/final_sigmoid_try/sigmoid_tb.v
// Project Name:  final_sigmoid_try
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sigmoid
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sigmoid_tb;

	// Inputs
	reg clk;
	reg [17:0] x1;
	//real itr=-5.0;
	//real tmp;
	
	// Outputs
	wire [47:0] fixed_op;
	wire [2:0] test;
	// Instantiate the Unit Under Test (UUT)
	sigmoid uut (
		.clk(clk), 
		.x1(x1), 
		.fixed_op(fixed_op),
		.test(test)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		#160 x1=18'b1_1011_0000000000000; //value in float:-11.0
		#80 x1=18'b1_1010_1110011001100; //value in float:-10.9
		
		#40 x1=18'b1_1010_1100110011001; //value in float:-10.8

		#40 x1=18'b1_1010_1011001100110; //value in float:-10.7

		#40 x1=18'b1_1010_1001100110011; //value in float:-10.6

		#40 x1=18'b1_1010_1000000000000; //value in float:-10.5

		#40 x1=18'b1_1010_0110011001100; //value in float:-10.4

		#40 x1=18'b1_1010_0100110011001; //value in float:-10.3

		#40 x1=18'b1_1010_0011001100110; //value in float:-10.2

		#40 x1=18'b1_1010_0001100110011; //value in float:-10.1

		#40 x1=18'b1_1010_0000000000000; //value in float:-10.0

		#40 x1=18'b1_1001_1110011001100; //value in float:-9.9

		#40 x1=18'b1_1001_1100110011001; //value in float:-9.8

		#40 x1=18'b1_1001_1011001100110; //value in float:-9.7

		#40 x1=18'b1_1001_1001100110011; //value in float:-9.6

		#40 x1=18'b1_1001_1000000000000; //value in float:-9.5

		#40 x1=18'b1_1001_0110011001100; //value in float:-9.4

		#40 x1=18'b1_1001_0100110011001; //value in float:-9.3

		#40 x1=18'b1_1001_0011001100110; //value in float:-9.2

		#40 x1=18'b1_1001_0001100110011; //value in float:-9.1

		#40 x1=18'b1_1001_0000000000000; //value in float:-9.0

		#40 x1=18'b1_1000_1110011001100; //value in float:-8.9

		#40 x1=18'b1_1000_1100110011001; //value in float:-8.8

		#40 x1=18'b1_1000_1011001100110; //value in float:-8.7

		#40 x1=18'b1_1000_1001100110011; //value in float:-8.6

		#40 x1=18'b1_1000_1000000000000; //value in float:-8.5

		#40 x1=18'b1_1000_0110011001100; //value in float:-8.4

		#40 x1=18'b1_1000_0100110011001; //value in float:-8.3

		#40 x1=18'b1_1000_0011001100110; //value in float:-8.2

		#40 x1=18'b1_1000_0001100110011; //value in float:-8.1

		#40 x1=18'b1_1000_0000000000000; //value in float:-8.0

		#40 x1=18'b1_0111_1110011001100; //value in float:-7.9

		#40 x1=18'b1_0111_1100110011001; //value in float:-7.8

		#40 x1=18'b1_0111_1011001100110; //value in float:-7.7

		#40 x1=18'b1_0111_1001100110011; //value in float:-7.6

		#40 x1=18'b1_0111_1000000000000; //value in float:-7.5

		#40 x1=18'b1_0111_0110011001100; //value in float:-7.4

		#40 x1=18'b1_0111_0100110011001; //value in float:-7.3

		#40 x1=18'b1_0111_0011001100110; //value in float:-7.2

		#40 x1=18'b1_0111_0001100110011; //value in float:-7.1

		#40 x1=18'b1_0111_0000000000000; //value in float:-7.0

		#40 x1=18'b1_0110_1110011001100; //value in float:-6.9

		#40 x1=18'b1_0110_1100110011001; //value in float:-6.8

		#40 x1=18'b1_0110_1011001100110; //value in float:-6.7

		#40 x1=18'b1_0110_1001100110011; //value in float:-6.6

		#40 x1=18'b1_0110_1000000000000; //value in float:-6.5

		#40 x1=18'b1_0110_0110011001100; //value in float:-6.4

		#40 x1=18'b1_0110_0100110011001; //value in float:-6.3

		#40 x1=18'b1_0110_0011001100110; //value in float:-6.2

		#40 x1=18'b1_0110_0001100110011; //value in float:-6.1

		#40 x1=18'b1_0110_0000000000000; //value in float:-6.0

		#40 x1=18'b1_0101_1110011001100; //value in float:-5.9

		#40 x1=18'b1_0101_1100110011001; //value in float:-5.8

		#40 x1=18'b1_0101_1011001100110; //value in float:-5.7

		#40 x1=18'b1_0101_1001100110011; //value in float:-5.6

		#40 x1=18'b1_0101_1000000000000; //value in float:-5.5

		#40 x1=18'b1_0101_0110011001100; //value in float:-5.4

		#40 x1=18'b1_0101_0100110011001; //value in float:-5.3

		#40 x1=18'b1_0101_0011001100110; //value in float:-5.2

		#40 x1=18'b1_0101_0001100110011; //value in float:-5.1

		#40 x1=18'b1_0101_0000000000000; //value in float:-5.0

		#40 x1=18'b1_0100_1110011001100; //value in float:-4.9

		#40 x1=18'b1_0100_1100110011001; //value in float:-4.8

		#40 x1=18'b1_0100_1011001100110; //value in float:-4.7

		#40 x1=18'b1_0100_1001100110011; //value in float:-4.6

		#40 x1=18'b1_0100_1000000000000; //value in float:-4.5

		#40 x1=18'b1_0100_0110011001100; //value in float:-4.4

		#40 x1=18'b1_0100_0100110011001; //value in float:-4.3

		#40 x1=18'b1_0100_0011001100110; //value in float:-4.2

		#40 x1=18'b1_0100_0001100110011; //value in float:-4.1

		#40 x1=18'b1_0100_0000000000000; //value in float:-4.0

		#40 x1=18'b1_0011_1110011001100; //value in float:-3.9

		#40 x1=18'b1_0011_1100110011001; //value in float:-3.8

		#40 x1=18'b1_0011_1011001100110; //value in float:-3.7

		#40 x1=18'b1_0011_1001100110011; //value in float:-3.6

		#40 x1=18'b1_0011_1000000000000; //value in float:-3.5

		#40 x1=18'b1_0011_0110011001100; //value in float:-3.4

		#40 x1=18'b1_0011_0100110011001; //value in float:-3.3

		#40 x1=18'b1_0011_0011001100110; //value in float:-3.2

		#40 x1=18'b1_0011_0001100110011; //value in float:-3.1

		#40 x1=18'b1_0011_0000000000000; //value in float:-3.0

		#40 x1=18'b1_0010_1110011001100; //value in float:-2.9

		#40 x1=18'b1_0010_1100110011001; //value in float:-2.8

		#40 x1=18'b1_0010_1011001100110; //value in float:-2.7

		#40 x1=18'b1_0010_1001100110011; //value in float:-2.6

		#40 x1=18'b1_0010_1000000000000; //value in float:-2.5

		#40 x1=18'b1_0010_0110011001100; //value in float:-2.4

		#40 x1=18'b1_0010_0100110011001; //value in float:-2.3

		#40 x1=18'b1_0010_0011001100110; //value in float:-2.2

		#40 x1=18'b1_0010_0001100110011; //value in float:-2.1

		#40 x1=18'b1_0010_0000000000000; //value in float:-2.0

		#40 x1=18'b1_0001_1110011001100; //value in float:-1.9

		#40 x1=18'b1_0001_1100110011001; //value in float:-1.8

		#40 x1=18'b1_0001_1011001100110; //value in float:-1.7

		#40 x1=18'b1_0001_1001100110011; //value in float:-1.6

		#40 x1=18'b1_0001_1000000000000; //value in float:-1.5

		#40 x1=18'b1_0001_0110011001100; //value in float:-1.4

		#40 x1=18'b1_0001_0100110011001; //value in float:-1.3

		#40 x1=18'b1_0001_0011001100110; //value in float:-1.2

		#40 x1=18'b1_0001_0001100110011; //value in float:-1.1

		#40 x1=18'b1_0001_0000000000000; //value in float:-1.0

		#40 x1=18'b1_0000_1110011001100; //value in float:-0.9

		#40 x1=18'b1_0000_1100110011001; //value in float:-0.8

		#40 x1=18'b1_0000_1011001100110; //value in float:-0.7

		#40 x1=18'b1_0000_1001100110011; //value in float:-0.6

		#40 x1=18'b1_0000_1000000000000; //value in float:-0.5

		#40 x1=18'b1_0000_0110011001100; //value in float:-0.4

		#40 x1=18'b1_0000_0100110011001; //value in float:-0.3

		#40 x1=18'b1_0000_0011001100110; //value in float:-0.2

		#40 x1=18'b1_0000_0001100110011; //value in float:-0.1

		#40 x1=18'b0_0000_0000000000000; //value in float:0.0

		#40 x1=18'b0_0000_0001100110011; //value in float:0.1

		#40 x1=18'b0_0000_0011001100110; //value in float:0.2

		#40 x1=18'b0_0000_0100110011001; //value in float:0.3

		#40 x1=18'b0_0000_0110011001100; //value in float:0.4

		#40 x1=18'b0_0000_0111111111111; //value in float:0.5

		#40 x1=18'b0_0000_1001100110011; //value in float:0.6

		#40 x1=18'b0_0000_1011001100110; //value in float:0.7

		#40 x1=18'b0_0000_1100110011001; //value in float:0.8

		#40 x1=18'b0_0000_1110011001100; //value in float:0.9

		#40 x1=18'b0_0000_1111111111111; //value in float:1.0

		#40 x1=18'b0_0001_0001100110011; //value in float:1.1

		#40 x1=18'b0_0001_0011001100110; //value in float:1.2

		#40 x1=18'b0_0001_0100110011001; //value in float:1.3

		#40 x1=18'b0_0001_0110011001100; //value in float:1.4

		#40 x1=18'b0_0001_0111111111111; //value in float:1.5

		#40 x1=18'b0_0001_1001100110011; //value in float:1.6

		#40 x1=18'b0_0001_1011001100110; //value in float:1.7

		#40 x1=18'b0_0001_1100110011001; //value in float:1.8

		#40 x1=18'b0_0001_1110011001100; //value in float:1.9

		#40 x1=18'b0_0001_1111111111111; //value in float:2.0

		#40 x1=18'b0_0010_0001100110011; //value in float:2.1

		#40 x1=18'b0_0010_0011001100110; //value in float:2.2

		#40 x1=18'b0_0010_0100110011001; //value in float:2.3

		#40 x1=18'b0_0010_0110011001100; //value in float:2.4

		#40 x1=18'b0_0010_0111111111111; //value in float:2.5

		#40 x1=18'b0_0010_1001100110011; //value in float:2.6

		#40 x1=18'b0_0010_1011001100110; //value in float:2.7

		#40 x1=18'b0_0010_1100110011001; //value in float:2.8

		#40 x1=18'b0_0010_1110011001100; //value in float:2.9

		#40 x1=18'b0_0010_1111111111111; //value in float:3.0

		#40 x1=18'b0_0011_0001100110011; //value in float:3.1

		#40 x1=18'b0_0011_0011001100110; //value in float:3.2

		#40 x1=18'b0_0011_0100110011001; //value in float:3.3

		#40 x1=18'b0_0011_0110011001100; //value in float:3.4

		#40 x1=18'b0_0011_0111111111111; //value in float:3.5

		#40 x1=18'b0_0011_1001100110011; //value in float:3.6

		#40 x1=18'b0_0011_1011001100110; //value in float:3.7

		#40 x1=18'b0_0011_1100110011001; //value in float:3.8

		#40 x1=18'b0_0011_1110011001100; //value in float:3.9

		#40 x1=18'b0_0011_1111111111111; //value in float:4.0

		#40 x1=18'b0_0100_0001100110011; //value in float:4.1

		#40 x1=18'b0_0100_0011001100110; //value in float:4.2

		#40 x1=18'b0_0100_0100110011001; //value in float:4.3

		#40 x1=18'b0_0100_0110011001100; //value in float:4.4

		#40 x1=18'b0_0100_0111111111111; //value in float:4.5

		#40 x1=18'b0_0100_1001100110011; //value in float:4.6

		#40 x1=18'b0_0100_1011001100110; //value in float:4.7

		#40 x1=18'b0_0100_1100110011001; //value in float:4.8

		#40 x1=18'b0_0100_1110011001100; //value in float:4.9

		#40 x1=18'b0_0100_1111111111111; //value in float:5.0

		#40 x1=18'b0_0101_0001100110011; //value in float:5.1

		#40 x1=18'b0_0101_0011001100110; //value in float:5.2

		#40 x1=18'b0_0101_0100110011001; //value in float:5.3

		#40 x1=18'b0_0101_0110011001100; //value in float:5.4

		#40 x1=18'b0_0101_0111111111111; //value in float:5.5

		#40 x1=18'b0_0101_1001100110011; //value in float:5.6

		#40 x1=18'b0_0101_1011001100110; //value in float:5.7

		#40 x1=18'b0_0101_1100110011001; //value in float:5.8

		#40 x1=18'b0_0101_1110011001100; //value in float:5.9

		#40 x1=18'b0_0101_1111111111111; //value in float:6.0

		#40 x1=18'b0_0110_0001100110011; //value in float:6.1

		#40 x1=18'b0_0110_0011001100110; //value in float:6.2

		#40 x1=18'b0_0110_0100110011001; //value in float:6.3

		#40 x1=18'b0_0110_0110011001100; //value in float:6.4

		#40 x1=18'b0_0110_0111111111111; //value in float:6.5

		#40 x1=18'b0_0110_1001100110011; //value in float:6.6

		#40 x1=18'b0_0110_1011001100110; //value in float:6.7

		#40 x1=18'b0_0110_1100110011001; //value in float:6.8

		#40 x1=18'b0_0110_1110011001100; //value in float:6.9

		#40 x1=18'b0_0110_1111111111111; //value in float:7.0

		#40 x1=18'b0_0111_0001100110011; //value in float:7.1

		#40 x1=18'b0_0111_0011001100110; //value in float:7.2

		#40 x1=18'b0_0111_0100110011001; //value in float:7.3

		#40 x1=18'b0_0111_0110011001100; //value in float:7.4

		#40 x1=18'b0_0111_0111111111111; //value in float:7.5

		#40 x1=18'b0_0111_1001100110011; //value in float:7.6

		#40 x1=18'b0_0111_1011001100110; //value in float:7.7

		#40 x1=18'b0_0111_1100110011001; //value in float:7.8

		#40 x1=18'b0_0111_1110011001100; //value in float:7.9

		#40 x1=18'b0_0111_1111111111111; //value in float:8.0

		#40 x1=18'b0_1000_0001100110011; //value in float:8.1

		#40 x1=18'b0_1000_0011001100110; //value in float:8.2

		#40 x1=18'b0_1000_0100110011001; //value in float:8.3

		#40 x1=18'b0_1000_0110011001100; //value in float:8.4

		#40 x1=18'b0_1000_0111111111111; //value in float:8.5

		#40 x1=18'b0_1000_1001100110011; //value in float:8.6

		#40 x1=18'b0_1000_1011001100110; //value in float:8.7

		#40 x1=18'b0_1000_1100110011001; //value in float:8.8

		#40 x1=18'b0_1000_1110011001100; //value in float:8.9

		#40 x1=18'b0_1000_1111111111111; //value in float:9.0

		#40 x1=18'b0_1001_0001100110011; //value in float:9.1

		#40 x1=18'b0_1001_0011001100110; //value in float:9.2

		#40 x1=18'b0_1001_0100110011001; //value in float:9.3

		#40 x1=18'b0_1001_0110011001100; //value in float:9.4

		#40 x1=18'b0_1001_0111111111111; //value in float:9.5

		#40 x1=18'b0_1001_1001100110011; //value in float:9.6

		#40 x1=18'b0_1001_1011001100110; //value in float:9.7

		#40 x1=18'b0_1001_1100110011001; //value in float:9.8

		#40 x1=18'b0_1001_1110011001100; //value in float:9.9

		#40 x1=18'b0_1001_1111111111111; //value in float:10.0

		#40 x1=18'b0_1010_0001100110011; //value in float:10.1

		#40 x1=18'b0_1010_0011001100110; //value in float:10.2

		#40 x1=18'b0_1010_0100110011001; //value in float:10.3

		#40 x1=18'b0_1010_0110011001100; //value in float:10.4

		#40 x1=18'b0_1010_0111111111111; //value in float:10.5

		#40 x1=18'b0_1010_1001100110011; //value in float:10.6

		#40 x1=18'b0_1010_1011001100110; //value in float:10.7

		#40 x1=18'b0_1010_1100110011001; //value in float:10.8

		#40 x1=18'b0_1010_1110011001100; //value in float:10.9

		#40 x1=18'b0_1010_1111111111111; //value in float:11.0


	end
/********this code works,DO NOT CHANGE********/		
		//$dumpfile("/home/kishore/Desktop/sigmoid_plot.vcd");
		//$dumpvars(1,x,fixed_op);//plot only changes in x and fixed_op
		//$dumpoff;
		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here
		//fixed_op takes at least two clock cycles
//		#40
//		//x=18'b00100_1111111110111;    binary
//		 //$dumpon;
//		 x=18'h09ff7;               // or hex format of +4.999
//		 //$dumpoff;
//		#40
//		//x=18'b00110_0001100110011;//+6.1
//		//$dumpon;
//		x=18'hc333;
//		//$dumpoff;
//		#40
//		//x=18'b00010_1100110011001;//+2.8
//		//$dumpon ;
//		x=18'h5999;
//		//$dumpoff;
//		#40
//		//x=18'b00000_1110000000000;//+0.875
//		//$dumpon;
//		x=18'h1c00;
//		end
//		//$dumpoff;
	initial begin
		$monitor("x: %h  ,fixed_op:%d",x1,fixed_op);
	end
	
	
	always begin
	#20 clk=~clk;
	end
      
endmodule

