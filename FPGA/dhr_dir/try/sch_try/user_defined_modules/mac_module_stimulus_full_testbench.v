`include "uart_core/uart_core.v"
`include "utils/reset_controller.v"
`include "utils/mac_module_test.v"

module mac_module_stimulus_test (
	// standard signals
	input wire CLK,
	input wire RESET_SWITCH,
	output wire RESET,
	// transmitter related signals
	// output wire TX,
	// receiver related signals
	// input wire RX,
	input wire RX_DONE_TICK,
	output reg TX_START_TRANSMISSION,
	input wire [7:0] RX_DATA_OUT,
	output reg [7:0] TX_DATA_IN,
	output wire [17:0] DATA_A_TEST,
	output wire [17:0] DATA_B_TEST,
	output wire clock_enable_pulse_mac_unit
	);

	// local variables
		// transmitter related signals   
		// reg TX_START_TRANSMISSION;
		// wire TX_BUSY;
		// reg [7:0] TX_DATA_IN;
		// receiver related signals
		// wire [7:0] RX_DATA_OUT;
		// dsp_module
		reg [17:0] DATA_A, DATA_B;
		assign DATA_A_TEST = DATA_A;
		assign DATA_B_TEST = DATA_B;

		wire [47:0] DATA_P;
		reg MAC_START_OPERATION;
		// testing_related_local_modules
		reg register_count ;

	// // module instantiations
	// uart_core u(
	// 	.clk(CLK),
	// 	.reset(RESET),
	// 	.rx_done_tick(RX_DONE_TICK),
	// 	.tx_start_transmission(TX_START_TRANSMISSION),
	// 	.tx_busy(TX_BUSY),
	// 	.rx(RX),
	// 	.rx_data_out(RX_DATA_OUT),
	// 	.tx(TX),
	// 	.tx_data_in(TX_DATA_IN)
	// 	);

	reset_controller r(
		.clk(CLK),
		.reset(RESET),
		.switch_input(RESET_SWITCH)
		);

	mac_module_test m0(
		.clk (CLK),
		.reset (RESET),
		.data_a (DATA_A),
		.data_b (DATA_B),
		.mac_start_operation (MAC_START_OPERATION), // toggle to start
		.data_p (DATA_P),
		.clock_enable_pulse(clock_enable_pulse_mac_unit)
		);

	initial begin
		TX_START_TRANSMISSION = 0;
		TX_DATA_IN = 0;
		register_count = 0;
		DATA_A = 0;
		DATA_B = 0;
	end // initial

	always @(posedge RX_DONE_TICK) begin
		if(register_count == 0) begin
			DATA_A = RX_DATA_OUT;
		end // if(register_count[0] == 0)
		else begin
			DATA_B = RX_DATA_OUT;
			MAC_START_OPERATION = ~MAC_START_OPERATION;
			TX_DATA_IN = DATA_P[7:0];
			TX_START_TRANSMISSION = ~TX_START_TRANSMISSION;
		end // else
		register_count = register_count + 1;
	end // always @(posedge RX_DONE_TICK)

endmodule // module synthesis_stimulus

module testbench();
	reg CLK;
	reg RESET_SWITCH;
	wire RESET;
	reg RX_DONE_TICK;
	wire TX_START_TRANSMISSION;
	reg [7:0] RX_DATA_OUT;
	wire [7:0] TX_DATA_IN;
	wire [17:0] DATA_A,DATA_B;
	wire clock_enable_mac;

	mac_module_stimulus_test m_tb(
		.CLK         (CLK),
		.RESET_SWITCH(RESET_SWITCH),
		.RESET       (RESET),
		.RX_DONE_TICK(RX_DONE_TICK),
		.TX_START_TRANSMISSION(TX_START_TRANSMISSION),
		.RX_DATA_OUT(RX_DATA_OUT),
		.TX_DATA_IN(TX_DATA_IN),
		.DATA_A_TEST          (DATA_A),
		.DATA_B_TEST          (DATA_B),
		.clock_enable_pulse_mac_unit(clock_enable_mac)
		);

	initial begin
		CLK = 0;
		RESET_SWITCH = 1;
		RX_DONE_TICK = 0;
		RX_DATA_OUT = 0;
	end

	always begin
		#5 CLK = ~ CLK;
	end

	initial begin
		#110 RESET_SWITCH = 0;
		#40 RESET_SWITCH = 1;
		
		#65 RX_DATA_OUT = 10;
		RX_DONE_TICK = 1;
		#10 RX_DONE_TICK = 0;
		
		#20 RX_DATA_OUT = 5;
		RX_DONE_TICK = 1;
		#10 RX_DONE_TICK = 0;
		
		#20 RX_DATA_OUT = 3;
		RX_DONE_TICK = 1;
		#10 RX_DONE_TICK = 0;
		
		#20 RX_DATA_OUT = 2;
		RX_DONE_TICK = 1;
		#10 RX_DONE_TICK = 0;
		
		#20 RX_DATA_OUT = 10;
		RX_DONE_TICK = 1;
		#10 RX_DONE_TICK = 0;
		
		#20 RX_DATA_OUT = 10;
		RX_DONE_TICK = 1;
		#10 RX_DONE_TICK = 0;
		
		#10 RX_DATA_OUT = 0;
		RX_DONE_TICK = 1;
		#10 RX_DONE_TICK = 0;
		
		#10 RX_DATA_OUT = 0;
		RX_DONE_TICK = 1;
		#10 RX_DONE_TICK = 0;
		
	end
	
endmodule // testbench