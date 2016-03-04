module blinky(CLK,LED,A2,B2,B3); 


	//-------------- initializations ------------- 
	output wire A2,B2,B3;
	initialize_all i(.a2(A2),.b2(B2),.b3(B3));
	//-------------------------------------------
	
	input wire CLK;
	output wire LED1,LED2,LED3;
	defparam b1.seconds = 4'd1,b2.seconds = 4'd2,b3.seconds = 4'd4;
	blink b1(.clk(CLK),.led(LED1));
	blink b2(.clk(CLK),.led(LED2));
	blink b3(.clk(CLK),.led(LED3));
endmodule

module blink(clk,led);
	input clk;
	output reg led;
	parameter seconds = 1'd1;
	reg [32:0] expected_count;
	reg [32:0] count = 32'd0;
	
	initial 
		expected_count = seconds*32'd10;	//convert seconds to 10^8 seconds
	initial
		led = 1'b1;
		
	always @(posedge(clk)) begin
		count = count + 1;
		if (count == expected_count) begin
			led = ~ led;
			count = 0;
		end
	end
endmodule

module initialize_all(a2,b2,b3);

	//------- disable seven segment display -------	
	output reg a2,b2,b3;
	initial begin
		a2 = 1'b1;
		b2 = 1'b1;
		b3 = 1'b1;
	end
	//---------------------------------------------
endmodule

module stimulus();
	reg clk,dummy;
	wire led,a2,b2,b3;
	blinky b(clk,led,a2,b2,b3);
	
	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(dummy,clk,led);
	end
	
	initial 
		clk = 1'b0;

	always 
		#1 clk = ~ clk;
	
	initial 
		#1000 $finish;
endmodule
