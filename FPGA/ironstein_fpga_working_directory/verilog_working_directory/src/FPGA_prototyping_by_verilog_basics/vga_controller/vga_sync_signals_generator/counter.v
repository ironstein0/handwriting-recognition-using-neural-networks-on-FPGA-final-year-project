module counter(
	input wire count_tick,
	input wire reset,
	input wire count_reset,
	output reg [31:0] count
	);

	always @(posedge(count_tick),posedge(reset),posedge(count_reset)) begin
		if(reset) begin
			count = 0;
		end else if(count_reset) begin
			count = 0;
		end else begin
			count = count + 1;
		end 
	end
endmodule

// module stimulus();
// 	reg COUNT_TICK,RESET,COUNT_RESET;
// 	wire [31:0] COUNT;

// 	counter c(
// 		.count_tick(COUNT_TICK),
// 		.reset(RESET),
// 		.count_reset(COUNT_RESET),
// 		.count(COUNT)
// 	);

// 	initial begin
// 		$dumpfile("simulation.vcd");
// 		$dumpvars(0,
// 			COUNT_TICK,
// 			RESET,
// 			COUNT_RESET,
// 			COUNT
// 		);
// 	end

// 	initial begin
// 		COUNT_TICK = 1'b0;
// 		RESET = 1'b0;
// 		COUNT_RESET = 1'b0;
// 	end

// 	always begin
// 		#1 COUNT_TICK = ~ COUNT_TICK;
// 	end

// 	initial begin
// 		#10 RESET = 1'b1;
// 		#10 RESET = 1'b0;
// 		#10 COUNT_RESET = 1'b1;
// 		#10 COUNT_RESET = 1'b0;
// 	end

// 	initial begin
// 		#100 $finish;
// 	end
// endmodule