module tx_baudrate_tick_generator #(
	parameter baudrate = 32'd9600,
	parameter frequency = 32'd100000000	// in Hz
	)(
	input wire clk,
	input wire reset,
	output reg tick
	);

	reg [31:0] count;
	localparam [31:0] count_threshold = frequency/(baudrate*2);
	
	initial begin
		tick = 1'b0;
		count = 31'b0;
	end

	always @(posedge(clk),posedge(reset)) begin
		if(reset) begin
			count = 0;
			tick = 0;
		end else begin
			if(count == count_threshold) begin
				count = 0;
				tick = 1;
			end else begin
				count = count + 1;
				tick = 0;
			end
		end
	end

endmodule

// module stimulus();

//  	reg CLK,RESET;
//  	wire TICK;

//  	tx_baudrate_tick_generator #(.baudrate(32'd9600),.frequency(32'd100000000)) 
// 	t1(
// 		.clk(CLK),
// 		.tick(TICK),
// 		.reset(RESET)
// 	);

//  	initial begin
//  		$dumpfile("simulation.vcd");
//  		$dumpvars(0,
//  			CLK,
//  			TICK,
//  			RESET
//  		);
//  	end

//  	initial begin
//  		CLK = 1'b0;
// 		RESET = 1'b0;
// 	end

//  	always
//  		#1 CLK = ~ CLK;

// 	initial begin
// 		#20 RESET = 1'b1;
// 		#10 RESET = 1'b0;
// 	end

//  	initial
//  		#10000 $finish;

//  endmodule