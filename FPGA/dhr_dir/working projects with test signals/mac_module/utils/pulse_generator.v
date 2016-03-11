module pulse_generator #(
	parameter PULSE_WIDTH = 32'd1
	)(
	input wire clk,
	input wire generate_pulse,
	output reg pulse
	);
 
	reg [31:0] count;
	reg previous_pulse_value;
	
	initial begin
		count = 0;
		previous_pulse_value = 1'b0;
		pulse = 1'b0;
	end
	
	always @(posedge(clk)) begin
	
		if(previous_pulse_value != generate_pulse) begin
			count = 0;
			pulse = 1'b1;
			previous_pulse_value = generate_pulse;
		end

		if(count == PULSE_WIDTH) begin
			pulse = 1'b0;
		end else begin
			count = count + 1;
		end
	end

endmodule

//module stimulus();
// 	reg CLK,GENERATE_PULSE;
// 	wire PULSE;
//
// 	pulse_generator #(.PULSE_WIDTH(32'd1))
// 		p(
// 			.clk(CLK),
// 			.generate_pulse(GENERATE_PULSE),
// 			.pulse(PULSE)
// 		);
//
// 	initial begin
// 		$dumpfile("simulation.vcd");
// 		$dumpvars(0,
// 			CLK,
// 			PULSE,
// 			GENERATE_PULSE
// 		); 
// 	end
//
// 	initial begin
// 		CLK = 1'b0;
// 		GENERATE_PULSE = 1'b0;
// 	end
//
// 	always begin
// 		#1 CLK = ~ CLK;
// 	end
//
// 	always begin
// 		#10 GENERATE_PULSE = ~ GENERATE_PULSE;
// 	end
//
// 	initial begin
// 		#100 $finish;
// 	end
// endmodule // module