module seven_segment_display_controller(
	input CLK,
	output [7:0] WIRE,
	output wire LED1,
	output wire LED2,
	output wire LED3,
	output wire LED_CHANGE_TICK,
	output wire VALUE_CHANGE_TICK,	
	);

endmodule

module shift_register #(
	parameter N = 3,
	parameter initial_value = 3'b1
	)(
	input wire clk,
	output wire [N-1:0] out)

	reg [N-1:0] data = initial_value;
	reg carry = 1'b0;
	assign out = data;
 	
	always @(posedge(clk)) begin
		carry = data[N-1];
		data[N-1:1] = data[N-2:0];
		data[0] = carry;
	end
endmodule	

module seven_segment_display (
	input wire [3:0] digit_to_be_displayed,
	input wire dp,
	output reg [7:0] led
	);

	always @* begin	
		case(digit_to_be_displayed) 
			4'h0 : led[7:1] = 0'b0000001;
			4'h1 : led[7:1] = 0'b1001111;
			4'h2 : led[7:1] = 0'b0010010;
			4'h3 : led[7:1] = 0'b0000110;
			4'h4 : led[7:1] = 0'b1001100;
			4'h5 : led[7:1] = 0'b0100100;
			4'h6 : led[7:1] = 0'b0100000;
			4'h7 : led[7:1] = 0'b0001111;
			4'h8 : led[7:1] = 0'b0000000;
			4'h9 : led[7:1] = 0'b0000100;
			default : led[7:1] = 0'b1111111;
		endcase
		led[0] = dp;
	end
endmodule

module tick_generator #(
	parameter tick_time = 32'd1000
	)(
	input wire clk,
	output reg tick);
	
	localparam frequency = 32'd100000;

	reg [32:0] count = 32'b0;
	reg [32:0] count_threshold = tick_time * frequency / 2;
	
	initial 
		tick = 1'b0;
	
	always @(posedge(clk)) begin
		count = count + 1;
		if(count == count_threshold) begin
			count = 0;
			tick = ~ tick;
		end
	end

endmodule
