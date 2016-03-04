module pulse_generator #(
	parameter PULSE_WIDTH = 32'd1
	)(
	input wire clk,
	input wire generate_pulse,
	output reg pulse
	);
 
	reg [31:0] count = 0;
	reg previous_pulse_value;
	
	initial begin
		#1 previous_pulse_value = generate_pulse;
		pulse = 1'b0;
	end
	
	always @(posedge(clk)) begin
	
		if(previous_pulse_value != generate_pulse) begin
			count = 0;
			pulse = 1'b1;
			previous_pulse_value = generate_pulse;
		end
		
		if(count == PULSE_WIDTH) begin
			pulse <= 1'b0;
		end else begin
			count <= count + 1;
		end
	end

endmodule