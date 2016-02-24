`include "seven_segment_display_controller.v"
`include "binary_to_12bit_bcd_converter_mark2.v"
`include "pulse_generator.v"

module integer_seven_segment_display_controller(
	input wire CLK,
	output wire [7:0] DISPLAY_BITS,
	output wire LED1_CONTROL_SIGNAL,
	output wire LED2_CONTROL_SIGNAL,
	output wire LED3_CONTROL_SIGNAL,
	output wire LED_CHANGE_TICK,
	input wire [7:0] LED_DISPLAY_VALUE,
	input wire GENERATE_START_PULSE
//	output reg CONVERTER_RESET,
//	output wire START_CONVERSION,
//	output wire CONVERSION_COMPLETE
	);


	wire [11:0] BCD_DATA;
	reg CONVERTER_RESET;
//	wire START_CONVERSION;
//	wire CONVERSION_COMPLETE;

	binary_to_12bit_bcd_converter #(.BINARY_DATA_SIZE(4'd8))
		b(
			.clk(CLK),
			.binary_data(LED_DISPLAY_VALUE),
			.start_conversion(START_CONVERSION),
			.reset(CONVERTER_RESET),
			.bcd_data(BCD_DATA)
//			.conversion_complete(CONVERSION_COMPLETE)
		);

	seven_segment_display_controller s(
			.clk(CLK),
			.display_bits(DISPLAY_BITS),
			.led1_control_signal(LED1_CONTROL_SIGNAL),
			.led2_control_signal(LED2_CONTROL_SIGNAL),
			.led3_control_signal(LED3_CONTROL_SIGNAL),
			.led_change_tick(LED_CHANGE_TICK),
			.led1_display_value(BCD_DATA[11:8]),
			.led2_display_value(BCD_DATA[7:4]),
			.led3_display_value(BCD_DATA[3:0])
		);

//	reg GENERATE_START_PULSE;
//	initial GENERATE_START_PULSE = 1'b0;
	
	pulse_generator #(.PULSE_WIDTH(32'd1)) 
		p(
			.clk(CLK),
			.generate_pulse(GENERATE_START_PULSE),
			.pulse(START_CONVERSION)
		);

	reg reset_state;
	initial reset_state = 1'b0;

	always @(posedge(CLK)) begin
		if(reset_state == 0) begin
			CONVERTER_RESET = 1'b1;
			reset_state = 1'b1;
		end else begin
			CONVERTER_RESET = 1'b0;
		end
	end

//	always @(LED_DISPLAY_VALUE) begin
//		GENERATE_START_PULSE = ~ GENERATE_START_PULSE;
//	end

endmodule

module stimulus(
	input wire CLK,
	output wire [7:0] DISPLAY_BITS,
	output wire LED1_CONTROL_SIGNAL,
	output wire LED2_CONTROL_SIGNAL,
	output wire LED3_CONTROL_SIGNAL,
	output wire LED_CHANGE_TICK,
	output wire TICK,
	output reg GENERATE_START_PULSE,
	output reg [7:0] LED_DISPLAY_VALUE
	);
	
//	reg GENERATE_START_PULSE;
	initial GENERATE_START_PULSE = 1'b0;
	
//	reg [7:0] LED_DISPLAY_VALUE;
	initial LED_DISPLAY_VALUE = 1'b0000000;
	wire CONVERTER_RESET;
//	wire START_CONVERSION, CONVERSION_COMPLETE;
	
	integer_seven_segment_display_controller
		c(
			.CLK(CLK),
			.DISPLAY_BITS(DISPLAY_BITS),
			.LED1_CONTROL_SIGNAL(LED1_CONTROL_SIGNAL),
			.LED2_CONTROL_SIGNAL(LED2_CONTROL_SIGNAL),
			.LED3_CONTROL_SIGNAL(LED3_CONTROL_SIGNAL),
			.LED_CHANGE_TICK(LED_CHANGE_TICK),
			.LED_DISPLAY_VALUE(LED_DISPLAY_VALUE),
			.GENERATE_START_PULSE(GENERATE_START_PULSE)
//			.CONVERTER_RESET(CONVERTER_RESET)
//			.START_CONVERSION(START_CONVERSION),
//			.CONVERSION_COMPLETE(CONVERSION_COMPLETE)
		);

	tick_generator #(.tick_time(32'd1000),.frequency(32'd100000))
	t(
		.clk(CLK),
		.tick(TICK)
	);
	
	always @(posedge(TICK)) begin
		LED_DISPLAY_VALUE = LED_DISPLAY_VALUE + 1;
		GENERATE_START_PULSE = ~ GENERATE_START_PULSE;
	end
	
	
endmodule

//module stimulus();
//
//	reg clk = 1'b0;
//	reg [7:0] display_integer = 8'b00000000;
//	wire [7:0] display_bits;
//	wire led1_control_signal, led2_control_signal, led3_control_signal;
//	wire led_change_tick;
//	wire debug_converter_reset;
//	wire start_conversion;
//	wire conversion_complete;
//
//	integer_seven_segment_display_controller s(
//		.CLK(clk),
//		.DISPLAY_BITS(display_bits),
//		.LED1_CONTROL_SIGNAL(led1_control_signal),
//		.LED2_CONTROL_SIGNAL(led2_control_signal),
//		.LED3_CONTROL_SIGNAL(led3_control_signal),
//		.LED_CHANGE_TICK(led_change_tick),
//		.LED_DISPLAY_VALUE(display_integer),
//		.CONVERTER_RESET(debug_converter_reset),
//		.START_CONVERSION(start_conversion),
//		.CONVERSION_COMPLETE(conversion_complete)
//	);
//
//	initial begin
//		$dumpfile("simulation.vcd");
//		$dumpvars(0,
//			clk,
//			display_bits,
//			led1_control_signal,
//			led2_control_signal,
//			led3_control_signal,
//			led_change_tick,
//			display_integer,
//			debug_converter_reset,
//			start_conversion,
//			conversion_complete
//		);
//	end
//
//	always begin
//		#1 clk = ~ clk;
//	end
//
//	initial begin
//		#10 display_integer = 8'b11111111;
//		#200 display_integer = 8'b00001111;
//	end
//
//	initial begin
//		#1000 $finish;
//	end
//
//endmodule