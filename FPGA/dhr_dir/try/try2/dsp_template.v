`timescale 1ns / 1ps

module dsp_template #(
	parameter NO_OF_BITS = 16
	// parameter [7:0] opmode
	)(
	input wire clk,
	input wire reset,

	input wire [NO_OF_BITS-1:0] 		d_data,
	input wire 							d_valid,

	input wire [NO_OF_BITS-1:0] 		b_data,
	input wire 							b_valid,

	input wire [NO_OF_BITS-1:0] 		a_data,
	input wire 							a_valid,

	input wire [(NO_OF_BITS*2)-1:0] 	c_data,
	input wire 							c_valid,

	output wire [(NO_OF_BITS*2)-1:0] 	p_data,
	output wire 						p_ready
	);

	reg [NO_OF_BITS-1:0]		reg_d;
	reg [NO_OF_BITS-1:0]		reg_b0;
	reg [NO_OF_BITS-1:0]		reg_b1;
	reg [NO_OF_BITS-1:0]		reg_a0;
	reg [NO_OF_BITS-1:0]		reg_a1;
	reg [(NO_OF_BITS*2)-1:0]	reg_c;
	reg [(NO_OF_BITS*2)-1:0]	reg_m;
	reg [(NO_OF_BITS*2)-1:0]	reg_p;
	
	wire start_action = d_valid & b_valid & a_valid & c_valid;

	assign p_data = reg_p;

	initial begin
		reg_d  = 0;
		reg_b0 = 0;
		reg_b1 = 0;
		reg_a0 = 0;
		reg_a1 = 0;
		reg_c  = 0;
		reg_m  = 0;
		reg_p  = 0;
	end //initial

	always @(posedge clk) begin
		if(start_action) begin

			// load input values
			reg_d  <= d_data;
			reg_b0 <= b_data;
			reg_a0 <= a_data;
			reg_c  <= c_data;

			// pre-adder and pipeline
//			reg_b1 <= reg_d + reg_b0;
			reg_a1 <= reg_a0;

			// multiply
//			reg_m <= reg_a1 * reg_b1;

			// post-adder
//			reg_p <= reg_m + reg_c;
			
			// ALL TOGETHER
			reg_p <= reg_c + (reg_a1 * (reg_b0 + reg_d));

		end // if(start_action)
	end // always @(posedge clk)

endmodule // dsp_template