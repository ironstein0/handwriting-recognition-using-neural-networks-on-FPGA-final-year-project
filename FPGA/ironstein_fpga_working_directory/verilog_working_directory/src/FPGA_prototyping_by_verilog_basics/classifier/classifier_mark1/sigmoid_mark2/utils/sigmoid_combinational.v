// Company: Rana & Co.
// Engineer: K. Saldanha

`include "sigmoid_ROM.v"

module sigmoid_combinational(
    input wire [17:0] x1,
    output reg signed [15:0] fixed_op,
	// output reg [2:0] test
    );

	wire [17:0]  dout1,dout2;
	reg [17:0] n1,n2,n3,n4,n5;
	reg [2:0] addr;
	reg pos,sign;
	reg signed [47:0] temp1;
	reg [17:0] x_abs;
	reg signed [47:0] temp2;

	//Instantiate the ROM 
	sigmoid_ROM my_rom(
		.clk(clk),
		.addr(addr),
		.dout1(dout1),
		.dout2(dout2)	
	);

	// Input Range Mapping
	always @* begin
		//sign_magnitude_precision format
		x_abs={1'b0,x1[16:0]}; 
		n1=18'b0_0000_1100010110111;   	//binary shit represents +0.7724
		n2=18'b0_0010_1010010100011;   	//binary shit represents +2.645
		n3=18'b0_0100_0000000000000;   	//binary shit represents +4
		n4=18'b0_1000_0000000000000;	//binary shit represents +8.0
		//check sign of input x1
		if(x1[17]==0) begin
			pos=1;//x1 is positive
		end else begin
			pos=0;
		end
			
		// Region 0 : 0 <= |x| <n1
		if(x_abs[16:0]< n1[16:0]) begin
			// test=3'b000;
			addr=3'b000;
		end

		// Region 1 : n1 <= |x| < n2
		else if((x_abs[16:0]>=n1[16:0]) && (x_abs[16:0]<n2[16:0])) begin
			// test=3'b001;
			addr=3'b001;
		end
			
		// Region 2 : n2 <= |x| < n3
		else if((x_abs[16:0]>=n2[16:0]) && (x_abs[16:0]<n3[16:0])) begin
			// test=3'b010;
			addr=3'b010;
		end
		
		// Region 3 : n3 <= |x| < n4
		else if((x_abs[16:0]>=n3[16:0]) && (x_abs[16:0]<n4[16:0])) begin
			// test=3'b011;
			addr=3'b011;
		end 
					
		/* Region 4:|x| >= n4  */
		else if(x_abs[16:0]>=n4[16:0]) begin
			// test=3'b100;
			addr=3'b100;
		end
			
		else begin
			// test=3'b101;
			addr=3'bzzz;
		end
		
		// inferred MAC unit processing
		temp1=(x_abs*dout1)>>13;//convert back to original fixed point format
		temp2=(temp1+dout2);	
				
		//detect overflow, and limit output to 1.0 (2**13)
		if(temp2 >8192) begin
			temp2=8192;
		end
		
		// symmetric sigmoid implementation			
		if(pos==1) begin
			fixed_op=temp2;
		end else begin
			fixed_op=18'b0_0001_00000000000-temp2[17:2];
		end	

	end 

endmodule
