module counter #(
	parameter N = 8,
	parameter OVERFLOW_VALUE = 2**N-1
	)(
	input wire clk,
	input wire count_increment_clk,
	input wire reset,		// reset should be available for atleast 2 clock cycles
	output reg [N-1:0] count,
	output reg overflow
	);

	//signal declarations 

	initial begin
		count = 0;
		overflow = 0;
	end

	always @(posedge(clk)) begin
		if(reset) begin
			count = 0;
		end
	end
	
	always @(posedge(count_increment_clk)) begin
		if(count == OVERFLOW_VALUE) begin
			count = 0;
			overflow = 1;
		end
		else begin
			overflow = 0;
			count = count + 1;
		end
		
	end

endmodule











