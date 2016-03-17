`include "counter.v"
`include "tick_generator.v"

module vga_sync_signals_generator(
	// control signals
	input wire clk,
	input wire reset,
	// output wire
	output reg horizontal_sync,
	output reg vertical_sync,
	output reg horizontal_video_on,
	output reg vertical_video_on,
	output wire horizontal_done_tick_output,
	output wire vertical_done_tick_output,
	output wire [31:0] pixel_x,
	output wire [31:0] pixel_y
	);

	localparam [12:0]
		// horizontal sync pulse
		horizontal_visible_area_length = 640,
		horizontal_front_porch_length = 16,
		horizontal_sync_pulse_length = 96,
		horizontal_back_porch_length = 48,
		horizontal_whole_line_length = 800,
		// vertical sync pulse
		vertical_visible_area_length = 480,
		vertical_front_porch_length = 10,
		vertical_sync_pulse_length = 2,
		vertical_back_porch_length = 33,
		vertical_whole_frame_length = 525;

	// state declarations
	localparam [1:0]
		horizontal_on_state = 2'b00,
		horizontal_front_porch_state = 2'b01,
		horizontal_sync_pulse_state = 2'b10,
		horizontal_back_porch_state = 2'b11,
		vertical_on_state = 2'b00,
		vertical_front_porch_state = 2'b01,
		vertical_sync_pulse_state = 2'b10,
		vertical_back_porch_state = 2'b11;

	// signal declarations
		// state registers
		reg [1:0] horizontal_state_reg,horizontal_state_next;
		reg [1:0] vertical_state_reg,vertical_state_next;
		// counter variables
		wire [31:0] horizontal_counter_count;
		assign pixel_x = horizontal_counter_count;
		reg horizontal_counter_count_reset, horizontal_counter_count_reset_next;
		wire [31:0] vertical_counter_count;
		assign pixel_y = vertical_counter_count;
		reg vertical_counter_count_reset, vertical_counter_count_reset_next;
		// state variables
		reg horizontal_done_tick, horizontal_done_tick_next;
		reg vertical_done_tick, vertical_done_tick_next;
		assign vertical_counter_tick = horizontal_done_tick;
		assign horizontal_done_tick_output = horizontal_done_tick;
		assign vertical_done_tick_output = vertical_done_tick;
		// output signals
		reg horizontal_sync_next;
		reg horizontal_video_on_next;
		reg vertical_sync_next;
		reg vertical_video_on_next;

	// module instantiations
	tick_generator #(
			.tick_time(10'd4),	// in 10ns
			.frequency(10'd1)	// in 10^8 Hz
		) horizontal_counter_tick_generator(
			.clk(clk),
			.reset(reset),
			.tick(horizontal_counter_tick)
		);

	counter horizontal_counter(
		.count_tick(horizontal_counter_tick),
		.reset(reset),
		.count_reset(horizontal_counter_count_reset),
		.count(horizontal_counter_count)
	);

	counter vertical_counter(
		.count_tick(vertical_counter_tick),
		.reset(reset),
		.count_reset(vertical_counter_count_reset),
		.count(vertical_counter_count)
	);


	// state_updation_logic
	always @(posedge(clk),posedge(reset)) begin
		if(reset) begin
			horizontal_state_reg = horizontal_on_state;
			vertical_state_reg = vertical_on_state;
			horizontal_counter_count_reset = 1'b1;
			vertical_counter_count_reset = 1'b1;
			horizontal_done_tick = 1'b0;
			vertical_done_tick = 1'b0;
			horizontal_sync = 1'b0;
			vertical_sync = 1'b0;
			horizontal_video_on = 1'b0;
			vertical_video_on = 1'b0;
		end else begin
			horizontal_state_reg = horizontal_state_next;
			vertical_state_reg = vertical_state_next;
			horizontal_counter_count_reset = horizontal_counter_count_reset_next;
			vertical_counter_count_reset = vertical_counter_count_reset_next;
			horizontal_done_tick = horizontal_done_tick_next;
			vertical_done_tick = vertical_done_tick_next;
			horizontal_sync = horizontal_sync_next;
			vertical_sync = vertical_sync_next;
			horizontal_video_on = horizontal_video_on_next;
			vertical_video_on = vertical_video_on_next;
		end
	end

	// horizontal next state logic
	always @* begin
		if(horizontal_state_reg == horizontal_on_state) begin
			// mealey outputs
			horizontal_video_on_next = 1'b1;
			horizontal_sync_next = 1'b1;
			horizontal_counter_count_reset_next = 1'b0;
			horizontal_done_tick_next = 1'b0;
			
			if(horizontal_counter_count == horizontal_visible_area_length - 1) begin
				horizontal_state_next = horizontal_front_porch_state;
			end else begin
				horizontal_state_next = horizontal_state_reg;
			end

		end else if(horizontal_state_reg == horizontal_front_porch_state) begin
			// mealey outputs
			horizontal_video_on_next = 1'b0;
			horizontal_sync_next = 1'b1;
			horizontal_counter_count_reset_next = 1'b0;
			horizontal_done_tick_next = 1'b0;
			
			if(horizontal_counter_count == horizontal_visible_area_length + 
				horizontal_front_porch_length - 1) begin
				horizontal_state_next = horizontal_sync_pulse_state;
			end else begin
				horizontal_state_next = horizontal_state_reg;
			end

		end else if(horizontal_state_reg == horizontal_sync_pulse_state) begin
			// mealey outputs
			horizontal_video_on_next = 1'b0;
			horizontal_sync_next = 1'b0;
			horizontal_counter_count_reset_next = 1'b0;
			horizontal_done_tick_next = 1'b0;

			if(horizontal_counter_count == horizontal_visible_area_length + 
				horizontal_front_porch_length + horizontal_sync_pulse_length - 1) begin
				horizontal_state_next = horizontal_back_porch_state;
			end else begin
				horizontal_state_next = horizontal_state_reg;
			end

		end else begin
			// mealey outputs 
			horizontal_video_on_next = 1'b0;
			horizontal_sync_next = 1'b1;
			horizontal_counter_count_reset_next = 1'b0;
			horizontal_done_tick_next = 1'b0;

			if(horizontal_counter_count == horizontal_whole_line_length - 1) begin
				horizontal_counter_count_reset_next = 1'b1;
				horizontal_done_tick_next = 1'b1;
				horizontal_state_next = horizontal_on_state;
			end else begin
				horizontal_state_next = horizontal_state_reg;
			end
		end
	end

	// vertical next state logic
	always @* begin
		if(vertical_state_reg == vertical_on_state) begin
			// mealey outputs
			vertical_video_on_next = 1'b1;
			vertical_sync_next = 1'b1;
			vertical_counter_count_reset_next = 1'b0;
			vertical_done_tick_next = 1'b0;
			
			if(vertical_counter_count == vertical_visible_area_length - 1) begin
				vertical_state_next = vertical_front_porch_state;
			end else begin
				vertical_state_next = vertical_state_reg;
			end

		end else if(vertical_state_reg == vertical_front_porch_state) begin
			// mealey outputs
			vertical_video_on_next = 1'b0;
			vertical_sync_next = 1'b1;
			vertical_counter_count_reset_next = 1'b0;
			vertical_done_tick_next = 1'b0;
			
			if(vertical_counter_count == vertical_visible_area_length + 
				vertical_front_porch_length - 1) begin
				vertical_state_next = vertical_sync_pulse_state;
			end else begin
				vertical_state_next = vertical_state_reg;
			end

		end else if(vertical_state_reg == vertical_sync_pulse_state) begin
			// mealey outputs
			vertical_video_on_next = 1'b0;
			vertical_sync_next = 1'b0;
			vertical_counter_count_reset_next = 1'b0;
			vertical_done_tick_next = 1'b0;

			if(vertical_counter_count == vertical_visible_area_length + 
				vertical_front_porch_length + vertical_sync_pulse_length - 1) begin
				vertical_state_next = vertical_back_porch_state;
			end else begin
				vertical_state_next = vertical_state_reg;
			end

		end else begin
			// mealey outputs 
			vertical_video_on_next = 1'b0;
			vertical_sync_next = 1'b1;
			vertical_counter_count_reset_next = 1'b0;
			vertical_done_tick_next = 1'b0;

			if(vertical_counter_count == vertical_whole_frame_length) begin
				vertical_counter_count_reset_next = 1'b1;
				vertical_done_tick_next = 1'b1;
				vertical_state_next = vertical_on_state;
			end else begin
				vertical_state_next = vertical_state_reg;
			end
		end
	end

endmodule

module stimulus();
	// control signals
	reg CLK;
	reg RESET;
	// output signals
	wire HORIZONTAL_SYNC;
	wire VERTICAL_SYNC;
	wire HORIZONTAL_VIDEO_ON;
	wire VERTICAL_VIDEO_ON;
	wire [31:0] PIXEL_X;
	wire [31:0] PIXEL_Y;

	// module instantiation
	vga_sync_signals_generator v(
		.clk(CLK),
		.reset(RESET),
		.horizontal_sync(HORIZONTAL_SYNC),
		.vertical_sync(VERTICAL_SYNC),
		.horizontal_video_on(HORIZONTAL_VIDEO_ON),
		.vertical_video_on(VERTICAL_VIDEO_ON),
		.pixel_x(PIXEL_X),
		.pixel_y(PIXEL_Y)
	);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			CLK,
			RESET,
			HORIZONTAL_SYNC,
			VERTICAL_SYNC,
			HORIZONTAL_VIDEO_ON,
			VERTICAL_VIDEO_ON,
			PIXEL_X,
			PIXEL_Y
		);
	end

	initial begin
		CLK = 1'b0;
		RESET = 1'b0;
	end

	always begin
		#1 CLK = ~ CLK;
	end

	initial begin
		#2 RESET = 1'b1;
		#10 RESET = 1'b0;
	end

	initial begin
		#10000000 $finish;
	end
endmodule