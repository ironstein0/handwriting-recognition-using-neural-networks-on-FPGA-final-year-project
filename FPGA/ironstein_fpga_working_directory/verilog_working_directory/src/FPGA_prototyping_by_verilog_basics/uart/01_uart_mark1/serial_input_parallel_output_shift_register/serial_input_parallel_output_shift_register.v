`include "pulse_generator.v"

module serial_input_parallel_output_shift_register #(
	parameter N = 8	// number of bits in the shift register
	)(
	input wire clk,
	input wire shift_register_tick,
	input wire start,
	input wire s_in,
	output wire finish,
	output reg [N-1:0] data,
	output reg state_reg
	);

	// state declarations 
	localparam 
		idle = 1'b0,
		read = 1'b1;

	// signal declarations
	reg [16:0] count = 16'b0;
	// reg state_reg;
	reg state_next = idle;
	reg generate_finish_pulse;
	reg [N-1:0] data_next;

	pulse_generator #(.PULSE_WIDTH(2))
		finish_pulse_generator(
			.clk(clk),
			.generate_pulse(generate_finish_pulse),
			.pulse(finish)
		);

	initial begin
		state_reg <= idle;
		generate_finish_pulse <= 1'b0;
		data <= 0;
	end

	// state updation logic
	always @(posedge(clk)) begin
		state_reg = state_next;
	end

	always @(posedge(shift_register_tick)) begin
		data = data_next;
		count = count + 1;
	end

	// next state logic 
	always @* begin
		state_next = state_reg;
		case(state_reg) 
			idle :
				if(start == 1) begin
					count = 0;
					state_next = read;
				end
			read :
				if(count == N) begin
					state_next = idle;
					generate_finish_pulse = ~ generate_finish_pulse;
				end else begin
					data_next = {data[N-2:0],s_in};
				end
		endcase
	end
endmodule

