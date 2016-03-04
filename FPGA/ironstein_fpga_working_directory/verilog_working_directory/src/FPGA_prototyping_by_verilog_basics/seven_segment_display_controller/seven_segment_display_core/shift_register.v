module shift_register #(
		parameter N = 3,
		parameter INITIAL_VALUE = 1
	)(
		input wire clk,signal_in,reset,
		output wire signal_out,
		output wire [N-1:0] out
	);


	// -------- next state logic ------------
	wire [N-1:0] data_next;
	assign data_next = {signal_in,data[N-1:1]};
	// ---------------------------------------

	// ----------- register - memory ---------
	reg [N-1:0] data = INITIAL_VALUE;
	always @(posedge(clk)) begin
		if(reset) 
			data = 0;
		else
			data = data_next;
	end
	//----------------------------------------

	// ---------- output logic ---------------
	assign signal_out = data[0];
	assign out = data;
	// ---------------------------------------

endmodule

// module stimulus();
	
// 	reg SIGNAL_IN,RESET;
// 	wire SIGNAL_OUT;
// 	wire [2:0] OUTPUT;
// 	reg CLK;

// 	localparam N = 3;

// 	shift_register #(.N(N)) sr1(.clk(CLK),.signal_in(SIGNAL_IN),.signal_out(SIGNAL_OUT),.reset(RESET),.out(OUTPUT)); 

// 	initial begin
// 		$dumpfile("simulation.vcd");
// 		$dumpvars(0,CLK,SIGNAL_IN,SIGNAL_OUT,RESET,OUTPUT);
// 	end

// 	initial begin
// 		CLK = 1'b0;
// 		SIGNAL_IN = 1'b1;
// 		RESET = 1'b0;
// 	end

// 	always 
// 		#1 CLK = ~ CLK;

// 	initial 
// 		#20 $finish;
// endmodule