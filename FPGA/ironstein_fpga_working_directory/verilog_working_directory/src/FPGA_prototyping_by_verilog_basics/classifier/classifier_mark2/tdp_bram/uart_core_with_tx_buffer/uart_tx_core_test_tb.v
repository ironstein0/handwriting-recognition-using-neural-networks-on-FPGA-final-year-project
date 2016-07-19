`include "uart_tx_core_test.v"

module test_bench();
						// control signals 
	reg clk;
	reg reset;
	reg start_transmission;
	wire busy;
	// data signals 
	reg [7:0] data_in;
	wire tx;
	// test signals 
	wire tx_baudrate_tick_generator_enable_test;
	wire fifo_push_test;
	wire fifo_pop_test;
	wire fifo_full_test;
	wire fifo_empt_test;
	wire [7:0] fifo_input_test;
	wire [7:0] fifo_output_test;
	wire [63:0] fifo_count_test;
	wire generate_fifo_push_pulse_test;
	wire generate_fifo_pop_pulse_test;
	wire [1:0] state_reg_test;
	wire [1:0] state_next_test;
	wire [3:0] count_test;
	wire [3:0] count_next_test;
	wire busy_next_test;
	wire [7:0] shift_reg_test;
	wire [7:0] shift_reg_next_test;
	wire tx_next_test;
	wire generate_fifo_pop_pulse_next_test;
	wire [1:0] wait_count_test;
	wire [1:0] wait_count_next_test;

	// module instantiation
	uart_tx_core uart_tx_core_instance1 (
		// control signals 
		.clk(clk),
		.reset(reset),
		.start_transmission(start_transmission),
		.busy(busy),
		// data signals 
		.data_in(data_in),
		.tx(tx),
		// test signals 
		.tx_baudrate_tick_generator_enable_test(tx_baudrate_tick_generator_enable_test),
		.fifo_push_test(fifo_push_test),
		.fifo_pop_test(fifo_pop_test),
		.fifo_full_test(fifo_full_test),
		.fifo_empty_test(fifo_empt_test),
		.fifo_input_test(fifo_input_test),
		.fifo_output_test(fifo_output_test),
		.fifo_count_test(fifo_count_test),
		.generate_fifo_push_pulse_test(generate_fifo_push_pulse_test),
		.generate_fifo_pop_pulse_test(generate_fifo_pop_pulse_test),
		.state_reg_test(state_reg_test),
		.state_next_test(state_next_test),
		.count_test(count_test),
		.count_next_test(count_next_test),
		.busy_next_test(busy_next_test),
		.shift_reg_test(shift_reg_test),
		.shift_reg_next_test(shift_reg_next_test),
		.tx_next_test(tx_next_test),
		.generate_fifo_pop_pulse_next_test(generate_fifo_pop_pulse_next_test),
		.wait_count_test(wait_count_test),
		.wait_count_next_test(wait_count_next_test)
	);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			// control signals 
			clk,
			reset,
			start_transmission,
			busy,
			// data signals 
			data_in,
			tx,
			// test signals 
			tx_baudrate_tick_generator_enable_test,
			fifo_push_test,
			fifo_pop_test,
			fifo_full_test,
			fifo_empt_test,
			fifo_input_test,
			fifo_output_test,
			fifo_count_test,
			generate_fifo_push_pulse_test,
			generate_fifo_pop_pulse_test,
			state_reg_test,
			state_next_test,
			count_test,
			count_next_test,
			busy_next_test,
			shift_reg_test,
			shift_reg_next_test,
			tx_next_test,
			generate_fifo_pop_pulse_next_test,
			wait_count_test,
			wait_count_next_test
		);
	end

	initial begin
		// initializing registers
		clk = 0;
		reset = 0;
		start_transmission = 0;
		data_in = 0;

		// add stimulus here


	end

	initial begin 
		#10 reset <= 1;
		#10 reset <= 0;
	end
	
	reg [7:0] i = 0;
	
	initial begin
		#1;
		#150000;
		@(posedge(clk));
		data_in <= 10;
		start_transmission <= ~ start_transmission;
		#150000;
		@(posedge(clk));
		data_in <= 13;
		start_transmission <= ~ start_transmission;
		@(posedge(clk));
		data_in <= 14;
		start_transmission <= ~ start_transmission;
		
	end
	
	always begin
		#1 clk <= ~ clk;
	end
	
	initial begin
		#1000000 $finish;
	end

endmodule