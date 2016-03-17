module uart_rx_core #(
	parameter NUMBER_OF_DATA_BITS = 8,
	parameter NUMBER_OF_STOP_BIT_TICKS = 16
	)(
	input wire clk, 
	input wire sample_tick,
	input wire rx,
	output reg rx_done_tick,
	output wire [NUMBER_OF_DATA_BITS-1:0] d_out,
	input wire reset
	);

	// state declaration
	localparam [1:0]
		idle = 2'b00,
		start = 2'b01,
		data = 2'b10,
		stop = 2'b11;

	// signal declarations 
	reg [1:0] state_reg = idle,state_next = idle;
	reg [3:0] s_reg,s_next;				// number of sampling ticks encountered
	reg [2:0] n_reg,n_next;				// number of data bits received
	reg [7:0] b_reg = 8'b0, b_next;    	// register for storing data assigned to d_out

	assign d_out = b_reg;

	// FSMD state snd registere
	always @ (posedge(clk) , posedge(reset))
		if (reset) begin
			state_reg <= idle;
			s_reg <= 0;
			n_reg <= 0;
			b_reg <= 0;
		end
		
		else begin
			state_reg <= state_next;
			s_reg <= s_next;
			n_reg <= n_next;
			b_reg <= b_next;
		end

	always @* begin
		state_next = state_reg;
		rx_done_tick = 1'b0;
		s_next = s_reg;
		n_next = n_reg;
		b_next = b_reg;

		case (state_reg)
			idle :
				if (~rx) begin
					state_next = start;
					s_next = 0;
				end
			start :
				if (sample_tick)
					if (s_reg == 7)begin
						state_next = data;
						s_next = 0;
						n_next = 0;
					end

					else 
						s_next = s_reg + 1;
			data :
				if (sample_tick)
					if (s_reg == 15) begin
						s_next = 0;
						b_next = {rx, b_reg[NUMBER_OF_DATA_BITS - 1:1]};
						if (n_reg == (NUMBER_OF_DATA_BITS - 1))
							state_next = stop;
						else
							n_next = n_reg + 1;
					end

					else begin
						s_next = s_reg + 1;
					end

			stop :
				if (sample_tick)
					if (s_reg == (NUMBER_OF_STOP_BIT_TICKS - 1)) begin
						state_next = idle;
						rx_done_tick = 1'b1;
					end

					else 
						s_next = s_reg + 1;
		endcase

	end

endmodule

