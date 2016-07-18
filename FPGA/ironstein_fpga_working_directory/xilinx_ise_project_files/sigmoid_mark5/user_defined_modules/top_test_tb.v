`include "top_test.v"

module test_bench();
	reg clk;
	reg reset_switch;
	wire reset;
	reg rx;
	wire tx;
	// test signals 
	wire [17:0] x1_test;
	wire [47:0] fixed_op_test;
	wire rx_done_tick_test;
	wire tx_start_transmission_test;
	wire tx_busy_test;
	wire [7:0] rx_data_out_test;
	wire [7:0] tx_data_in_test;
	wire [1:0] state_reg_test;
	wire [1:0] state_next_test;
	wire [2:0] read_bytes_count_reg_test;
	wire [2:0] read_bytes_count_next_test;
	wire [3:0] write_bytes_count_reg_test;
	wire [3:0] write_bytes_count_next_test;
	wire [17:0] x1_next_test;
	wire [47:0] converted_data_test;
	wire [47:0] converted_data_next_test;
	wire [1:0] tx_busy_check_wait_flag_reg_test;
	wire [1:0] tx_busy_check_wait_flag_next_test;
	wire tx_start_transmission_next_test;

	// module instantiation
	top_test top_instance1 (
		.clk(clk),
		.reset_switch(reset_switch),
		.reset(reset),
		.rx(rx),
		.tx(tx),
		// test signals 
		.x1_test(x1_test),
		.fixed_op_test(fixed_op_test),
		.rx_done_tick_test(rx_done_tick_test),
		.tx_start_transmission_test(tx_start_transmission_test),
		.tx_busy_test(tx_busy_test),
		.rx_data_out_test(rx_data_out_test),
		.tx_data_in_test(tx_data_in_test),
		.state_reg_test(state_reg_test),
		.state_next_test(state_next_test),
		.read_bytes_count_reg_test(read_bytes_count_reg_test),
		.read_bytes_count_next_test(read_bytes_count_next_test),
		.write_bytes_count_reg_test(write_bytes_count_reg_test),
		.write_bytes_count_next_test(write_bytes_count_next_test),
		.x1_next_test(x1_next_test),
		.converted_data_test(converted_data_test),
		.converted_data_next_test(converted_data_next_test),
		.tx_busy_check_wait_flag_reg_test(tx_busy_check_wait_flag_reg_test),
		.tx_busy_check_wait_flag_next_test(tx_busy_check_wait_flag_next_test),
		.tx_start_transmission_next_test(tx_start_transmission_next_test)
	);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			clk,
			reset_switch,
			reset,
			rx,
			tx,
			// test signals 
			x1_test,
			fixed_op_test,
			rx_done_tick_test,
			tx_start_transmission_test,
			tx_busy_test,
			rx_data_out_test,
			tx_data_in_test,
			state_reg_test,
			state_next_test,
			read_bytes_count_reg_test,
			read_bytes_count_next_test,
			write_bytes_count_reg_test,
			write_bytes_count_next_test,
			x1_next_test,
			converted_data_test,
			converted_data_next_test,
			tx_busy_check_wait_flag_reg_test,
			tx_busy_check_wait_flag_next_test,
			tx_start_transmission_next_test
		);
	end

	initial begin
		// initializing registers
		clk = 0;
		reset_switch = 1;
		rx = 1;

	end

	initial begin
		reset_switch = 0;
		#2 reset_switch = 1;
	end
	
	always begin
		#1 clk = ~ clk;
	end
	
	initial begin
		#100 rx = 0;
		#10000 rx = 1;
	end

	initial begin
		#10000 $finish;
	end

endmodule
