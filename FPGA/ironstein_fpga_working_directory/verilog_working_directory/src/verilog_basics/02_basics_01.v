module stimulus;
	
	reg x,y,a,b,m,p;

	initial
	begin
		$dumpfile("test.vcd");
		$dumpvars(0,x,y,a,b,m,p);
	end

	initial
	begin
		p = 1'b0;
		m = 1'b0;
	end

	initial 
	begin
		#5 a = 1'b1;
		#25 b = 1'b0;
	end

	initial
	begin
		#10 x = 1'b0;
		#25 y = 1'b1;
	end

	// initial 
	// begin
	// 	p = 1'b0;
	// 	#5 p = 1'b1;
	// 	#5 p = 1'b0;
	// 	#5 p = 1'b1;
	// 	#5 p = 1'b0;
	// 	#5 p = 1'b1;
	// 	#5 p = 1'b0;
	// 	#5 p = 1'b1;
	// 	#5 p = 1'b0;
	// 	#5 p = 1'b1;
	// 	#5 p = 1'b0;
	// end

	always
		#2 p = ~p;

	initial
		#50 $finish;

	// always
	// 	#5 $display("the current time is %t",$time);

	initial 
		#30 $stop;

endmodule
