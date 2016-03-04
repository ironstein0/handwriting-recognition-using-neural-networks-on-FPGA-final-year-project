module counter #(
	parameter N = 8,
	parameter OVERFLOW_VALUE = 2**N-1
	)(
	input wire clk,
	input wire reset,		// reset should be available for atleast 2 clock cycles
	output reg [N-1:0] count,
	output reg overflow
	);

	//signal declarations 

	initial 
		count = 0;

	always @(posedge(clk)) begin
		if(reset) begin
			count = 1;
		end
		else begin
			count = count + 1;
			if(count == OVERFLOW_VALUE) begin
				count = 0;
				overflow = 1;
			end
			else begin
				overflow = 0;
			end
		end
	end

endmodule











