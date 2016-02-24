`include "binary_to_12bit_bcd_converter.v"
`include "seven_segment_display_controller.v"
`include "pulse_generator.v"

module integer_seven_segment_display_controller(
	input wire CLK,
	output wire [7:0] DISPLAY_BITS,
	output wire LED1_CONTROL_SIGNAL,
	output wire LED2_CONTROL_SIGNAL,
	output wire LED3_CONTROL_SIGNAL,
	output wire LED_CHANGE_TICK,
	input wire [7:0] DISPLAY_INTEGER
	);
	
	// ------------ module instantiations ----------
	wire [11:0] CONVERTED_DATA;
	wire BCD_START_CONVERSION;
	wire BCD_CONVERSION_COMPLETE;
	binary_to_12bit_bcd_converter #(.BINARY_DATA_SIZE(4'd8))
		c(
			.clk(CLK),
			.binary_data(DISPLAY_INTEGER),
			.bcd_data(CONVERTED_DATA),
			.start_conversion(BCD_START_CONVERSION),
			.conversion_complete(BCD_CONVERSION_COMPLETE)
		);

	seven_segment_display_controller ssdc1(
		.clk(CLK),
		.display_bits(DISPLAY_BITS),
		.led1_control_signal(LED1_CONTROL_SIGNAL),
		.led2_control_signal(LED2_CONTROL_SIGNAL),
		.led3_control_signal(LED3_CONTROL_SIGNAL),
		.led_change_tick(LED_CHANGE_TICK),
		.led1_display_value(CONVERTED_DATA[11:8]),
		.led2_display_value(CONVERTED_DATA[7:4]),
		.led3_display_value(CONVERTED_DATA[3:0])
	);

	reg START_CONVERSION = 1'b0;
	pulse_generator #(.PULSE_WIDTH(32'b1))
		generate_conversion_start_pulse(
			.clk(CLK),
			.generate_pulse(START_CONVERSION),
			.pulse(BCD_START_CONVERSION)
		);

	// ------------ state declarations --------------
	localparam 
		idle = 1'b0,
		converting = 1'b1;

	// signal declarations 
	reg state_reg = idle, state_next = idle;

	// state updation 
	always @(posedge(CLK)) begin
		state_reg <= state_next;
	end

	always @(DISPLAY_INTEGER) begin
		if(state_reg == idle) begin
			START_CONVERSION = ~ START_CONVERSION;
		end
	end

	// next state logic
	always @(posedge(BCD_START_CONVERSION),posedge(BCD_CONVERSION_COMPLETE)) begin
		if(BCD_START_CONVERSION) begin
			state_next = converting;
		end

		if(BCD_CONVERSION_COMPLETE) begin
			state_next = idle;
		end
	end

endmodule

module stimulus();

	reg clk = 1'b0;
	reg [7:0] display_integer = 8'b00000000;
	wire [7:0] display_bits;
	wire led1_control_signal, led2_control_signal, led3_control_signal;
	wire led_change_tick;

	integer_seven_segment_display_controller s(
		.CLK(clk),
		.DISPLAY_BITS(display_bits),
		.LED1_CONTROL_SIGNAL(led1_control_signal),
		.LED2_CONTROL_SIGNAL(led2_control_signal),
		.LED3_CONTROL_SIGNAL(led3_control_signal),
		.LED_CHANGE_TICK(led_change_tick),
		.DISPLAY_INTEGER(display_integer)
	);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			clk,
			display_bits,
			led1_control_signal,
			led2_control_signal,
			led3_control_signal,
			led_change_tick,
			display_integer
		);
	end

	always begin
		#1 clk = ~ clk;
	end

	initial begin
		#10 display_integer = 8'b11111111;
		#200 display_integer = 8'b00001111;
	end

	initial begin
		#1000 $finish;
	end

endmodule

