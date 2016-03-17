module fifo #(
	parameter data_size = 4'd8,
	parameter buffer_size = 8'd64
	)(
	// control signals
	input wire clk,
	input wire reset,
	input wire read_data,
	input wire write_data,
	output reg full,
	output reg empty,
	// data signals
	input wire [data_size-1:0] data_input,
	output reg [data_size-1:0] data_output,
	output reg [buffer_size-1:0] fifo_count
	);

	reg [buffer_size-1:0] read_pointer,write_pointer;
	reg [data_size-1:0] fifo_buffer [buffer_size-1:0];
	
	// updating full and empty flags
	always @(fifo_count) begin
		empty = (fifo_count == 0);
		full = (fifo_count == buffer_size);
	end
	
	// upating fifo_count
	always @(posedge(clk),posedge(reset)) begin
		if(reset) begin
			fifo_count <= 0;
		end else begin
			if((!full && write_data) && (!empty && read_data)) begin
				fifo_count <= fifo_count;
			end else if(!full & write_data) begin
				fifo_count <= fifo_count + 1;
			end else if(!empty & read_data) begin
				fifo_count <= fifo_count - 1;
			end else begin
				fifo_count <= fifo_count;
			end
		end
	end
	
	// updating data_output
	always @(posedge(clk),posedge(reset)) begin
		if(reset) begin
			data_output <= 0;
		end else begin
			if(!empty && read_data) begin
				data_output <= fifo_buffer[read_pointer];
			end else begin
				data_output <= data_output;
			end
		end
	end
	
	// updating fifo_buffer
	always @(posedge(clk)) begin
		// buffer need not be changed during reset
		// only the read and write pointers are changed
		if(!full && write_data) begin
			fifo_buffer[write_pointer] <= data_input;
		end else begin
			fifo_buffer[write_pointer] <= fifo_buffer[write_pointer];
		end
	end
	
	// updating write_pointer and read_pointer
	always @(posedge(clk),posedge(reset)) begin
		if(reset) begin
			write_pointer <= 0;
			read_pointer <= 0;
		end else begin
			// updating write_pointer
			if(!full && write_data) begin
				write_pointer <= write_pointer + 1;
			end else begin
				write_pointer <= write_pointer;
			end
			
			// updating read_pointer
			if(!empty && read_data) begin
				read_pointer <= read_pointer + 1;
			end else begin
				read_pointer <= read_pointer;
			end
		end
	end

endmodule



module test_bench();
	reg CLK;
	reg RESET;
	reg [7:0] DATA_INPUT;
	wire [7:0] DATA_OUTPUT;
	reg READ_DATA;
	reg WRITE_DATA;
	wire FULL;
	wire EMPTY;
	wire [3:0] FIFO_COUNT;

	// module instantiations
	fifo #(.buffer_size(3'd4)) f(
		.clk(CLK),
		.reset(RESET),
		.data_input(DATA_INPUT),
		.data_output(DATA_OUTPUT),
		.read_data(READ_DATA),
		.write_data(WRITE_DATA),
		.full(FULL),
		.empty(EMPTY),
		.fifo_count(FIFO_COUNT)
	);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			CLK,
			RESET,
			DATA_INPUT,
			DATA_OUTPUT,
			READ_DATA,
			WRITE_DATA,
			FULL,
			EMPTY
		);
	end

	initial begin
		CLK = 1'b0;
		RESET = 1'b1;
		READ_DATA = 1'b0;
		WRITE_DATA = 1'b0;
		DATA_INPUT = 8'd7;
	end

	always begin 
		#1 CLK = ~ CLK;
	end

	initial begin
		#11 RESET = 1'b0;
		#10 WRITE_DATA = 1'b1;
		#2 WRITE_DATA = 1'b0;
		#2 DATA_INPUT = 8'd6;
		#10 WRITE_DATA = 1'b1;
		#2 WRITE_DATA = 1'b0;
		// read all data (2 bytes) until fifo empty
		#10 READ_DATA = 1'b1;
		#2 READ_DATA = 1'b0;
		#10 READ_DATA = 1'b1;
		#2 READ_DATA = 1'b0;
		// read one more byte to check if fifo_count changes
		#10 READ_DATA = 1'b1;
		#2 READ_DATA = 1'b0;
		// write 4 times until fifo full
		#10 WRITE_DATA = 1'b1;
		#2 WRITE_DATA = 1'b0;
		#10 WRITE_DATA = 1'b1;
		#2 WRITE_DATA = 1'b0;
		#10 WRITE_DATA = 1'b1;
		#2 WRITE_DATA = 1'b0;
		#10 WRITE_DATA = 1'b1;
		#2 WRITE_DATA = 1'b0;
		// write after full to check if fifo_count changes
		#10 WRITE_DATA = 1'b1;
		#2 WRITE_DATA = 1'b0;
		
	end

	initial begin
		#200 $finish;
	end
endmodule