`include "uart_rx_core.v"
`include "baudrate_tick_generator.v"
`include "seven_segment_display_core.v"

module uart_rx_seven_segment_display(
	input wire CLK,
	input wire RX,
	output wire [7:0] DISPLAY_BITS,
	output wire [2:0] LED_CONTROL_SIGNAL_REGISTER
	);

	wire BAUDRATE_TICK;

	baudrate_tick_generator #(.baudrate(32'd115200))
		t(
			.clk(CLK),
			.tick(BAUDRATE_TICK)
		);

	reg RESET = 1'b0;
	wire RX_DONE_TICK;
	wire [7:0] SERIAL_DATA;

	uart_rx_core r(
		.clk(CLK),
		.sample_tick(BAUDRATE_TICK),
		.rx(RX),
		.rx_done_tick(RX_DONE_TICK),
		.d_out(SERIAL_DATA),
		.reset(RESET)
		);

	reg [3:0] LED1_DISPLAY_VALUE = 1,LED2_DISPLAY_VALUE = 2,LED3_DISPLAY_VALUE = 3;

	seven_segment_display_core s(
		.clk(CLK),
		.display_bits(DISPLAY_BITS),
		.led1_control_signal(LED_CONTROL_SIGNAL_REGISTER[0]),
		.led2_control_signal(LED_CONTROL_SIGNAL_REGISTER[1]),
		.led3_control_signal(LED_CONTROL_SIGNAL_REGISTER[2]),
		.led1_display_value(LED1_DISPLAY_VALUE),
		.led2_display_value(LED2_DISPLAY_VALUE),
		.led3_display_value(LED3_DISPLAY_VALUE)
	);

	initial begin
		LED2_DISPLAY_VALUE = 3;
		LED3_DISPLAY_VALUE = 5;
	end

	always @(posedge(RX_DONE_TICK)) begin
		LED1_DISPLAY_VALUE = {3'b0,SERIAL_DATA[0]};
	end

endmodule