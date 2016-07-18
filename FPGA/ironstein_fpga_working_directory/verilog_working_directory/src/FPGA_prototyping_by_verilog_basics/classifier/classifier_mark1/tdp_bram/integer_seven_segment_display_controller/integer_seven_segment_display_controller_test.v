`include "binary_to_bcd_core/binary_to_bcd_core.v"
`include "seven_segment_display_core/seven_segment_display_core.v"

module integer_seven_segment_display_controller(
	input wire clk,
	input wire reset,
	input wire [7:0] integer_to_be_displayed,
	output wire led1_control_signal,
	output wire led2_control_signal,
	output wire led3_control_signal,
	output wire led_change_tick,
	output wire [7:0] display_bits,
	// test
	output wire [11:0] bcd_data_test,
	output wire binary_to_bcd_start_conversion_test,
	output wire binary_to_bcd_end_of_conversion
	);

	// module instantiations

	reg binary_to_bcd_start_conversion;
//	reg binary_to_bcd_end_of_conversion;
	wire [11:0] bcd_data;
	
	assign bcd_data_test = bcd_data;
	assign binary_to_bcd_start_conversion_test = binary_to_bcd_start_conversion;
	
	initial begin
		binary_to_bcd_start_conversion = 1'b1;
	end

	binary_to_bcd_core b (
		.clk(clk),
		.reset(reset),
		.start_conversion(binary_to_bcd_start_conversion),
		.end_of_conversion(binary_to_bcd_end_of_conversion),
		.binary_data(integer_to_be_displayed),
		.bcd_data(bcd_data)
	);

	seven_segment_display_core s(
		.clk(clk),
		.reset(reset),
		.led1_control_signal(led1_control_signal),
		.led2_control_signal(led2_control_signal),
		.led3_control_signal(led3_control_signal),
		.led_change_tick    (led_change_tick),
		.display_bits       (display_bits),
		.led1_display_value (bcd_data[11:8]),
		.led2_display_value (bcd_data[7:4]),
		.led3_display_value (bcd_data[3:0])
	);

endmodule

//module stimulus();
//	reg CLK,RESET;
//	reg [7:0] INTEGER_TO_BE_DISPLAYED;
//	wire LED1_CONTROL_SIGNAL,LED2_CONTROL_SIGNAL,LED3_CONTROL_SIGNAL;
//	wire LED_CHANGE_TICK;
//	wire [7:0] DISPLAY_BITS;
//	
//	wire BCD_DATA_TEST;
//	wire BINARY_TO_BCD_START_CONVERSION_TEST;
//	wire BINARY_TO_BCD_END_OF_CONVERSION;
//
//	integer_seven_segment_display_controller i(
//		.clk(CLK),
//		.reset(RESET),
//		.integer_to_be_displayed(INTEGER_TO_BE_DISPLAYED),
//		.led1_control_signal    (LED1_CONTROL_SIGNAL),
//		.led2_control_signal    (LED2_CONTROL_SIGNAL),
//		.led3_control_signal    (LED3_CONTROL_SIGNAL),
//		.led_change_tick        (LED_CHANGE_TICK),
//		.display_bits           (DISPLAY_BITS),
//		.bcd_data_test(BCD_DATA_TEST),
//		.binary_to_bcd_start_conversion_test(BINARY_TO_BCD_START_CONVERSION_TEST),
//		.binary_to_bcd_end_of_conversion(BINARY_TO_BCD_END_OF_CONVERSION)
//		);
//
//	initial begin
//		$dumpfile("simulation.vcd");
//		$dumpvars(0,
//			CLK,
//			RESET,
//			INTEGER_TO_BE_DISPLAYED,
//			LED1_CONTROL_SIGNAL,
//			LED2_CONTROL_SIGNAL,
//			LED3_CONTROL_SIGNAL,
//			LED_CHANGE_TICK,
//			DISPLAY_BITS,
//			BCD_DATA_TEST,
//			BINARY_TO_BCD_START_CONVERSION_TEST,
//			BINARY_TO_BCD_END_OF_CONVERSION
//		);
//	end
//
//	initial begin
//		CLK = 1'b0;
//		RESET = 1'b0;
//		INTEGER_TO_BE_DISPLAYED = 8'd255;
//	end
//
//	always begin
//		#1 CLK = ~ CLK;
//	end
//	
//	initial begin
//		#10 RESET = 1'b1;
//		#10 RESET = 1'b0;
//	end
//
//	initial begin
//		#1000 $finish;
//	end
//
//endmodule