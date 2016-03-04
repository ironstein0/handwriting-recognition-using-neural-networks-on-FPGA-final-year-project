module eq1

	//I/O ports
	(
		input wire i0,i1,
		output wire eq
	);

	//Signal declaration
	wire p0,p1;

	//body
	assign eq = p0|p1;
	assign p0 = ~i0 & ~i1;
	assign p1 = i0 & i1;

endmodule

//top level stimulus module
module stimulus;
	
	reg DUMMY;
	reg I0,I1;
	wire EQ;
	eq1 E(.i0(I0),.i1(I1),.eq(EQ));

	initial
	begin
		$dumpfile("simulation.vcd");
		$dumpvars(DUMMY,I0,I1,EQ);
	end

	initial
	begin
		I0 = 1'b0;
		I1 = 1'b0;
	end

	always
		#1 I0 = ~ I0;

	always 
		#2 I1 = ~ I1;
		
	initial 
		#4 $finish;

endmodule