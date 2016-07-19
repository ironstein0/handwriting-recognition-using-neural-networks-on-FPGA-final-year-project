// Company: Rana and Co.
// Engineer: Kishore Saldanha

module sigmoid_ROM(
    input clk,
    input [2:0] addr,
    output reg [17:0]  dout1,
    output reg [17:0]  dout2
    );

	//BEWARE clock enabled memory causes uncertain behaviour at the output
	//reg [17:0] local_addr;
	// always@(posedge clk)
	// 	local_addr=addr;
	
	always @* begin
		case(addr)
		4'h0: begin 
				dout1<=18'b0_0000_0100000000000;//+0.25
				dout2<=18'b0_0000_1000000000000;//+0.5
				ready<=1;
				end
		4'h1: begin 
				dout1<=18'b0_0000_0010000010101;//+0.12756
				dout2<=18'b0_0000_1001100101011;//+0.5987
				ready<=1;
				end
		4'h2: begin 
				dout1<=18'b0_0000_0000100010111;//+0.0340
				dout2<=18'b0_0000_1101100001100;//+0.8453
				ready<=1;
				end
		4'h3: begin 
				dout1<=18'b0_0000_0000000101000;//+0.005
				dout2<=18'b0_0000_1111011001101;//+0.9626
				ready<=1;
				end
		4'h4: begin 
				dout1<=18'b0_0000_0000000000000;//+0.000
				dout2<=18'b0_0001_0000000000000;//+1.000
				ready<=1;
				end

		default:begin
				ready<=0;
				dout1<=18'bz_zzzz_zzzzzzzzzzzzz;
				dout2<=18'bz_zzzz_zzzzzzzzzzzzz;
				end
		endcase
	end

endmodule
