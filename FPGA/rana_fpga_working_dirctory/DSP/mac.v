
module mac
	#(parameter NO_OF_BITS = 16    )

    (
    	input wire clk,
    	input wire reset,
    	
    	input wire [NO_OF_BITS - 1: 0] a,
    	input wire a_valid,

    	input wire [NO_OF_BITS-1 : 0] b,
    	input wire b_valid,
  		
  		input wire [NO_OF_BITS-1 : 0] c,
  		input wire c_valid,
		
		input wire [NO_OF_BITS-1 : 0] d,
		input wire d_valid,

    	output wire [(2*NO_OF_BITS)-1 : 0]out,
    	output wire out_ready
    	);

	wire transfer = a_valid & b_valid & c_valid & d_valid;

	reg [NO_OF_BITS-1 : 0] a_reg_0;
	reg [NO_OF_BITS-1 : 0] a_reg_1;

	reg [NO_OF_BITS-1 : 0] b_reg_0 ;
	reg [NO_OF_BITS-1 : 0] b_reg_1;

	reg [NO_OF_BITS-1 : 0] c_reg_0;
	reg [NO_OF_BITS-1 : 0] d_reg_0;
	reg [(2*NO_OF_BITS)-1 : 0] m_reg_0;
	reg [(2*NO_OF_BITS)-1 : 0] p_reg_0;

	assign out = p_reg_0;
//	assign out = m_reg_0;
//	assign out = b_reg_1;
	initial begin
		a_reg_0 = 0;
		a_reg_1 = 0;
		b_reg_0 = 0;
		b_reg_1 = 0;
		c_reg_0 = 0;
		d_reg_0 = 0;
		m_reg_0 = 0;
		p_reg_0 = 0;
	end

	always @(posedge (clk)) begin 
		if(reset) begin
			a_reg_0 <= 0;
			a_reg_1 <= 0;

			b_reg_0 <= 0;
			b_reg_1 <= 0;

			c_reg_0 <= 0;
			d_reg_0 <= 0;
			m_reg_0 <= 0;
			p_reg_0 <= 0;
		end
		else begin
			if (transfer) begin
				// 1st cycle
				a_reg_0 <= a;
				b_reg_0 <= b;
				c_reg_0 <= c;
//				c_reg_0 <= p_reg_0;
				d_reg_0 <= d;
				// 2nd cycle
				a_reg_1 <= a_reg_0;
				p_reg_0 <= (a_reg_1 * (d_reg_0 + b_reg_0)) + c_reg_0;

			end
		end
	end

endmodule
