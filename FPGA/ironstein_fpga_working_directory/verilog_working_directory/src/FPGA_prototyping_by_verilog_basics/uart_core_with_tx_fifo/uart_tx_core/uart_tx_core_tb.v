`include "uart_tx_core.v"

module test_bench();
						// control signals 
	reg clk;
	reg reset;
	reg start_transmission;
	wire busy;
	// data signals 
	reg [7:0] data_in;
	wire tx;

	// module instantiation
	uart_tx_core
 		uart_tx_core_instance1 (
			// control signals 
			.clk(clk),
			.reset(reset),
			.start_transmission(start_transmission),
			.busy(busy),
			// data signals 
			.data_in(data_in),
			.tx(tx)
		);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			// control signals 
			clk,
			reset,
			start_transmission,
			busy,
			// data signals 
			data_in,
			tx
		);
	end

	initial begin
		// initializing registers
		clk = 0;
		reset = 0;
		start_transmission = 0;
		data_in = 0;

	end

	initial begin 
		#10 reset <= 1;
		#10 reset <= 0;
	end
	
	reg [7:0] i = 0;
	
	initial begin
		#1;
		#150000;
		@(posedge(clk));
		data_in <= 10;
		start_transmission <= ~ start_transmission;
		#150000;
		@(posedge(clk));
		data_in <= 13;
		start_transmission <= ~ start_transmission;
		@(posedge(clk));
		data_in <= 14;
		start_transmission <= ~ start_transmission;
		
	end
	
	always begin
		#1 clk <= ~ clk;
	end
	
	initial begin
		#1000000 $finish;
	end

endmodule