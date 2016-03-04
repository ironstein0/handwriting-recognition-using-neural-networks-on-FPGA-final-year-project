module shift_register(clk,b_in,b_out,p_out);
	
	input clk,b_in;
	output b_out;
	output [3:0] p_out;

	parameter temp = 4'b1010;
	reg [3:0] bits = temp;

	// initial
	// 	bits = 4'b1010;

	always @(negedge clk)
		begin
			bits = bits << 1;
			bits[0] = b_in;	
		end

	assign p_out = bits;
	assign b_out = bits[3];

endmodule

module simulate;
	
	// reg clk,b_in_1,b_in_2;
	reg clk;
	wire b_out_1,b_out_2;
	wire [3:0] p_out_1,p_out_2;
	defparam sr1.temp = 4'b1111, sr2.temp=4'b0000;

	shift_register sr1(clk,b_out_2,b_out_1,p_out_1);
	shift_register sr2(clk,b_out_1,b_out_2,p_out_2);
	initial
		begin
			$dumpfile("shift_register.vcd");
			// $dumpvars(clk,b_in,b_out,p_out);
			$dumpvars(clk,p_out_1,p_out_2);
		end

	initial 
		//initial values
		begin
			clk = 1'b1;
		end

	always
		//clock
		#5 clk = ~clk;

	initial 
		//terminate simulation
		#100 $finish;

endmodule