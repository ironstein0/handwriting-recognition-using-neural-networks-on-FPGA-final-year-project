`include "top_test.v"

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
	wire reset;
	reg reset_switch;
	// input wire sys_clk// clk 
	// input wire pll_reset_switch // undebounced reest input for PLL 
	// input wire reset_switch // reset switch input 
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
	// test signals 
	// command path signals 
	wire cmd_clk_test;
	wire cmd_en_test;
	wire [2:0] cmd_instr_test;
	wire [5:0] cmd_bl_test;
	wire [29:0] cmd_byte_addr_test;
	wire cmd_empty_test;
	wire cmd_full_test;
	// write datapath signals 
	wire wr_clk_test;
	wire wr_en_test;
	wire [3:0] wr_mask_test;
	wire [31:0] wr_data_test;
	wire wr_full_test;
	wire wr_empty_test;
	wire [6:0] wr_count_test;
	wire wr_underrun_test;
	wire wr_error_test;
	// read datapath signals 
	wire rd_clk_test;
	wire rd_en_test;
	wire [31:0] rd_data_test;
	wire rd_full_test;
	wire rd_empty_test;
	wire [6:0] rd_count_test;
	wire rd_overflow_test;
	wire rd_error_test;
	// uart signals 
	wire uart_rx_done_tick_test;
	wire uart_tx_start_transmission_test;
	wire uart_tx_busy_test;
	wire [7:0] uart_rx_data_out_test;
	wire [7:0] uart_tx_data_in_test;

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
		.reset_switch(reset_switch),
		// input wire sys_clk// clk 
		// input wire pll_reset_switch // undebounced reest input for PLL 
		// input wire reset_switch // reset switch input 
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
		// test signals 
		// command path signals 
		.cmd_clk_test(cmd_clk_test),
		.cmd_en_test(cmd_en_test),
		.cmd_instr_test(cmd_instr_test),
		.cmd_bl_test(cmd_bl_test),
		.cmd_byte_addr_test(cmd_byte_addr_test),
		.cmd_empty_test(cmd_empty_test),
		.cmd_full_test(cmd_full_test),
		// write datapath signals 
		.wr_clk_test(wr_clk_test),
		.wr_en_test(wr_en_test),
		.wr_mask_test(wr_mask_test),
		.wr_data_test(wr_data_test),
		.wr_full_test(wr_full_test),
		.wr_empty_test(wr_empty_test),
		.wr_count_test(wr_count_test),
		.wr_underrun_test(wr_underrun_test),
		.wr_error_test(wr_error_test),
		// read datapath signals 
		.rd_clk_test(rd_clk_test),
		.rd_en_test(rd_en_test),
		.rd_data_test(rd_data_test),
		.rd_full_test(rd_full_test),
		.rd_empty_test(rd_empty_test),
		.rd_count_test(rd_count_test),
		.rd_overflow_test(rd_overflow_test),
		.rd_error_test(rd_error_test),
		// uart signals 
		.uart_rx_done_tick_test(uart_rx_done_tick_test),
		.uart_tx_start_transmission_test(uart_tx_start_transmission_test),
		.uart_tx_busy_test(uart_tx_busy_test),
		.uart_rx_data_out_test(uart_rx_data_out_test),
		.uart_tx_data_in_test(uart_tx_data_in_test)
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
				reset,
				reset_switch,
				// input wire sys_clk// clk 
				// input wire pll_reset_switch // undebounced reest input for PLL 
				// input wire reset_switch // reset switch input 
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
			// test signals 
			// command path signals 
				cmd_clk_test,
				cmd_en_test,
				cmd_instr_test,
				cmd_bl_test,
				cmd_byte_addr_test,
				cmd_empty_test,
				cmd_full_test,
			// write datapath signals 
				wr_clk_test,
				wr_en_test,
				wr_mask_test,
				wr_data_test,
				wr_full_test,
				wr_empty_test,
				wr_count_test,
				wr_underrun_test,
				wr_error_test,
			// read datapath signals 
				// rd_clk_test,
				// rd_en_test,
				// rd_data_test,
				// rd_full_test,
				// rd_empty_test,
				// rd_count_test,
				// rd_overflow_test,
				// rd_error_test,
			// uart signals 
				uart_rx_done_tick_test,
				uart_tx_start_transmission_test,
				uart_tx_busy_test,
				uart_rx_data_out_test,
				uart_tx_data_in_test
		);
	end

	initial begin
		// initializing registers
		clk = 0;
		uart_rx = 1;
		reset_switch = 1;
		// add stimulus here


	end

	always begin
		#1 clk = ~ clk;
	end

	initial begin
		#10 reset_switch <= 0;
		#2 reset_switch <= 1;
	end
		
	initial begin
		#100 uart_rx <= 0;
		#2 uart_rx <= 1;
		#2200 uart_rx <= 0;
		#2 uart_rx <= 1;
		#2200 uart_rx <= 0;
		#6500 uart_rx <= 1;
		#500 uart_rx <= 0;
	end

	initial begin
		#100000 $finish;
	end

endmodule