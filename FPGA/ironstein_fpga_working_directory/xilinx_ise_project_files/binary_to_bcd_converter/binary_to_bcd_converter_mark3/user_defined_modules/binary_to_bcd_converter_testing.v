module binary_to_bcd_converter(
	// signals
	input wire clk,
	input wire reset,
	input wire start_conversion,
	output reg end_of_conversion,
	// data
	input wire [7:0] binary_data,
	output reg [11:0] bcd_data,
	// test
	output wire state_reg_test,
	output wire state_next_test,
	output wire [11:0] bcd_data_next_test,
	output wire [19:0] shift_reg_test,
	output wire [19:0] shift_reg_next_test,
	output wire [3:0] count_test,
	output wire [3:0] count_next_test,
	output wire end_of_conversion_next_test
	);

	// state declarations 
	localparam 
		idle = 1'b0,
		converting = 1'b1;

	// signal declarations
	reg state_reg, state_next;
	reg [11:0] bcd_data_next;
	reg [19:0] shift_reg,shift_reg_next;
	reg [3:0] count,count_next;
	reg end_of_conversion_next;

	// test assignments
	assign state_reg_test = state_reg;
	assign state_next_test = state_next;
	assign bcd_data_next_test = bcd_data_next;
	assign shift_reg_test = shift_reg;
	assign shift_reg_next_test = shift_reg_next;
	assign count_test = count;
	assign count_next_test = count_next;
	assign end_of_conversion_next_test = end_of_conversion;

	// state_updation_logic
	always @(posedge(clk),posedge(reset)) begin
		if(reset) begin
			state_reg = idle;
			bcd_data = 12'b0;
			shift_reg = 20'b0;
			count = 4'b0;
			end_of_conversion = 1'b0;
		end else begin
			// the last activity should be the 
			// synchronous activity
			state_reg = state_next;
			bcd_data = bcd_data_next;
			shift_reg = shift_reg_next;
			count = count_next;
			end_of_conversion = end_of_conversion_next;
		end
	end

	always @* begin

		// in idle state
		if(state_reg == idle) begin
			// moore signals
			count_next <= 4'b0;
			bcd_data_next <= bcd_data;
			end_of_conversion_next <= 1'b0;
			
			// mealey signals
			if(start_conversion) begin
				shift_reg_next <= {12'b0,binary_data};
				state_next <= converting;
			end else begin
				shift_reg_next <= 20'b0;
				state_next <= idle;
			end

		// in converting state
		end else if(state_reg == converting) begin
			if(count == 7) begin
				shift_reg_next <= 20'b0;
				count_next <= 4'b0;
				bcd_data_next <= shift_reg[19:8];
				state_next <= idle;
				end_of_conversion_next = 1'b1;
			end else begin
				count_next <= count + 1;
				bcd_data_next <= bcd_data;
				state_next <= converting;
				end_of_conversion_next <= 1'b0;

				// updating shift_reg_next
				if(shift_reg_next[11:8] > 4'd4) begin
					shift_reg_next += 20'b0000_0000_0011_00000000;
				end
				if(shift_reg_next[15:12] > 4'd4) begin
					shift_reg_next += 20'b0000_0011_0000_00000000;
				end
				if(shift_reg_next[19:16] > 4'd4) begin
					shift_reg_next += 20'b0011_0000_0000_00000000;
				end
				shift_reg_next = {shift_reg_next[18:0],1'b0};	// left shift by one bit
			end
		end
	end

endmodule

module stimulus();

	reg CLK,RESET,START_CONVERSION;
	reg [7:0] BINARY_DATA;
	wire [11:0] BCD_DATA;
	wire END_OF_CONVERSION;

	wire STATE_REG_TEST;
	wire STATE_NEXT_TEST;
	wire [11:0] BCD_DATA_NEXT_TEST;
	wire [19:0] SHIFT_REG_TEST;
	wire [19:0] SHIFT_REG_NEXT_TEST;
	wire [3:0] COUNT_TEST;
	wire [3:0] COUNT_NEXT_TEST;
	wire END_OF_CONVERSION_NEXT_TEST;

	binary_to_bcd_converter b(
		.clk                        (CLK),
		.reset                      (RESET),
		.start_conversion           (START_CONVERSION),
		.binary_data                (BINARY_DATA),
		.bcd_data                   (BCD_DATA),
		.end_of_conversion          (END_OF_CONVERSION),
		.state_reg_test             (STATE_REG_TEST),
		.state_next_test            (STATE_NEXT_TEST),
		.bcd_data_next_test         (BCD_DATA_NEXT_TEST),
		.shift_reg_test             (SHIFT_REG_TEST),
		.shift_reg_next_test        (SHIFT_REG_NEXT_TEST),
		.count_test                 (COUNT_TEST),
		.count_next_test            (COUNT_NEXT_TEST),
		.end_of_conversion_next_test(END_OF_CONVERSION_NEXT_TEST)
	);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			CLK,
			RESET,
			START_CONVERSION,
			BINARY_DATA,
			BCD_DATA,
			END_OF_CONVERSION,
			STATE_REG_TEST,
			STATE_NEXT_TEST,
			BCD_DATA_NEXT_TEST,
			SHIFT_REG_TEST,
			SHIFT_REG_NEXT_TEST,
			COUNT_TEST,
			COUNT_NEXT_TEST,
			END_OF_CONVERSION_NEXT_TEST
		);
	end

	initial begin
		CLK = 1'b0;
		RESET = 1'b0;
		START_CONVERSION = 1'b0;
		BINARY_DATA = 8'b00001111;
	end

	// RESET testing
	// initial begin
	// 	#10 RESET = 1'b1;
	// 	#10 RESET = 1'b0;
	// 	#10 START_CONVERSION = 1'b1;
	// 	#5 START_CONVERSION = 1'b0;
	// 	#2 RESET = 1'b1;
	// 	#2 START_CONVERSION = 1'b1;
	// 	#4 RESET = 1'b0;
	// 	#2 START_CONVERSION = 1'b0;
	// 	#20 RESET = 1'b1;
	// 	#2 RESET = 1'b0;
	// end

	// FUNCTIONAL testing
	reg [7:0] i;
	initial begin
		#10 RESET = 1'b1;
		#10 RESET = 1'b0;
		for(i=0;i<256;i = i+1) begin
			#40 BINARY_DATA = i;
			#2 START_CONVERSION = 1'b1;
			#2 START_CONVERSION = 1'b0;
		end
	end

	always begin
		#1 CLK = ~ CLK;
	end

	initial begin
		#30000 $finish;
	end
endmodule