`include "sigmoid/sigmoid.v"
`include "reset_controller/reset_controller.v"
`include "uart_core/uart_core.v"

module top(
	input wire clk,
	input wire reset_switch,
	output wire reset,
	input wire rx,
	output wire tx
	// test signals
	output wire [17:0] x1_test,
	output wire [47:0] fixed_op_test,
	output wire  rx_done_tick_test,
	output wire  tx_start_transmission_test,
	output wire  tx_busy_test,
	output wire [7:0] rx_data_out_test,
	output wire [7:0] tx_data_in_test,
	output wire [1:0] state_reg_test,
	output wire [1:0] state_next_test,
	output wire [2:0] read_bytes_count_reg_test,
	output wire [2:0] read_bytes_count_next_test,
	output wire [3:0] write_bytes_count_reg_test,
	output wire [3:0] write_bytes_count_next_test,
	output wire [17:0] x1_next_test,
	output wire [(NUMBER_OF_OUTPUT_BYTES*8) -_test,
	output wire [(NUMBER_OF_OUTPUT_BYTES*8) 1:0]_test,
	output wire [(NUMBER_OF_OUTPUT_BYTES*8) converted_data_test,
	output wire [(NUMBER_OF_OUTPUT_BYTES*8) converted_data_next_test,
	output wire [1:0] tx_busy_check_wait_flag_reg_test,
	output wire [1:0] tx_busy_check_wait_flag_next_test,
	output wire  tx_start_transmission_next_test
	);

	// module instantiations 
	
	reset_controller reset_controller_instance1(
		.clk(clk),
		.switch(reset_switch),
		.reset(reset)
	);
	
	reg [17:0] x1;
	assign x1_test = x1;
	wire [47:0] fixed_op;
	assign fixed_op_test = fixed_op;
	sigmoid sigmoid_instance1(
		.clk(clk),
		.reset(reset),
		.x1(x1),
		.fixed_op(fixed_op)
	);
	
	wire rx_done_tick;
	assign rx_done_tick_test = rx_done_tick;
	reg tx_start_transmission;
	assign tx_start_transmission_test = tx_start_transmission;
	wire tx_busy;
	assign tx_busy_test = tx_busy;
	wire [7:0] rx_data_out;
	assign rx_data_out_test = rx_data_out;
	reg [7:0] tx_data_in;
	assign tx_data_in_test = tx_data_in;
	uart_core #(.BAUDRATE(32'd9600),.FREQUENCY(32'd100000000))
		uart_core_instance1(
			.clk(clk),
			.reset(reset),
			.rx_done_tick(rx_done_tick),
			.tx_start_transmission(tx_start_transmission),
			.tx_busy(tx_busy),
			.rx(rx),
			.rx_data_out(rx_data_out),
			.tx(tx),
			.tx_data_in(tx_data_in)
		);
		
	// state declarations
	localparam [1:0] 
		idle = 2'b00,
		reading = 2'b01,
		converting = 2'b10,
		transmitting = 2'b11;
		
	// constants
	localparam [8:0]
		NUMBER_OF_INPUT_BYTES = 8'd2,
		NUMBER_OF_OUTPUT_BYTES = 8'd6;
	localparam [3:0] TX_BUSY_CHECK_DELAY = 3;
		
	// signal declarations
	reg [1:0] state_reg,state_next;
	assign state_reg_test = state_reg;
	assign state_next_test = state_next;
	reg [2:0] read_bytes_count_reg,read_bytes_count_next;
	assign read_bytes_count_reg_test = read_bytes_count_reg;
	assign read_bytes_count_next_test = read_bytes_count_next;
	reg [3:0] write_bytes_count_reg,write_bytes_count_next;
	assign write_bytes_count_reg_test = write_bytes_count_reg;
	assign write_bytes_count_next_test = write_bytes_count_next;
	reg [17:0] x1_next;
	assign x1_next_test = x1_next;
	reg [(NUMBER_OF_OUTPUT_BYTES*8) - 1:0] converted_data,converted_data_next;
	assign -_test = -;
	assign 1:0]_test = 1:0];
	assign converted_data_test = converted_data;
	assign converted_data_next_test = converted_data_next;
	reg [1:0] tx_busy_check_wait_flag_reg,tx_busy_check_wait_flag_next;
	assign tx_busy_check_wait_flag_reg_test = tx_busy_check_wait_flag_reg;
	assign tx_busy_check_wait_flag_next_test = tx_busy_check_wait_flag_next;
	reg tx_start_transmission_next;
	assign tx_start_transmission_next_test = tx_start_transmission_next;
	
	assign tx_data_in = converted_data_reg[(8*(write_bytes_count_reg+1))-1:(8*(write_bytes_count_reg))];
	
	// state updation logic
	always @(posedge(clk),posedge(reset)) begin
		if(reset) begin
			state_reg <= 0;
			read_bytes_count_reg <= 0;
			write_bytes_count_reg <= 0;
			x1_reg <= 0;
			converted_data <= 0;
			tx_busy_check_wait_flag_reg <= TX_BUSY_CHECK_DELAY;
			tx_start_transmission <= 0;
		end else begin
			state_reg <= state_next;
			read_bytes_count_reg <= read_bytes_count_next;
			write_bytes_count_reg <= write_bytes_count_next;
			x1_reg <= x1_next;
			converted_data <= converted_data_next;
			tx_busy_check_wait_flag_reg <= tx_busy_check_wait_flag_next;
			tx_start_transmission <= tx_start_transmission_next;
		end
	end
	
	// next state logic 
	always @* begin
		converted_data_next = converted_data;
		x1_next = x1_reg;
		tx_busy_check_wait_flag_next = tx_busy_check_wait_flag_reg;
		tx_start_transmission_next = tx_start_transmission;
		
		if(state_reg == idle) begin
			// mealey outputs
			read_bytes_count_next = 0;
			write_bytes_count_next = 0;
			
			if(rx_done_tick) begin
				state_next = reading;
			end else begin
				state_next = idle;
			end
			
		end else if(state_reg == reading) begin
			// mealey outputs
			write_bytes_count_next = 0;
			
			if(read_bytes_count_reg == NUMBER_OF_INPUT_BYTES) begin
				state_next = converting;
				read_bytes_count_next = 0;
				x1_next = x1_reg;
			end else begin
				state_next = reading;
				if(rx_done_tick) begin
					read_bytes_count_next = read_bytes_count_reg + 1;
					x1_next = {x1_reg[9:0],rx_data_out};
				end else begin
					read_bytes_count_next = read_bytes_count_reg;
					x1_next = x1_reg;
				end
			end
			
		end else if(state_reg == converting) begin
			converted_data_next = fixed_op;
			write_bytes_count_next = 0;
			read_bytes_count_next = 0;
			state_next = writing;
		
		end else begin
			// mealey outputs
			read_bytes_count_next = 0;
			
			if(write_bytes_count_reg == NUMBER_OF_OUTPUT_BYTES) begin
				state_next = idle;
				write_bytes_count_next = 0;
			end else begin
				state_next = writing;
				if(tx_busy_check_wait_flag_reg == TX_BUSY_CHECK_DELAY) begin
					if(~tx_busy) begin
						write_bytes_count_next = write_bytes_count_reg + 1;
						tx_start_transmission_next = ~ tx_start_transmission;
						tx_busy_check_wait_flag_next = 0;
					end else begin
						write_bytes_cout_next = write_bytes_count_reg;
						tx_start_transmission_next = tx_start_transmission;
						tx_busy_ckeck_wait_flag_next = tx_busy_check_wait_flag_reg;
					end
				end else begin
					tx_busy_check_wait_flag_next = tx_busy_check_wait_flag_reg + 1;
				end
			end
					
		end
	end

endmodule
