`timescale 1ns / 1ps

module shift_reg
	#(
		parameter N =8 
		)
	(
		input wire clk, reset,
		input wire [1:0] ctrl,
		input wire [N-1:0]d,
		input wire SI,
		output wire out,
		output wire [N-1:0]q
	
	);

	/// signal decleration
	reg [N-1:0] r_reg, r_next;
	reg a;
	assign out = a;

	// operational flow
	always @(posedge (clk)) begin
		if (reset) begin
			r_reg <= 0;
		end else if (ctrl == 2'b00) begin
			r_reg <= r_next;
		end else if (ctrl == 2'b01) begin
			r_reg <= r_next;
			a <= r_reg[N-1];
		end else if (ctrl == 2'b10) begin
			r_reg <= r_next;
			a <= r_reg[0];
		end else begin
			r_reg <= r_next;
		end
	end
		
	// next-state logic
	always @* 
		case (ctrl)
			2'b00: 
				// no shift
				r_next = r_reg;                       
			2'b01: 
				// shift-left
				r_next = {r_reg[N-2:0], SI};        
			2'b10: 
				// shift-right
				r_next = {SI, r_reg[N-1:1]}; 
			default: 
				// load
				r_next = d;                         
		endcase

	assign q = r_reg;
	
endmodule
	
module stimulus();

	reg CLK, RESET;
	reg [1:0] CTRL;
	reg [7:0] D;
	wire [7:0] Q;
	reg SI;
	wire OUT;
	
	shift_reg R(
		.clk(CLK),
		.reset(RESET),
		.ctrl(CTRL),
		.d(D),
		.SI(SI),
		.out(OUT),
		.q(Q)
	);
	
	initial 
		$dumpvars (CLK, RESET, CTRL, D, Q, OUT);
		
	initial begin
		CLK = 1'b0; 
		CTRL = 2'b00;
		D = 8'b11110101;
		RESET = 1'b0;
		SI = 1'b0;
		
	end
	
	always 
		#1 CLK = ~CLK;
		
	initial begin 
		#40 CTRL = 2'b11;
		#50 CTRL = 2'b01;
		#100 RESET = 1'b1;
		
		#2000 $finish;
	end
	
endmodule
