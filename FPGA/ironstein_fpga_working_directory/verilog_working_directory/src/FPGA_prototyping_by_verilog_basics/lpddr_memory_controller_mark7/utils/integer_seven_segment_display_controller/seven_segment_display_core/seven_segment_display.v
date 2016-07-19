module seven_segment_display (
	input wire [3:0] digit_to_be_displayed,
	input wire dp,
	input wire reset,
	output reg [7:0] led
	);

	always @* begin	
		if(reset) begin
			led[7:1] = 7'b1111110;
			led[0] = 1'b1;
		end else begin
			case(digit_to_be_displayed) 
				4'h0 : led[7:1] = 7'b0000001;
				4'h1 : led[7:1] = 7'b1001111;
				4'h2 : led[7:1] = 7'b0010010;
				4'h3 : led[7:1] = 7'b0000110;
				4'h4 : led[7:1] = 7'b1001100;
				4'h5 : led[7:1] = 7'b0100100;
				4'h6 : led[7:1] = 7'b0100000;
				4'h7 : led[7:1] = 7'b0001111;
				4'h8 : led[7:1] = 7'b0000000;
				4'h9 : led[7:1] = 7'b0000100;
				default : led[7:1] = 7'b1111111;
			endcase
			led[0] = dp;
		end
	end
endmodule

// module stimulus();
// 		reg [3:0] DIGIT_TO_BE_DISPLAYED;
// 		reg DP,RESET;
// 		wire [7:0] LED;

// 		seven_segment_display s(
// 			.digit_to_be_displayed(DIGIT_TO_BE_DISPLAYED),
// 			.dp(DP),
// 			.reset(RESET),
// 			.led(LED)
// 		);	

// 		initial begin
// 			$dumpfile("simulation.vcd");
// 			$dumpvars(0,
// 				DIGIT_TO_BE_DISPLAYED,
// 				DP,
// 				LED,
// 				RESET
// 			);
// 		end

// 		initial begin
// 			DIGIT_TO_BE_DISPLAYED = 0;
// 			DP = 1'b0;
// 			RESET = 1'b0;
// 		end

// 		always begin
// 			#1 DIGIT_TO_BE_DISPLAYED = DIGIT_TO_BE_DISPLAYED + 1;
// 			if(DIGIT_TO_BE_DISPLAYED == 10) begin
// 					DP = ~ DP;
// 					DIGIT_TO_BE_DISPLAYED = 0;
// 			end
// 		end

// 		initial begin
// 			#30 RESET = 1'b1;
// 			#10 RESET = 1'b0;
// 		end

// 		initial 
// 			#100 $finish;

// endmodule