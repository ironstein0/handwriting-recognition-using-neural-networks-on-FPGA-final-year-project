module top_level_module(
	input s0,
	input s1,
	output reg p0,
	output reg p1 
	);
	//always block syntax

	always @(s0,s1) begin
		p0 = s0 & s1;
		p1 = s0 | s1;
	end
endmodule

module stimulus();
	
	reg S0,S1,dummy;
	wire P0,P1;
	top_level_module t(.s0(S0),.s1(S1),.p0(P0),.p1(P1));
	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(dummy,S0,S1,P0,P1);
		S0 = 1'b0;
		S1 = 1'b0;
	end

	always 
		#1 S0 = ~S0;
	always 
		#2 S1 = ~S1;

	initial 
		#10 $finish;

endmodule
