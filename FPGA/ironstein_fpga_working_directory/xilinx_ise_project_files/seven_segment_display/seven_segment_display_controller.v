`include "tick_generator.v"
`include "ring_shift_register.v"
`include "seven_segment_display.v"

module seven_segment_display_controller(
	input wire CLK,
	output wire [7:0] DISPLAY_BITS,
	output wire LED1,
	output wire LED2,
	output wire LED3,
	output wire LED_CHANGE_TICK,
	output wire VALUE_CHANGE_TICK
	);
	
	// ---------- tick generator --------------
	tick_generator #(.tick_time(32'd1000),.frequency(32'd100000)) 
		led_change_tick(
			.clk(CLK),
			.tick(LED_CHANGE_TICK)
		);
	
	// -------- ring shift register ----------
	ring_shift_register #(.N(3),.INITIAL_VALUE(1)) 
		sr1(
			.clk(LED_CHANGE_TICK),
			.parallel_out({LED1,LED2,LED3})
		);

	// ------- seven segment display ---------
	reg [3:0] led_value_register [2:0];
	
	initial begin
		led_value_register[0] = 1;
		led_value_register[1] = 2;
		led_value_register[2] = 3;
	end

	wire [3:0] led_value;
	reg [2:0] led_value_register_index = 0;
	assign led_value = led_value_register[led_value_register_index];

	seven_segment_display 
		s(
			.digit_to_be_displayed(led_value),
			.dp(1'b0),
			.led(DISPLAY_BITS)
		);

	always @(posedge(LED_CHANGE_TICK)) begin
		led_value_register_index = led_value_register_index + 1;
		if(led_value_register_index == 3) begin 
			led_value_register_index = 0;
		end
	end

endmodule

/*
module stimulus();
	reg clk;
	wire [2:0] led_register;
	wire led_change_tick,value_change_tick;
	wire [7:0] display_bits;

	seven_segment_display_controller
		s(
			.CLK(clk),
			.DISPLAY_BITS(display_bits),
			.LED1(led_register[0]),
			.LED2(led_register[1]),
			.LED3(led_register[2]),
			s.LED_CHANGE_TICK(led_change_tick),
			.VALUE_CHANGE_TICK(value_change_tick)
		);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,clk,led_register,led_change_tick,value_change_tick,display_bits);
	end

	initial
		clk = 1'b0;

	always 
		#1 clk = ~ clk;

	initial 
		#100 $finish;

endmodule
*/