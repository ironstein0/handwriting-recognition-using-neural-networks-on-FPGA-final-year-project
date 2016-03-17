/*
testing codes for uart receiver with the 
integer seven segment display core, 
that displays the integer value for every 
character received by the uart receiver
*/

`include "uart_rx_core/uart_rx_core.v"
`include "reset_controller/reset_controller.v"
`include "integer_seven_segment_display_controller/integer_seven_segment_display_controller.v"

module uart_receiver_ssd(
	// control signals
	input wire clk,
	input wire reset_switch,
	output wire reset,
	// seven segment display related signals
	output wire led1_control_signal,
	output wire led2_control_signal,
	output wire led3_control_signal,
	output wire led_change_tick,
	output wire [7:0] display_bits,
	// uart receiver related signals
	input wire rx
	);

	// module instantiations

	reset_controller r(
		.clk(clk),
		.switch_input(reset_switch),
		.reset(reset)
	);

	wire [7:0] rx_data;
	wire rx_done_tick;

	uart_rx_core #(.NUMBER_OF_DATA_BITS(8),.NUMBER_OF_STOP_BIT_TICKS(16))
		rx1(
			.clk(clk),
			.reset(reset),
			.rx(rx),
			.data_out(rx_data),
			.rx_done_tick(rx_done_tick)
		);

	integer_seven_segment_display_controller ssd1(
		.clk(clk),
		.reset(reset),
		.integer_to_be_displayed(rx_data),
		.led1_control_signal(led1_control_signal),
		.led2_control_signal(led2_control_signal),
		.led3_control_signal(led3_control_signal),
		.led_change_tick(led_change_tick),
		.display_bits(display_bits)
	);

endmodule

//module stimulus();
//	reg CLK,RESET_SWITCH;
//	wire RESET;
//	wire LED1_CONTROL_SIGNAL,LED2_CONTROL_SIGNAL,LED3_CONTROL_SIGNAL;
//	wire LED_CHANGE_TICK;
//	wire [7:0] DISPLAY_BITS;
//	reg RX;
//
//	uart_receiver_ssd ussd(
//		.clk(CLK),
//		.reset_switch(RESET_SWITCH),
//		.reset(RESET),
//		.led1_control_signal(LED1_CONTROL_SIGNAL),
//		.led2_control_signal(LED2_CONTROL_SIGNAL),
//		.led3_control_signal(LED3_CONTROL_SIGNAL),
//		.led_change_tick(LED_CHANGE_TICK),
//		.display_bits(DISPLAY_BITS),
//		.rx(RX)
//	);
//
//	initial begin
//		$dumpfile("simulation.vcd");
//		$dumpvars(0,
//			CLK,
//			RESET_SWITCH,
//			RESET,
//			LED1_CONTROL_SIGNAL,
//			LED2_CONTROL_SIGNAL,
//			LED3_CONTROL_SIGNAL,
//			LED_CHANGE_TICK,
//			DISPLAY_BITS,
//			RX
//		);
//	end
//
//	initial begin
//		CLK = 1'b0;
//		RESET_SWITCH = 1'b1;
//		RX = 1'b1;
//	end
//
//	always begin
//		#1 CLK = ~ CLK;
//	end
//
//	initial begin
//		#100 RESET_SWITCH = 1'b0;
//		#100 RESET_SWITCH = 1'b1;
//		#100 RX = 1'b0;
//		#5000 RX = 1'b1;
//	end
//
//	initial begin
//		#10000 $finish;
//	end
//
//endmodule

module stimulus(
	input wire CLK,
	input wire RESET_SWITCH,
	output wire RESET,
	output wire LED1_CONTROL_SIGNAL,
	output wire LED2_CONTROL_SIGNAL,
	output wire LED3_CONTROL_SIGNAL,
	output wire LED_CHANGE_TICK,
	output wire [7:0] DISPLAY_BITS,
	input wire RX
	);

	uart_receiver_ssd ussd(
		.clk(CLK),
		.reset_switch(RESET_SWITCH),
		.reset(RESET),
		.led1_control_signal(LED1_CONTROL_SIGNAL),
		.led2_control_signal(LED2_CONTROL_SIGNAL),
		.led3_control_signal(LED3_CONTROL_SIGNAL),
		.led_change_tick(LED_CHANGE_TICK),
		.display_bits(DISPLAY_BITS),
		.rx(RX)
	);
endmodule
