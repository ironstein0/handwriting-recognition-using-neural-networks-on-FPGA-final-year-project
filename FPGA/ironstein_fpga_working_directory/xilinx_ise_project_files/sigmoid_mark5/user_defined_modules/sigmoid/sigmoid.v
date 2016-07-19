`include "utils/sigmoid_combinational.v"

module sigmoid(
	input wire clk,
	input wire reset,
	input wire [17:0] x1,
	output reg [47:0] fixed_op
	);
	
	wire [47:0] fixed_op_next;
	
	sigmoid_combinational sigmoid_combinational_instance1(
		.x1(x1),
		.fixed_op(fixed_op_next)
	);
	
	always @(posedge(clk),posedge(reset)) begin
		if(reset) begin
			fixed_op <= 0;
		end else begin
			fixed_op <= fixed_op_next;
		end
	end
	
endmodule