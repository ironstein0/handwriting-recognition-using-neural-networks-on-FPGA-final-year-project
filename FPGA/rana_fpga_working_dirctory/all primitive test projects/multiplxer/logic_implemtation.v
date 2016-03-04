`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:13:38 02/19/2016 
// Design Name: 
// Module Name:    gate_level_model 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module gate_level_model(
    input i0,
    input i1,
    input i2,
    input i3,
    input s0,
    input s1,
	 output out
    );

assign out = (~ s0 &  ~s1 & i0)|
					(~s0 & s1 & i1) |
					(s0 & ~s1 & i2)|
					(s0 & s1 & i3);
endmodule

module stimulus;

	reg IN0 , IN1, IN2, IN3;
	reg S1, S0;

	wire OUTPUT;

gate_level_model mymux(.out(OUTPUT), .i0(IN0), .i1(IN1), .i2(IN2) , .i3(IN3) , .s0(S0), .s1(S1));

initial 
	$dumpvars (IN0, IN1, IN2, IN3, S0, S1, OUTPUT);
	
initial
	begin
		#10;
		
		IN0 = 1; IN1= 0 ; IN2 = 1 ; IN3 = 0;
		#1 $display("IN0 = %b, IN1 = %b ,IN2 = %b , IN3 = %b \n" ,IN0 ,IN1 , IN2 , IN3);

		// choose IN0
		S1 = 0 ; S0 = 0;
		#1 $display("S1 = %b, S0 = %b, output = %b \n" ,S1,S0 , OUTPUT);

		S1 = 1 ; S0 = 0;
		#1 $display("S1 = %b, S0 = %b, output = %b \n ",S1,S0 , OUTPUT);

		S1 = 0 ; S0 = 1;
		#1 $display("S1 = %b, S0 = %b, output = %b \n ",S1,S0 , OUTPUT);

		S1 = 1 ; S0 = 1;
		#1 $display("S1 = %b, S0 = %b, output = %b \n ",S1,S0 , OUTPUT);
 
end

	
initial 
	#100 $finish;

endmodule
