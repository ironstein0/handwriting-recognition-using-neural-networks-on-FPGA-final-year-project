//`timescale 1ns / 1ps
`include "tx_baudrate_tick_generator.v"
`include "pulse_generator.v"
`include "reset_controller.v"

module transmitter_core
	#(	parameter NO_OF_DATABITS = 8,
		parameter No_OF_STOPBITS = 1
		)(
		// control signals
		input wire clk,
		input wire reset_switch,
		input wire start_transmission,
		output reg busy,
		// data signals
		input wire[NO_OF_DATABITS-1:0] parallel_data,
		output reg tx,
		// test signals
		output wire tick,
		output wire tx_start_transmission_test,
		output wire reset_test,
		output wire state_reg_test,
		output wire state_next_test,
		output wire busy_next_test,
		output wire shift_bit_test,
		output wire shift_reg_test,
		output wire shift_reg_next_test,
		output wire tx_next_test,
		output wire count_test,
		output wire count_next_test
		);
	// assignments
	assign tx_start_transmission_test = tx_start_transmission;
	assign reset_test = reset;
	assign state_reg_test = state_reg;
	assign state_next_test = state_next;
	assign busy_next_test = busy_next;
	assign shift_bit_test = shift_bit;
	assign shift_reg_test = shift_reg;
	assign shift_reg_next_test = shift_reg_next;
	assign tx_next_test = tx_next;
	assign count_test = count;
	assign count_next_test = count_next;

	// module instantitation
	tx_baudrate_tick_generator #(.baudrate(32'd9600),.frequency(32'd100000000))
		T1(
			.clk(clk),
			.reset(reset),
			.tick(tick)
		);
	
	pulse_generator #(.PULSE_WIDTH(32'd1))
		T2(
		.clk(clk),
		.generate_pulse(start_transmission),
		.pulse(tx_start_transmission)
	);
	
	reset_controller T3(
		.clk(clk),
		.switch_input(reset_switch),
		.reset(reset)
	);

	// state declarations
	localparam 
		idle = 1'b0,
		transmitting = 1'b1;

	// signals
	reg state_reg, state_next;
	reg [2:0] count,count_next;
	reg busy_next;
	reg shift_bit;
	reg [NO_OF_DATABITS-1 : 0] shift_reg, shift_reg_next;
	reg tx_next;

	// state

	initial begin
		state_reg = idle;
		shift_bit = 1'b1;
		state_reg = state_next;
		count = 3'd0;
	end

	// state updation logic
	always @(posedge(clk),posedge(reset)) begin
		if(reset) begin
			state_reg = idle;
			count = 0;
			busy = 0;
			shift_reg = 0;
			tx = 1;
			// reset related stuff
		end else begin
			state_reg = state_next;
			count = count_next;
			busy = busy_next;
			shift_reg = shift_reg_next;
			tx = tx_next;
			// clk related stuff
		end
	end

	// next state logic
	always @* begin
		if(state_reg == idle) begin
			// mealey outputs
			busy_next = 0;
			tx_next = 1;
			count_next = 0;

			if(tx_start_transmission == 1) begin
				shift_reg_next = parallel_data;	// load data
				state_next = transmitting;
			end else begin
				shift_reg_next = shift_reg;
				state_next = state_reg;
			end
		end else begin
			// mealey outputs
			busy_next = 1;
			if(tick==1) begin
				if(count == 8) begin
					tx_next = 1;
					count_next = 0;
					shift_reg_next = shift_reg;
					state_next = idle;
				end else begin
					tx_next = shift_reg[0];
					shift_reg_next = {shift_bit,shift_reg[NO_OF_DATABITS-2:0]};
					count_next = count + 1;
					state_next = state_reg;
				end
			end else begin
				count_next = count;
				shift_reg_next = shift_reg;
				state_next = state_reg;
				tx_next = tx;
			end
		end
	end

endmodule // transmitter_core

	// if (count == 0)
	// 	if(state_reg == idle) begin
	// 	// mealy outputs
	// 	busy = 0'b0;
	// 	tx = 0'b0;
	// 	end	else 
	// 	state_next = state;
	// else if (start_trasnmission == 1)
	// 	shift_reg_next = parallel_data;		 

	// else if (state_reg == transmitting) begin
	// 	// mealy outputs
	// 	busy = 1; 
	// 	if (count < 8) begin
	// 		shift_reg = {(shift_bit):(parallel_data[NO_OF_DATABITS-2:0])};
	// 		count = count + 1;
	// 		count_next = count;
	// 	end else if (count == 8)
	// 		state = idle;

// module stimulus();
// 		reg CLK;
// 		reg RESET;
// 		reg [7:0] PARALLEL_DATA;
// 		reg START_TRANSMISSION;
// 		reg TICK;
// 		wire TX;
// 		wire BUSY;
	

// 	trasnsmitter_core T
// 	(	.clk(CLK),
// 		.reset_switch(RESET),
// 		.parallel_data(PARALLEL_DATA),
// 		.start_transmission(START_TRANSMISSION),
// 		.tx(TX),
// 		.busy(BUSY)
// 		);
// 	initial begin
// 		CLK = 1'b0;
// 		PARALLEL_DATA = 8'b11;
// 		RESET = 1'b0;
// 		START_TRANSMISSION = 1'b0;
// 	end	

// 	initial begin
// 		$dumpvars (CLK, RESET, PARALLEL_DATA, START_TRANSMISSION, TICK, TX, BUSY);
// 	end // initial

// 	always 
// 	#1 CLK = ~CLK;

// 	initial begin
// 		#30 START_TRANSMISSION = 1'b1;
// 		#150 RESET = 1'b1;
// 		#200 $finish;
// 	end
// endmodule

module stimulus();
	// control signals
	reg CLK;
	reg RESET_SWITCH;
	wire RESET;
	reg START_TRANSMISSION;
	wire BUSY;
	// data signals
	reg [7:0] PARALLEL_DATA;
	wire TX;
	// test signals
	wire TICK;
	wire TX_START_TRANSMISSION;
	wire STATE_REG;
	wire STATE_NEXT;
	wire BUSY_NEXT;
	wire SHIFT_BIT;
	wire SHIFT_REG;
	wire SHIFT_REG_NEXT;
	wire TX_NEXT;
	wire COUNT;
	wire COUNT_NEXT;

	transmitter_core T
	(	.clk(CLK),
		.reset_switch(RESET_SWITCH),
		.parallel_data(PARALLEL_DATA),
		.start_transmission(START_TRANSMISSION),
		.tx(TX),
		.busy(BUSY),
		.tick(TICK),
		.tx_start_transmission_test(TX_START_TRANSMISSION),
		.reset_test(RESET),
		.state_reg_test(STATE_REG),
		.state_next_test(STATE_NEXT),
		.busy_next_test(BUSY_NEXT),
		.shift_reg_test(SHIFT_REG),
		.shift_bit_test(SHIFT_BIT),
		.shift_reg_next_test(SHIFT_REG_NEXT),
		.tx_next_test(TX_NEXT),
		.count_test(COUNT),
		.count_next_test(COUNT_NEXT)
		);
		
	initial begin
		PARALLEL_DATA = 8'b11;
		RESET_SWITCH = 1'b0;
		START_TRANSMISSION = 1'b0;
	end	

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars (0,
			CLK, 
			RESET_SWITCH,
			RESET, 
			PARALLEL_DATA, 
			START_TRANSMISSION, 
			TICK, 
			TX, 
			BUSY,
			TX_START_TRANSMISSION, 
			STATE_REG, 
			STATE_NEXT, 
			BUSY_NEXT, 
			SHIFT_REG,
			SHIFT_BIT, 
			SHIFT_REG_NEXT, 
			TX_NEXT, 
			COUNT, 
			COUNT_NEXT
		);
	end 
	
	initial begin 
		#10 RESET_SWITCH = 1'b1;
		#20 START_TRANSMISSION =1'b1;
	end
	
	always begin
		#1 CLK = ~CLK;
	end
	
	initial begin
		#1000 $finish;
	end
endmodule
