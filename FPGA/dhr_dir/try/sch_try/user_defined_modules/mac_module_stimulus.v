`include "uart_core/uart_core.v"
`include "utils/reset_controller.v"
`include "utils/mac_module.v"

module mac_module_stimulus (
	// standard signals
	input wire CLK,
	input wire RESET_SWITCH,
	output wire RESET, 
	// transmitter related signals
	output wire TX,
	// receiver related signals
	input wire RX,
	output wire RX_DONE_TICK
	);

	// local variables
		// transmitter related signals   
		reg TX_START_TRANSMISSION;
		wire TX_BUSY;
		reg [7:0] TX_DATA_IN;
		// receiver related signals
		wire [7:0] RX_DATA_OUT;
		// dsp_module
		reg [17:0] DATA_A;
		reg [17:0] DATA_B;
		wire [47:0] DATA_P;
		reg MAC_START_OPERATION;
		// testing_related_local_modules
		reg register_count ;

	// module instantiations
	uart_core u(
		.clk(CLK),
		.reset(RESET),
		.rx_done_tick(RX_DONE_TICK),
		.tx_start_transmission(TX_START_TRANSMISSION),
		.tx_busy(TX_BUSY),
		.rx(RX),
		.rx_data_out(RX_DATA_OUT),
		.tx(TX),
		.tx_data_in(TX_DATA_IN)
		);

	reset_controller r(
		.clk(CLK),
		.reset(RESET),
		.switch_input(RESET_SWITCH)
		);

	mac_module m0(
		.clk (CLK),
		.reset (RESET),
		.data_a (DATA_A),
		.data_b (DATA_B),
		.mac_start_operation (MAC_START_OPERATION), // toggle to start
		.data_p (DATA_P)
		);

	always @(posedge(CLK),posedge(RESET)) begin

		if(RESET) begin
			TX_START_TRANSMISSION = 0;
			TX_DATA_IN = 0;
			DATA_A = 0;
			DATA_B = 0;
			MAC_START_OPERATION = 0;
			register_count = 0;
		end // if(RESET)
		else if(RX_DONE_TICK) begin
			if(register_count == 0) begin
				// LOGIC
					DATA_A = RX_DATA_OUT;
				// RETAINING LOGIC
					// TX_START_TRANSMISSION = TX_START_TRANSMISSION;
					// TX_DATA_IN = TX_DATA_IN;
					// DATA_B = DATA_B;
					// MAC_START_OPERATION = MAC_START_OPERATION;
			end // if(register_count[0] == 0)
			else begin
				// LOGIC
					DATA_B = RX_DATA_OUT;
					MAC_START_OPERATION = ~MAC_START_OPERATION;
					TX_DATA_IN = DATA_P[7:0];
					TX_START_TRANSMISSION = ~TX_START_TRANSMISSION;
				// RETAINING LOGIC
					// DATA_A = DATA_A;
			end // else
			register_count = ~ register_count;
		end // else if(RX_DONE_TICK)
//		else begin
//			TX_START_TRANSMISSION 	= TX_START_TRANSMISSION;
//			TX_DATA_IN 				= TX_DATA_IN;
//			DATA_A 					= DATA_A;
//			DATA_B 					= DATA_B;
//			MAC_START_OPERATION 	= MAC_START_OPERATION;
//			register_count 			= register_count;
//		end // else

	end // always @(posedge CLK, posedge RESET, posedge RX_DONE_TICK)

endmodule // module synthesis_stimulus