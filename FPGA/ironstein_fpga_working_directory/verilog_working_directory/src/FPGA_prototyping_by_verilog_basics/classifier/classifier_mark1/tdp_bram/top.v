`include "bram_tdp_wrapper.v"
`include "uart_core_with_tx_buffer/uart_core.v"
`include "reset_controller/reset_controller.v"
`include "integer_seven_segment_display_controller/integer_seven_segment_display_controller.v"

module top(
	input wire clk,
	input wire reset_switch,
	output wire reset,
	input wire rx,
	output wire tx,
	output wire led1_control_signal,
	output wire led2_control_signal,
	output wire led3_control_signal,
	output wire [7:0] display_bits
	);
	
	// module instantiations
		
		// uart core with tx_buffer instantiation
		wire rx_done_tick;
		wire tx_start_transmission;
		wire [7:0] rx_data_out;
		reg [7:0] tx_data_in;
		
		uart_core #(.BAUDRATE(32'd9600),.FREQUENCY(32'd100000000))
			uart_core_instance1(
				.clk(clk),
				.reset(reset),
				.rx_done_tick(rx_done_tick),
				.tx_start_transmission(tx_start_transmission),
				.tx(tx),
				.rx(rx),
				.rx_data_out(rx_data_out),
				.tx_data_in(tx_data_in)
			);
			
		// bram TDP wrapper instantiation
			reg [31:0] bram_data_input_A;
			reg [31:0] bram_data_input_B;
			wire [31:0] bram_data_output_A;
			wire [31:0] bram_data_output_B;
			reg [8:0] bram_address_A;
			reg [8:0] bram_address_B;
			reg bram_enable_A;
			reg bram_enable_B;
			reg bram_enable_output_reg_A;
			reg bram_enable_output_reg_B;
			reg [3:0] bram_write_enable_A;
			reg [3:0] bram_write_enable_B;
			
			bram_tdp_wrapper bram_tdp_wrapper_instance1(
				.clk(clk),
				.reset(reset),
				.data_input_A(bram_data_input_A),
				.data_input_B(bram_data_input_B),
				.data_output_A(bram_data_output_A),
				.data_output_B(bram_data_output_B),
				.address_A(bram_address_A),
				.address_B(bram_address_B),
				.enable_A(bram_enable_A),
				.enable_B(bram_enable_B),
				.enable_output_reg_A(bram_enable_output_reg_A),
				.enable_output_reg_B(bram_enable_output_reg_B),
				.write_enable_A(bram_write_enable_A),
				.write_enable_B(bram_write_enable_B)
			);
			
		// reset controller instantiation
		
		reset_controller reset_controller_instance1(
			.clk(clk),
			.switch_input(reset_switch),
			.reset(reset)
		);
		
		// integer seven segment display controller
		integer_seven_segment_display_controller integer_seven_segment_display_controller_instance1(
			.clk(clk),
			.reset(reset),
			.integer_to_be_displayed(bram_data_output_A[7:0]),
			.led1_control_signal(led1_control_signal),
			.led2_control_signal(led2_control_signal),
			.led3_control_signal(led3_control_signal),
			.display_bits(display_bits)
		);
	
	// logic
	reg [31:0] bram_data_input_A_next;
	reg [3:0] bram_write_enable_A_next;

	always @(posedge(clk),posedge(reset)) begin
		if(reset) begin
			bram_data_input_A <= 0;
			bram_write_enable_A <= 0;
			bram_address_A <= 1;
			bram_enable_A <= 1;
		end else begin
			bram_data_input_A <= bram_data_input_A_next;
			bram_write_enable_A <= bram_write_enable_A_next;
			bram_address_A <= 1;
			bram_enable_A <= 1;
		end
	end
	
	always @* begin
		if(rx_done_tick) begin
			bram_data_input_A_next <= {24'b0,rx_data_out};
			bram_write_enable_A_next <= 15;
		end else begin
			bram_data_input_A_next <= bram_data_input_A;
			bram_write_enable_A_next <= 0;
		end
	end
		
endmodule
