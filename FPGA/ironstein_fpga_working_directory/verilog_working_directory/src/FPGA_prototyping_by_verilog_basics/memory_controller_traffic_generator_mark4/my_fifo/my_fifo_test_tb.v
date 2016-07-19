`include "my_fifo_test.v"

module test_bench();
	// control signals 
	reg clk;
	reg reset;
	reg read_data;
	reg write_data;
	wire full;
	wire empty;
	// data signals 
	reg [7:0] data_input;
	wire [7:0] data_output;
	wire [63:0] fifo_count;
	// test signals 
	wire [63:0] read_pointer_test;
	wire [63:0] write_pointer_test;

	// module instantiation
	fifo fifo_instance1 (
		// control signals 
		.clk(clk),
		.reset(reset),
		.read_data(read_data),
		.write_data(write_data),
		.full(full),
		.empty(empty),
		// data signals 
		.data_input(data_input),
		.data_output(data_output),
		.fifo_count(fifo_count),
		// test signals 
		.read_pointer_test(read_pointer_test),
		.write_pointer_test(write_pointer_test)
	);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			// control signals 
			clk,
			reset,
			read_data,
			write_data,
			full,
			empty,
			// data signals 
			data_input,
			data_output,
			fifo_count,
			// test signals 
			read_pointer_test,
			write_pointer_test
		);
	end

// add stimulus here
	initial begin
		clk = 1'b0;
		reset = 1'b0;
		read_data = 1'b0;
		write_data = 1'b0;
		data_input = 8'd7;
	end

	always begin 
		#1 clk = ~ clk;
	end

	initial begin
		#9 reset <= 1'b1;
		#6 reset <= 1'b0;
		#10 write_data <= 1'b1;
		#2 write_data <= 1'b0;
		#2 data_input <= 8'd6;
		#10 write_data <= 1'b1;
		#2 write_data <= 1'b0;
		// read all data (2 bytes) until fifo empty
		#10 read_data <= 1'b1;
		#2 read_data <= 1'b0;
		#10 read_data <= 1'b1;
		#2 read_data <= 1'b0;
		// read one more byte to check if fifo_count changes
		#10 read_data <= 1'b1;
		#2 read_data <= 1'b0;
		// write 4 times until fifo full
		data_input <= 8'd255;		
		#10 read_data <= 1'b1;
		#2 read_data <= 1'b0;		
		write_data <= 1'b1;
		#2 read_data <= 1'b0;
		write_data <= 1'b0;
		#10 write_data <= 1'b1;
		read_data <= 1'b1;
		#2 write_data <= 1'b0;
		read_data <= 1'b0;		
		#10 write_data <= 1'b1;
		#2 write_data <= 1'b0;
		#10 write_data <= 1'b1;
		#2 write_data <= 1'b0;
		// write after full to check if fifo_count changes
		#10 write_data <= 1'b1;
		#2 write_data <= 1'b0;
		
	end

	initial begin
		#1000 $finish;
	end

endmodule