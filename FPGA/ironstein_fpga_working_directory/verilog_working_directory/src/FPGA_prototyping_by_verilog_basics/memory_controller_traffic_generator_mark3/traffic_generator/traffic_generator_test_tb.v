`include "./traffic_generator_test.v"

module test_bench();
	reg clk;
	reg reset;
	reg rx_done_tick;
	reg [7:0] rx_data_out;
	wire tx_start_transmission;
	wire [7:0] tx_data_in;
	reg tx_busy;
	// test 
	reg wr_full;
	wire [31:0] wr_data;
	wire wr_en;
	// test signals 
	wire input_fifo_pop_test;
	wire input_fifo_push_test;
	wire [31:0] input_fifo_input_test;
	wire [31:0] input_fifo_output_test;
	wire output_fifo_pop_test;
	wire output_fifo_push_test;
	wire [7:0] output_fifo_input_test;
	wire [7:0] output_fifo_output_test;
	wire generate_input_fifo_pop_pulse_test;
	wire generate_input_fifo_push_pulse_test;
	wire generate_output_fifo_pop_pulse_test;
	wire generate_output_fifo_push_pulse_test;
	wire generate_output_fifo_push_pulse_next_test;
	wire [1:0] state_reg_test;
	wire [1:0] state_next_test;
	wire [7:0] count_reg_test;
	wire [7:0] count_next_test;
	wire [7:0] number_of_incoming_data_bytes_reg_test;
	wire [7:0] number_of_incoming_data_bytes_next_test;
	wire generate_input_fifo_push_pulse_next_test;
	// fifo test signals 
	// input fifo 
	wire [63:0] input_fifo_read_pointer_test;
	wire [63:0] input_fifo_write_pointer_test;
	wire input_fifo_full_test;
	wire input_fifo_empty_test;
	wire [63:0] input_fifo_count_test;
	// output fifo 
	wire [127:0] output_fifo_read_pointer_test;
	wire [127:0] output_fifo_write_pointer_test;
	wire output_fifo_full_test;
	wire output_fifo_empty_test;
	wire [127:0] output_fifo_count_test;

	// module instantiation
	traffic_generator traffic_generator_instance1 (
		.clk(clk),
		.reset(reset),
		.rx_done_tick(rx_done_tick),
		.rx_data_out(rx_data_out),
		.tx_start_transmission(tx_start_transmission),
		.tx_data_in(tx_data_in),
		.tx_busy(tx_busy),
		// test 
		.wr_full(wr_full),
		.wr_data(wr_data),
		.wr_en(wr_en),
		// test signals 
		.input_fifo_pop_test(input_fifo_pop_test),
		.input_fifo_push_test(input_fifo_push_test),
		.input_fifo_input_test(input_fifo_input_test),
		.input_fifo_output_test(input_fifo_output_test),
		.output_fifo_pop_test(output_fifo_pop_test),
		.output_fifo_push_test(output_fifo_push_test),
		.output_fifo_input_test(output_fifo_input_test),
		.output_fifo_output_test(output_fifo_output_test),
		.generate_input_fifo_pop_pulse_test(generate_input_fifo_pop_pulse_test),
		.generate_input_fifo_push_pulse_test(generate_input_fifo_push_pulse_test),
		.generate_output_fifo_pop_pulse_test(generate_output_fifo_pop_pulse_test),
		.generate_output_fifo_push_pulse_test(generate_output_fifo_push_pulse_test),
		.generate_output_fifo_push_pulse_next_test(generate_output_fifo_push_pulse_next_test),
		.state_reg_test(state_reg_test),
		.state_next_test(state_next_test),
		.count_reg_test(count_reg_test),
		.count_next_test(count_next_test),
		.number_of_incoming_data_bytes_reg_test(number_of_incoming_data_bytes_reg_test),
		.number_of_incoming_data_bytes_next_test(number_of_incoming_data_bytes_next_test),
		.generate_input_fifo_push_pulse_next_test(generate_input_fifo_push_pulse_next_test),
		// fifo test signals 
		// input fifo 
		.input_fifo_read_pointer_test(input_fifo_read_pointer_test),
		.input_fifo_write_pointer_test(input_fifo_write_pointer_test),
		.input_fifo_full_test(input_fifo_full_test),
		.input_fifo_empty_test(input_fifo_empty_test),
		.input_fifo_count_test(input_fifo_count_test),
		// output fifo 
		.output_fifo_read_pointer_test(output_fifo_read_pointer_test),
		.output_fifo_write_pointer_test(output_fifo_write_pointer_test),
		.output_fifo_full_test(output_fifo_full_test),
		.output_fifo_empty_test(output_fifo_empty_test),
		.output_fifo_count_test(output_fifo_count_test)
	);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			clk,
			reset,
			rx_done_tick,
			rx_data_out,
			// tx_start_transmission,
			// tx_data_in,
			// tx_busy,
			// test 
			wr_full,
			wr_data,
			wr_en,
			// test signals 
			// input_fifo_pop_test,
			// input_fifo_push_test,
			// input_fifo_input_test,
			// input_fifo_output_test,
			output_fifo_pop_test,
			output_fifo_push_test,
			output_fifo_input_test,
			output_fifo_output_test,
			// generate_input_fifo_pop_pulse_test,
			// generate_input_fifo_push_pulse_test,
			generate_output_fifo_pop_pulse_test,
			generate_output_fifo_push_pulse_test,
			generate_output_fifo_push_pulse_next_test,
			state_reg_test,
			state_next_test,
			count_reg_test,
			count_next_test,
			number_of_incoming_data_bytes_reg_test,
			number_of_incoming_data_bytes_next_test,
			// generate_input_fifo_push_pulse_next_test,
			// fifo test signals 
			// input fifo 
			// input_fifo_read_pointer_test,
			// input_fifo_write_pointer_test,
			// input_fifo_full_test,
			// input_fifo_empty_test,
			// input_fifo_count_test
			// output fifo 
			output_fifo_read_pointer_test,
			output_fifo_write_pointer_test,
			output_fifo_full_test,
			output_fifo_empty_test,
			output_fifo_count_test
		);
	end

	initial begin
		// initializing registers
		clk <= 0;
		reset <= 0;
		rx_done_tick <= 0;
		rx_data_out <= 0;
		tx_busy <= 0;
		wr_full <= 0;
	end

	always begin
		#1 clk = ~ clk;
	end

	initial begin
		#10 reset <= 1;
		#2 reset <= 0;
	end

	initial begin
		#30 rx_data_out <= 255;
		@(posedge(clk));
		rx_done_tick <= 1;
		#2 rx_done_tick <= 0;
		#29 rx_data_out <= 3;
		@(posedge(clk));
		rx_done_tick <= 1;
		#2 rx_done_tick <= 0;
		#29 rx_data_out <= 10;
		@(posedge(clk));
		rx_done_tick <= 1;
		#2 rx_done_tick <= 0;
		#29 rx_data_out <= 127;
		@(posedge(clk));
		rx_done_tick <= 1;
		#2 rx_done_tick <= 0;
		#29 rx_data_out <= 10;
		@(posedge(clk));
		rx_done_tick <= 1;
		#2 rx_done_tick <= 0;
	end

	initial begin
		#1000 $finish;
	end

endmodule