//`timescale 1ns / 1ps
`include "baudrate_generator.v"
`include "uart_transmitter_core.v"
`include "tick_generator.v"
`include "pulse_generator.v"

module uart_transmitter_core_test(
	input wire CLK,
	output wire TX,
//	output wire BAUDRATE_TICK,
//	output reg GENERATE_TRANSMITTER_START_PULSE = 1'b0,
//	output wire TRANSMIT_START,
//	output wire TRANSMISSION_SUCCESFUL,
	output reg INDICATOR_LED,
	output wire TICK_GENERATOR_TICK
	);
	
	// baudrate generator signals

	// tick generator signals
	
	// uart transmitter signals
	reg [7:0] DATA_TO_BE_TRANSMITTED = 8'b00000111;
	reg GENERATE_TRANSMITTER_START_PULSE = 1'b0;
	
	// pulse generator signals
	
	
	// ----------- baudrate generator -------------
	localparam BAUDRATE = 32'd115200;
	
	baudrate_tick_generator #(.baudrate(BAUDRATE))
	b(
		.clk(CLK),
		.tick(BAUDRATE_TICK)
	);
	
	// ----------- tick generator -----------------
	tick_generator #(.tick_time(32'd5000),.frequency(32'd100000))
		t(
			.clk(CLK),
			.tick(TICK_GENERATOR_TICK)
		);
	
	// --------------- uart transmitter ------------
	
	uart_transmitter_core u(
		.clk(CLK),
		.shift_clk(BAUDRATE_TICK),
		.start(TRANSMIT_START),
		.d(DATA_TO_BE_TRANSMITTED),
		.bit_out(TX),
		.finish(TRANSMISSION_SUCCESFUL)
	);
	
	// ------------- pulse generator -----------------
	
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
	
//	initial begin
//		#100 GENERATE_TRANSMITTER_START_PULSE = ~ GENERATE_TRANSMITTER_START_PULSE;
//		#10000 GENERATE_TRANSMITTER_START_PULSE = ~ GENERATE_TRANSMITTER_START_PULSE;
//	end
	
	always @(posedge(TRANSMISSION_SUCCESFUL)) begin
		INDICATOR_LED = ~ INDICATOR_LED;
	end
	
	always @(posedge(TICK_GENERATOR_TICK)) begin
		GENERATE_TRANSMITTER_START_PULSE = ~ GENERATE_TRANSMITTER_START_PULSE;
	end
	
//	always @(negedge(TICK_GENERATOR_TICK)) begin
//		DATA_TO_BE_TRANSMITTED = DATA_TO_BE_TRANSMITTED + 1;
//	end

endmodule

//module stimulus();
//	reg clk;
//	wire tx;
//	wire baudrate_tick;
//	wire generate_transmitter_start_pulse;
//	wire transmit_start;
//	wire transmission_succesful;
//	wire indicator_led;
//	wire tick_generator_tick;
//	
//	uart_transmitter_core_test t(
//		.CLK(clk),
//		.TX(tx),
//		.BAUDRATE_TICK(baudrate_tick),
//		.GENERATE_TRANSMITTER_START_PULSE(generate_transmitter_start_pulse),
//		.TRANSMIT_START(transmit_start),
//		.TRANSMISSION_SUCCESFUL(transmission_succesful),
//		.INDICATOR_LED(indicator_led),
//		.TICK_GENERATOR_TICK(tick_generator_tick)
//	);
//	
//	initial begin
//		clk = 1'b0;
//	end
//	
//	always begin 
//		#1 clk = ~ clk;
//	end
//	
//	initial begin
//		$dumpvars(
//			clk,
//			tx,
//			baudrate_tick,
//			generate_transmitter_start_pulse,
//			transmit_start,
//			transmission_succesful,
//			indicator_led,
//			tick_generator_tick);
//	end
//	
//endmodule