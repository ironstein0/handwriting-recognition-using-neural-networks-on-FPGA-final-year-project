`include "utils/ring_shift_register.v"
`include "utils/tick_generator.v"
`include "utils/seven_segment_display.v"

module seven_segment_display_core(
	// signals
	input wire clk,
	input wire reset,
	output wire led1_control_signal,
	output wire led2_control_signal,
	output wire led3_control_signal,
	output wire led_change_tick,
	// data
	output wire [7:0] display_bits,
	input wire [3:0] led1_display_value,
	input wire [3:0] led2_display_value,
	input wire [3:0] led3_display_value
	);
	
	// ---------- tick generator --------------
	 tick_generator #(.tick_time(32'd1),.frequency(32'd100000))
//	tick_generator #(.tick_time(32'd10),.frequency(32'd1)) 
		led_change_tick_generator(
			.clk(clk),
			.reset(reset),
			.tick(led_change_tick)
		);
	
	// -------- ring shift register ----------
	ring_shift_register #(.N(3),.INITIAL_VALUE(3)) 
		sr1(
			.clk(led_change_tick),
			.reset(reset),
			.parallel_out({led1_control_signal,led2_control_signal,led3_control_signal})
		);

	// ------- seven segment display ---------
	wire [3:0] led_value_register [2:0];
	
	assign led_value_register[0] = led1_display_value;
	assign led_value_register[1] = led2_display_value;	
	assign led_value_register[2] = led3_display_value;

	wire [3:0] led_value;
	reg [1:0] led_value_register_index = 0;
	assign led_value = led_value_register[led_value_register_index];

	seven_segment_display 
		s(
			.digit_to_be_displayed(led_value),
			.dp(1'b1),
			.reset(reset),
			.led(display_bits)
		);

	always @(posedge(led_change_tick)) begin
		led_value_register_index = led_value_register_index + 1;
		if(led_value_register_index == 3) begin 
			led_value_register_index = 0;
		end
	end

endmodule

//module stimulus(
//	wire CLK,
//	wire [2:0] LED_CONTROL_SIGNAL_REGISTER,
//	wire LED_CHANGE_TICK,
//	wire [7:0] DISPLAY_BITS
//	);
//	
//	reg [3:0] LED1 = 4'd1;
//	reg [3:0] LED2 = 4'd2;
//	reg [3:0] LED3 = 4'd3;
//
//	seven_segment_display_controller
//		s(
//			.clk(CLK),
//			.display_bits(DISPLAY_BITS),
//			.led1_control_signal(LED_CONTROL_SIGNAL_REGISTER[0]),
//			.led2_control_signal(LED_CONTROL_SIGNAL_REGISTER[1]),
//			.led3_control_signal(LED_CONTROL_SIGNAL_REGISTER[2]),
//			.led_change_tick(LED_CHANGE_TICK),
//			.led1_display_value(LED1),
//			.led2_display_value(LED2),
//			.led3_display_value(LED3)
//		);
//
//endmodule

// module stimulus();
// 	reg clk,reset;
// 	wire [2:0] led_control_signal_register;
// 	wire led_change_tick;
// 	wire [7:0] display_bits;

// 	reg [3:0] led1 = 4'd3;
// 	reg [3:0] led2 = 4'd4;
// 	reg [3:0] led3 = 4'd8;

// 	seven_segment_display_core
// 		s(
// 			.clk(clk),
// 			.reset(reset),
// 			.display_bits(display_bits),
// 			.led1_control_signal(led_control_signal_register[0]),
// 			.led2_control_signal(led_control_signal_register[1]),
// 			.led3_control_signal(led_control_signal_register[2]),
// 			.led_change_tick(led_change_tick),
// 			.led1_display_value(led1),
// 			.led2_display_value(led2),
// 			.led3_display_value(led3)
// 		);

// 	initial begin
// 		$dumpfile("simulation.vcd");
// 		$dumpvars(0,
// 			clk,
// 			led_control_signal_register,
// 			led_change_tick,
// 			display_bits,
// 			reset);
// 	end

// 	initial begin
// 		clk = 1'b0;
// 		reset = 1'b0;
// 	end

// 	always 
//		#1 clk = ~ clk;
//
//	initial begin
//		#100 reset = 1'b1;
//		#30 reset = 1'b0;
//	end
//
//	initial 
//		#200 $finish;
//
//endmodule