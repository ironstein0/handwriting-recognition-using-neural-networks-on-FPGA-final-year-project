module ring_shift_register #(
		parameter N = 3,
		parameter INITIAL_VALUE = 1
	)(
		input wire clk,
		input wire reset,
		output wire [N-1:0] parallel_out
	);

	// signal declarations
	reg [N-1:0] data = INITIAL_VALUE;
	wire [N-1:0] data_next;

	// state updation logic
	always @(posedge(clk),posedge(reset)) begin
		if(reset) begin
			data = INITIAL_VALUE;
		end else begin
			data = data_next;
		end
	end
	

	// next state logic 
	assign data_next = {data[0],data[N-1:1]};

	// output logic
	assign parallel_out = data;

endmodule

// module stimulus();
	
// 	wire [2:0] PARALLEL_OUT;
// 	reg CLK,RESET;

// 	localparam N = 3;

// 	ring_shift_register #(.N(N),.INITIAL_VALUE(1)) 
// 	sr1(
// 		.clk(CLK),
// 		.parallel_out(PARALLEL_OUT),
// 		.reset(RESET)
// 	); 

// 	initial begin
// 		$dumpfile("simulation.vcd");
// 		$dumpvars(0,
// 			CLK,
// 			PARALLEL_OUT,
// 			RESET
// 		);
// 	end

// 	initial begin
// 		CLK = 1'b0;
// 		RESET = 1'b0;
// 	end

// 	always 
// 		#1 CLK = ~ CLK;

// 	initial begin
// 		#20 RESET = 1'b1;
// 		#10 RESET = 1'b0;
// 	end

// 	initial 
// 		#50 $finish;
// endmodule