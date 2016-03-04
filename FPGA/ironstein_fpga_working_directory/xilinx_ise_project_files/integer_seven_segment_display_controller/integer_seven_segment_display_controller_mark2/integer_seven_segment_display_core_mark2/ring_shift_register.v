module ring_shift_register #(
		parameter N = 3,
		parameter INITIAL_VALUE = 1
	)(
		input wire clk,
		output wire [N-1:0] parallel_out
	);


	// -------- next state logic ------------
	wire [N-1:0] data_next;
	assign data_next = {data[0],data[N-1:1]};
	// ---------------------------------------

	// ----------- register - memory ---------
	reg [N-1:0] data = INITIAL_VALUE;
	always @(posedge(clk)) begin
		data = data_next;
	end
	//----------------------------------------

	// ---------- output logic ---------------
	assign parallel_out = data;
	// ---------------------------------------

endmodule

// module stimulus();
	
// 	wire [2:0] PARALLEL_OUT;
// 	reg CLK;

// 	localparam N = 3;

// 	shift_register #(.N(N),.INITIAL_VALUE(1)) 
// 	sr1(
// 		.clk(CLK),
// 		.parallel_out(PARALLEL_OUT)
// 	); 

// 	initial begin
// 		$dumpfile("simulation.vcd");
// 		$dumpvars(0,CLK,PARALLEL_OUT);
// 	end

// 	initial begin
// 		CLK = 1'b0;
// 	end

// 	always 
// 		#1 CLK = ~ CLK;

// 	initial 
// 		#20 $finish;
// endmodule