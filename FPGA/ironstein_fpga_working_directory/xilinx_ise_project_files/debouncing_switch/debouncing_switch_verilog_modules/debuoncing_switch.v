`include "tick_generator.v"

module debounced_button(
	input wire clk,
	input wire switch_input,
	output reg switch_output
	);

	// state declarations 
	localparam [2:0]
		zero 	= 3'b000,
		wait0_1 = 3'b001,
		wait1_1 = 3'b010,
		wait2_1 = 3'b011,
		one 	= 3'b100,
		wait0_0 = 3'b101,
		wait1_0 = 3'b110,
		wait2_0 = 3'b111;

	// module instantiations
	tick_generator #(.tick_time(10),.frequency(100000))
		t(
		.clk(clk),
		.tick(tick)
		);

	// signal declarations
	reg [2:0] state_reg,state_next;	// will be synthesized as a flip flop, since 
								// referenced outside an edge sensitive behaviour
	reg switch_output_next;

	// initializations 
	initial begin
		state_reg = zero;
		state_next = zero;
		switch_output = 1'b0;
		switch_output_next = 1'b0;
	end

	// state updation logic
	always @(posedge(clk)) begin
		// clk should be the last signal that should 
		// be addressed in the synchronous behaviour
		state_reg = state_next;	// this will lead to synthesis of flip flops, with 
								// clk as the synchronizing signal
		switch_output = switch_output_next;
	end

	always @* begin
		// if the event control expression is sensitive to edges of more than one
		// signals, an if statement should be the first statement in the behaviour

		// in this case, there are two signals that this event control expression
		// is sensitive to --> 1) clk 2) tick
		// hence the first statement is an if statement

		// debug = ~ debug;
		if(tick) begin	// if tick == 1
			// debug = ~ debug;
			case(state_reg) 
				
				zero : 
					if(switch_input) begin
						state_next = wait0_1;
						switch_output_next = 1'b0;
					end else begin
						state_next = zero;
						switch_output_next = 1'b0;
					end
				
				wait0_1 : 
					if(switch_input) begin
						state_next = wait1_1;
						switch_output_next = 1'b0;
					end else begin
						state_next = zero;
						switch_output_next = 1'b0;
					end
				
				wait1_1 : 
					if(switch_input) begin
						state_next = wait2_1;
						switch_output_next = 1'b0;
					end else begin
						state_next = zero;
						switch_output_next = 1'b0;
					end
				
				wait2_1 : 
					if(switch_input) begin
						state_next = one;
						switch_output_next = 1'b1;
					end else begin
						state_next = zero;
						switch_output_next = 1'b0;
					end
				
				one : 
					if(~switch_input) begin
						state_next = wait0_0;
						switch_output_next = 1'b1;
					end else begin
						state_next = one;
						switch_output_next = 1'b1;
					end
				
				wait0_0 :
					if(~switch_input) begin
						state_next = wait1_0;
						switch_output_next = 1'b1;
					end else begin
						state_next = one;
						switch_output_next = 1'b1;
					end
				
				wait1_0 :
					if(~switch_input) begin
						state_next = wait2_0;
						switch_output_next = 1'b1;
					end else begin
						state_next = one;
						switch_output_next = 1'b1;
					end
				
				wait2_0 : 
					if(~switch_input) begin
						state_next = zero;
						switch_output_next = 1'b0;
					end else begin
						state_next = one;
						switch_output_next = 1'b1;
					end
				
				default : 
					// incomplete case statements in an edge sensitive
					// behaviour leads to clock enable because incomplete statements
					// imply the need for a variable to change in some cases, but
					// not in others
					if(switch_input) begin
						state_next = zero;
						switch_output_next = 1'b0;
					end else begin
						state_next = zero;
						switch_output_next = 1'b0;
					end
			endcase
		end else begin
			state_next = state_reg;
			switch_output_next = switch_output;
		end

	end

endmodule

//module stimulus();
//
//	reg CLK,SWITCH_INPUT;
//	wire SWITCH_OUTPUT;
//
//	debounced_button d(
//		.clk(CLK),
//		.switch_input(SWITCH_INPUT),
//		.switch_output(SWITCH_OUTPUT)
//		);
//
//	initial begin
//		$dumpfile("simulation.vcd");
//		$dumpvars(0,
//			CLK,
//			SWITCH_INPUT,
//			SWITCH_OUTPUT
//			);
//	end
//
//	initial begin
//		#1000 $finish;
//	end
//
//	initial begin
//		CLK = 1'b0;
//		SWITCH_INPUT = 1'b0;
//	end
//
//	always begin
//		#1 CLK = ~CLK;
//	end
//
//	initial begin
//		#10  SWITCH_INPUT = 1'b1;
//		#10  SWITCH_INPUT = 1'b0;
//		#20  SWITCH_INPUT = 1'b1;
//		#5 	 SWITCH_INPUT = 1'b0;
//		#2   SWITCH_INPUT = 1'b1;
//		#10  SWITCH_INPUT = 1'b0;
//		#4 	 SWITCH_INPUT = 1'b1;
//		#100 SWITCH_INPUT = 1'b0;
//		#10  SWITCH_INPUT = 1'b1;
//		#5 	 SWITCH_INPUT = 1'b0;
//	end
//
//endmodule
//
