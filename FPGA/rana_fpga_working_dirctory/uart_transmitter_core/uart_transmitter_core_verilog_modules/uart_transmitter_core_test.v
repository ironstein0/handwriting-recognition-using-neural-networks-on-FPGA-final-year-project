//`timescale 1ns / 1ps
`include "baudrate_generator.v"
`include "uart_transmitter_core.v"
`include "tick_generator.v"
`include "pulse_generator.v"

module uart_transmitter_core_test(
	input wire CLK,
	output wire TX,
	output reg INDICATOR_LED,
	output wire TICK_GENERATOR_TICK
	);
	// baudrate generator signals
	wire BAUDRATE_TICK;
	// tick generator signals
	// uart transmitter signals
	reg [7:0] DATA_TO_BE_TRANSMITTED = 8'b11010010;
	wire TRANSMISSION_SUCCESFUL;
	// pulse generator signals
	reg GENERATE_TRANSMITTER_START_PULSE = 1'b0;
	//wire TRANSMIT_START;
	
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
	
	always @(posedge(TRANSMISSION_SUCCESFUL)) begin
		INDICATOR_LED = ~ INDICATOR_LED;
	end
	
	always @(posedge(TICK_GENERATOR_TICK)) begin
		GENERATE_TRANSMITTER_START_PULSE = ~ GENERATE_TRANSMITTER_START_PULSE;
	end
	
	always @(negedge(TICK_GENERATOR_TICK)) begin
		DATA_TO_BE_TRANSMITTED = DATA_TO_BE_TRANSMITTED + 1;
	end

endmodule

//module stimulus();
//	reg clk;
//	wire tx,indicator_led,baudrate_tick;
//	wire GENERATE_TRANSMIT_START_PULSE;
//	wire tick_generator_tick;
//	uart_transmitter_core_test t(
//		.CLK(clk),
//		.TX(tx),
//		.INDICATOR_LED(indicator_led),
//		.BAUDRATE_TICK(baudrate_tick),
//		.generate_transmit_start_pulse(GENERATE_TRANSMIT_START_PULSE),
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
//		$dumpvars(clk,tx,indicator_led,baudrate_tick,tick_generator_tick);
//	end
//	
//endmodule
