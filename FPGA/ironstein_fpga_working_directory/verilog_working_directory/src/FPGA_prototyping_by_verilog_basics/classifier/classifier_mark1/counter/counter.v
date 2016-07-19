`include "counter_pulse_generator.v"

module counter(
	input wire clk,
	input wire tick,
	input wire reset,
	input wire enable,
	input wire logic_reset,
	output reg [31:0] count,
	output reg overflow,
	input wire [31:0] count_threshold
	);

	// module instantiations
	wire tick_pulse;
	reg overflow_pulse;

	counter_pulse_generator counter_pulse_generator_intance1(
		.clk(clk),
		.reset(reset),
		.generate_pulse(tick),
		.pulse(tick_pulse)
	);

	reg [31:0] count_next;

	always @(posedge(clk),posedge(reset),posedge(logic_reset)) begin
		if(reset) begin
			count <= 0;
		end else if(logic_reset) begin
			count <= 0;
		end else begin
			count <= count_next;
		end
	end

	always @(posedge(tick_pulse),posedge(reset)) begin
		if(reset) begin
			overflow <= 0;
		end else begin
			if(count == count_threshold-1) begin
				overflow <= ~ overflow;
			end else begin
				overflow <= overflow;
			end
		end
	end

	always @* begin
		if(tick_pulse && enable) begin
			if(count == count_threshold-1) begin
				count_next = 0;
			end else begin
				if(overflow_pulse) begin
					count_next = 0;
				end else begin
					count_next = count + 1;
				end
			end
		end else begin
			count_next = count;
		end
	end

	// always @* begin
	// 	overflow_pulse = ((count_next == 0) && (count == count_threshold-1));
	// end

	always @* begin
		overflow_pulse = ((tick_pulse) && (count == count_threshold-1));
	end

endmodule