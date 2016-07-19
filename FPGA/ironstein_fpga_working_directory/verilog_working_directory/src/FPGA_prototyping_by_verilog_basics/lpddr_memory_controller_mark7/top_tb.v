`include "top.v"

module test_bench();
	// LPDDR connections 
	// inout wire [15:0]dram_dq 
	// output wire [12:0]dram_a 
	// output wire [1:0]dram_ba 
	// output wire dram_cke 
	// output wire dram_ras_n 
	// output wire dram_cas_n 
	// output wire dram_we_n 
	// output wire dram_dm 
	// inout wire dram_udqs 
	// inout wire dram_rzq 
	// output wire dram_udm 
	// inout wire dram_dqs 
	// output wire dram_ck 
	// output wire dram_ck_n 
	// clock reset and calibration signals 
	reg clk;
	wire output;
	// input wire sys_clk// clk 
	// input wire pll_reset_switch // undebounced reest input for PLL 
	reg input;
	// output wire sys_rst_n// pll reset indicator output 
	// output wire rst0 
	// output wire calib_done// calibration done signal 
	// uart signals 
	reg uart_rx;
	wire uart_tx;
	// integer seven segment display controller signals 
	// output wire issd_led1_control_signal 
	// output wire issd_led2_control_signal 
	// output wire issd_led3_control_signal 
	// output wire [7:0] issd_display_bits 
	// output wire issd_led_change_tick 
	// test 
	// output wire wr_full_test 

	// module instantiation
	top top_instance1 (
		// LPDDR connections 
		// inout wire [15:0]dram_dq 
		// output wire [12:0]dram_a 
		// output wire [1:0]dram_ba 
		// output wire dram_cke 
		// output wire dram_ras_n 
		// output wire dram_cas_n 
		// output wire dram_we_n 
		// output wire dram_dm 
		// inout wire dram_udqs 
		// inout wire dram_rzq 
		// output wire dram_udm 
		// inout wire dram_dqs 
		// output wire dram_ck 
		// output wire dram_ck_n 
		// clock reset and calibration signals 
		.clk(clk),
		.reset(reset),
		// input wire sys_clk// clk 
		// input wire pll_reset_switch // undebounced reest input for PLL 
		.reset_switch(reset_switch),
		// output wire sys_rst_n// pll reset indicator output 
		// output wire rst0 
		// output wire calib_done// calibration done signal 
		// uart signals 
		.uart_rx(uart_rx),
		.uart_tx(uart_tx),
		// integer seven segment display controller signals 
		// output wire issd_led1_control_signal 
		// output wire issd_led2_control_signal 
		// output wire issd_led3_control_signal 
		// output wire [7:0] issd_display_bits 
		// output wire issd_led_change_tick 
		// test 
		// output wire wr_full_test
	);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			// LPDDR connections 
			// inout wire [15:0]dram_dq 
			// output wire [12:0]dram_a 
			// output wire [1:0]dram_ba 
			// output wire dram_cke 
			// output wire dram_ras_n 
			// output wire dram_cas_n 
			// output wire dram_we_n 
			// output wire dram_dm 
			// inout wire dram_udqs 
			// inout wire dram_rzq 
			// output wire dram_udm 
			// inout wire dram_dqs 
			// output wire dram_ck 
			// output wire dram_ck_n 
			// clock reset and calibration signals 
			clk,
			reset_switch,
			// input wire sys_clk// clk 
			// input wire pll_reset_switch // undebounced reest input for PLL 
			reset,
			// output wire sys_rst_n// pll reset indicator output 
			// output wire rst0 
			// output wire calib_done// calibration done signal 
			// uart signals 
			uart_rx,
			uart_tx,
			// integer seven segment display controller signals 
			// output wire issd_led1_control_signal 
			// output wire issd_led2_control_signal 
			// output wire issd_led3_control_signal 
			// output wire [7:0] issd_display_bits 
			// output wire issd_led_change_tick 
			// test 
			// output wire wr_full_test
		);
	end

	initial begin
		// initializing registers
		clk = 0;
		input = 0;
		uart_rx = 0;

		// add stimulus here


	end

	initial begin
		#1000 $finish;
	end

endmodule