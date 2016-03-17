`include "uart_rx_core/uart_rx_core.v"
`include "uart_tx_core/uart_tx_core.v"
//`include "reset_controller/reset_controller.v"

module uart_core #(
		parameter BAUDRATE = 32'd9600,
		parameter FREQUENCY = 32'd100000000
		)(
		// control signals
		input wire clk,
		input wire reset,
			// rx
			output wire rx_done_tick,
			// tx
			input wire tx_start_transmission,
			output wire tx_busy,
		// data signals
			// rx
			input wire rx,
			output wire [7:0] rx_data_out,
			// tx
			output wire tx, 
			input wire [7:0] tx_data_in
		);
	
	// module instantiations
	uart_rx_core #(.NUMBER_OF_DATA_BITS(4'd8),.NUMBER_OF_STOP_BIT_TICKS(5'd16),.BAUDRATE(BAUDRATE),.FREQUENCY(FREQUENCY))
		rx_core (
			.clk(clk),
			.reset(reset),
			.rx(rx),
			.data_out(rx_data_out),
			.rx_done_tick(rx_done_tick)
		);

	uart_tx_core #(.NO_OF_DATABITS(4'd8),.NO_OF_STOPBITS(1'd1),.BAUDRATE(BAUDRATE),.FREQUENCY(FREQUENCY))
		tx_core (
			.clk(clk),
			.reset(reset),
			.start_transmission(tx_start_transmission),
			.busy(tx_busy),
			.data_in(tx_data_in),
			.tx(tx)
		);

endmodule 

//module test_bench();
//	reg CLK;
//	reg RESET_SWITCH;
//	wire RESET;
//	// transmitter related signals
//	reg TX_START_TRANSMISSION;
//	wire TX_BUSY;
//	wire TX;
//	reg [7:0] TX_DATA_IN;
//	// receiver related signals
//	wire RX;
//	wire [7:0] RX_DATA_OUT;
//	wire RX_DONE_TICK;
//
//	assign RX = TX;
//	
//	// module instantiations
//	uart_core u(
//		.clk(CLK),
//		.reset(RESET),
//		.rx_done_tick(RX_DONE_TICK),
//		.tx_start_transmission(TX_START_TRANSMISSION),
//		.tx_busy(TX_BUSY),
//		.rx(RX),
//		.rx_data_out(RX_DATA_OUT),
//		.tx(TX),
//		.tx_data_in(TX_DATA_IN)
//		);
//	
//	reset_controller r1(
//		.clk(CLK),
//		.reset(RESET),
//		.switch_input(RESET_SWITCH)
//		);
//	
//	initial begin
//		$dumpfile("simulation.vcd");
//		$dumpvars(0,
//			CLK,
//			RESET,
//			RESET_SWITCH,
//			TX_START_TRANSMISSION,
//			TX_BUSY,
//			TX,
//			TX_DATA_IN,
//			RX,
//			RX_DATA_OUT,
//			RX_DONE_TICK
//		);
//	end
//
//	initial begin
//		CLK = 1'b0;
//		RESET_SWITCH = 1'b1;
//		TX_START_TRANSMISSION = 1'b0;
//		TX_DATA_IN = 8'b00001111;
//	end
// 
//	always begin
//		#1 CLK = ~ CLK;
//	end
// 
//	initial begin
//		#2 RESET_SWITCH = 1'b0;
//		#2 RESET_SWITCH = 1'b1;
//		#70 TX_START_TRANSMISSION = ~ TX_START_TRANSMISSION;
//	end
//
//	initial begin
//		#1000000 $finish;
//	end
//endmodule

//module synthesis_stimulus(
//	input wire CLK,
//	input wire RESET_SWITCH,
//	output wire RESET,
//	// transmitter related signals
//	output wire TX,
//	// receiver related signals
//	input wire RX,
//	output wire RX_DONE_TICK
//	);
//	
//	// transmitter related signals	
//	reg TX_START_TRANSMISSION;
//	wire TX_BUSY;
//	reg [7:0] TX_DATA_IN;
//	// receiver related signals
//	wire [7:0] RX_DATA_OUT;
//	
//	// module instantiations
//	uart_core u(
//		.clk(CLK),
//		.reset(RESET),
//		.rx_done_tick(RX_DONE_TICK),
//		.tx_start_transmission(TX_START_TRANSMISSION),
//		.tx_busy(TX_BUSY),
//		.rx(RX),
//		.rx_data_out(RX_DATA_OUT),
//		.tx(TX),
//		.tx_data_in(TX_DATA_IN)
//		);
//	
//	reset_controller r1(
//		.clk(CLK),
//		.reset(RESET),
//		.switch_input(RESET_SWITCH)
//		);
//
//	always @ (posedge(RX_DONE_TICK)) begin
//		TX_DATA_IN = RX_DATA_OUT;
//		TX_START_TRANSMISSION = ~TX_START_TRANSMISSION;
//	end
//endmodule
