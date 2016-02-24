
module binary_to_12bit_bcd_converter #(
		parameter BINARY_DATA_SIZE = 4'd8
	)(
		input wire clk,
		input wire [BINARY_DATA_SIZE - 1:0] binary_data,
		input wire start_conversion,
		output wire [11:0] bcd_data,
		output reg conversion_complete
	);

	// state declarations
	localparam 
		idle = 1'b0,
		converting = 1'b1;

	// signal declarations
	reg [BINARY_DATA_SIZE + 11:0] shift_reg,shift_reg_next;
	reg state_reg = idle, state_next = idle;
	reg [3:0] count = 0, count_next = 0;
	reg [11:0] bcd_data_reg = 0;
	assign bcd_data = bcd_data_reg;

	// state updation logic
	always @(posedge(clk)) begin
		state_reg <= state_next;
		shift_reg <= shift_reg_next;
		count <= count_next;
	end

	// state updation logic
	always @* begin
		case(state_reg) 
			idle :
				if(start_conversion) begin
					shift_reg_next <= {12'b0,binary_data};
					count_next <= 0;
					state_next <= converting;
				end else begin
					conversion_complete = 1'b0;
				end

			converting :
				if(count == BINARY_DATA_SIZE) begin
					conversion_complete <= 1'b1;
					state_next <= idle;
					bcd_data_reg <= shift_reg[BINARY_DATA_SIZE +11: BINARY_DATA_SIZE];
				end else begin
					// updating d2
					if(shift_reg[19:16] > 4'd4) begin
						shift_reg_next[19:16] = shift_reg[19:16] + 4'd3;
					end else begin
						shift_reg_next[19:16] = shift_reg[19:16];
					end

					// updating d1
					if(shift_reg[15:12] > 4'd4) begin
						shift_reg_next[15:12] = shift_reg[15:12] + 4'd3;
					end else begin
						shift_reg_next[15:12] = shift_reg[15:12];
					end

					// updating d0
					if(shift_reg[11:8] > 4'd4) begin
						shift_reg_next[11:8] = shift_reg[11:8] + 4'd3;
					end else begin
						shift_reg_next[11:8] = shift_reg[11:8];
					end

					// left shifting 
					shift_reg_next = {shift_reg_next[BINARY_DATA_SIZE+10:0],1'b0};
					count_next = count + 1;
				end
		endcase

	end

endmodule

module stimulus();
	reg CLK = 1'b0;
	reg [7:0] BINARY_DATA = 8'b11110000;
	reg START_CONVERSION = 1'b0;
	wire CONVERSION_COMPLETE;
	wire [11:0] BCD_DATA;
	reg RESET;
	wire [19:0] SHIFT_REG_DEBUG, SHIFT_REG_NEXT_DEBUG;

	binary_to_12bit_bcd_converter #(.BINARY_DATA_SIZE(4'd8))
		converter(
			.clk(CLK),
			.binary_data(BINARY_DATA),
			.bcd_data(BCD_DATA),
			.start_conversion(START_CONVERSION),
			.conversion_complete(CONVERSION_COMPLETE)
			// .reset(RESET),
			// .shift_reg_debug(SHIFT_REG_DEBUG),
			// .shift_reg_next_debug(SHIFT_REG_NEXT_DEBUG)
		);

	wire [7:0] DISPLAY_BITS;

	// seven_segment_display_controller s(
	// 	.clk(CLK),
	// 	.display_bits(DISPLAY_BITS),
	// 	.led1_display_value(BCD_DATA[11:8]),
	// 	.led2_display_value(BCD_DATA[7:4]),
	// 	.led3_display_value(BCD_DATA[3:0])
	// );

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			CLK,
			BINARY_DATA,
			START_CONVERSION,
			CONVERSION_COMPLETE,
			BCD_DATA,
			DISPLAY_BITS,
			RESET,
			SHIFT_REG_DEBUG,
			SHIFT_REG_NEXT_DEBUG
		);
	end

	always begin
		#1 CLK = ~ CLK;
	end

	initial begin
		#10 RESET = 1'b1;
		#1 RESET = 1'b0;
		#10 START_CONVERSION = 1'b1;
		#1 START_CONVERSION = 1'b0;
		#10 BINARY_DATA = 8'b11111111;
		#200 START_CONVERSION = 1'b1;
		#1 START_CONVERSION = 1'b0;
		#10 BINARY_DATA = 8'b10000001;
		#200 START_CONVERSION = 1'b1;
		#1 START_CONVERSION = 1'b0;
		
	end

	initial begin
		#1000 $finish;
	end
endmodule