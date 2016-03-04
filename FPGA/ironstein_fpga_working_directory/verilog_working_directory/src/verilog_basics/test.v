module and_(a,b,c);
	input wire a,b;
	output reg c;
	
	always @*
		c = a & b;
endmodule

module stimulus();
	
	and_ a(1,1,output_);
	and_ b(a=1,b=1,c=output_); //python style
	and_ c(.a(1),.b(1),.c(output_));
