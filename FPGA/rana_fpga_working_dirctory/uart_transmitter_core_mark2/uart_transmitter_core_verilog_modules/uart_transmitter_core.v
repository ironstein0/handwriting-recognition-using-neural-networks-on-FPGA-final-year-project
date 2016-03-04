module uart_transmitter_core
 #(
 	parameter N = 8,
 	parameter NUMBER_OF_STOP_BITS = 1
  )
  ( 
  	input wire clk,shift_clk,
  	input wire start,
  	input wire [N-1:0] d,
  	output wire bit_out,
  	output reg finish
 	);

	// state declarations
	 localparam 
		idle = 1'b0,
		shift_out = 1'b1;

	//signal declarations
	 reg state = idle, state_next = idle;
	 reg bit_out_register = 1'b1;
	 reg [3:0] count = 0;
	 reg SI = 1'b0;
	 reg [N+NUMBER_OF_STOP_BITS:0] r_reg = 0, r_next = 0;
	 assign bit_out = bit_out_register ;

	 // state updation
	 always @(posedge (clk)) begin
		state <= state_next;
	  end 

	// next state logic
	
	always @(posedge(start),posedge(shift_clk)) begin
	
		if(start) begin
			if(state == idle) begin
				count <= 0;
				r_reg <= {1'b0,d,1'b0}; 	// change for universal implementation
				state_next <= shift_out;
			end
			finish <= 1'b0;
		
		end else if (shift_clk) begin
			if(state == shift_out) begin
				if(count == N + NUMBER_OF_STOP_BITS + 1) begin
					finish <= 1'b1;
					count <= 0;
					bit_out_register <= 1'b1;
					state_next <= idle;
				end else begin
					count <= count + 1;
					r_reg <= {SI, r_reg[N+NUMBER_OF_STOP_BITS:1]};
					// r_reg <= r_next;	// check after load
					bit_out_register <= r_reg[0];
				end
			end
		end
	end

endmodule


