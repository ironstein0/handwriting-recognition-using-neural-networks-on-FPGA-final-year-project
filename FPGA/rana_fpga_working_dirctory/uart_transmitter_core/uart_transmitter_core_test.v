//`timescale 1ns / 1ps
`include "baudrate_generator.v"
`include "uart_transmitter_core.v"
`include "tick_generator.v"
`include "pulse_generator.v"

module uart_transmitter_core_test(
	input wire CLK,
	output wire TX,
	output reg INDICATOR_LED
	);
	
	// ----------- baudrate generator -------------
	baudrate_tick_generator b(
		.clk(CLK),
		.tick(BAUDRATE_TICK)
	);
	
	// ----------- tick generator -----------------
	wire TICK_GENERATOR_TICK;
	
	tick_generator #(.tick_time(32'd5000))
		t(
			.clk(CLK),
			.tick(TICK_GENERATOR_TICK)
		);
	
	// --------------- uart transmitter ------------
	reg TRANSMIT_START = 1'b0;
	reg [7:0] DATA_TO_BE_TRANSMITTED = 8'b0;
	wire TRANSMISSION_SUCCESFUL;
	
	uart_transmitter_core u(
		.clk(CLK),
		.shift_clk(BAUDRATE_TICK),
		.start(TRANSMIT_START),
		.d(DATA_TO_BE_TRANSMITTED),
		.bit_out(TX),
		.finish(TRANSMISSION_SUCCESFUL)
	);
	
	// ------------- pulse generator -----------------
	reg GENERATE_TRANSMITTER_START_PULSE = 1'b0;
	pulse_generator #(.PULSE_WIDTH(4'd2))
		p(
			.clk(CLK),
			.generate_pulse(GENERATE_TRANSMITTER_START_PULSE),
			.pulse(TRANSMIT_START)
		);
	
	// --------------- logic --------------------------
	
	initial begin
		INDICATOR_LED = 1'b0;
	end
	
	always @(posedge(TRANSMISSION_SUCCESFUL)) begin
		INDICATOR_LED = ~ INDICATOR_LED;
	end
	
	always @(posedge(TICK_GENERATOR_TICK)) begin
		GENERATE_TRANSMITTER_START_PULSE = ~ GENERATE_TRANSMITTER_START_PULSE;
		DATA_TO_BE_TRANSMITTED = DATA_TO_BE_TRANSMITTED + 1;
	end

endmodule
