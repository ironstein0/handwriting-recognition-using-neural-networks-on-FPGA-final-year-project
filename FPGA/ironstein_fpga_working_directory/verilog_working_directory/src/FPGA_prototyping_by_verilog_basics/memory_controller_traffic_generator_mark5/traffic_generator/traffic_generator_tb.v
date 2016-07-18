`include "traffic_generator.v"

module test_bench();
	reg clk;
	reg reset;
	reg rx_done_tick;
	reg [7:0] rx_data_out;
	wire tx_start_transmission;
	wire [7:0] tx_data_in;
	reg tx_busy;
	// memory controller block interface signals 
	// command path signals 
	wire cmd_clk;
	wire cmd_en;
	wire [5:0] cmd_bl;
	wire [2:0] cmd_instr;
	wire [29:0] cmd_addr;
	reg cmd_full;
	reg cmd_empty;
	// write datapath signals 
	wire wr_clk;
	wire wr_en;
	wire [31:0] wr_data;
	// output wire wr_mask 
	reg wr_full;
	reg wr_empty;
	reg wr_underrun;
	reg [6:0] wr_count;
	reg wr_error;
	// read datapath signals 
	wire rd_clk;
	wire rd_en;
	reg [31:0] rd_data;
	reg rd_empty;
	reg rd_full;
	reg rd_overflow;
	reg [6:0] rd_count;
	reg rd_error;

	// module instantiation
	traffic_generator traffic_generator_instance1 (
		.clk(clk),
		.reset(reset),
		.rx_done_tick(rx_done_tick),
		.rx_data_out(rx_data_out),
		.tx_start_transmission(tx_start_transmission),
		.tx_data_in(tx_data_in),
		.tx_busy(tx_busy),
		// memory controller block interface signals 
		// command path signals 
		.cmd_clk(cmd_clk),
		.cmd_en(cmd_en),
		.cmd_bl(cmd_bl),
		.cmd_instr(cmd_instr),
		.cmd_addr(cmd_addr),
		.cmd_full(cmd_full),
		.cmd_empty(cmd_empty),
		// write datapath signals 
		.wr_clk(wr_clk),
		.wr_en(wr_en),
		.wr_data(wr_data),
		// output wire wr_mask 
		.wr_full(wr_full),
		.wr_empty(wr_empty),
		.wr_underrun(wr_underrun),
		.wr_count(wr_count),
		.wr_error(wr_error),
		// read datapath signals 
		.rd_clk(rd_clk),
		.rd_en(rd_en),
		.rd_data(rd_data),
		.rd_empty(rd_empty),
		.rd_full(rd_full),
		.rd_overflow(rd_overflow),
		.rd_count(rd_count),
		.rd_error(rd_error)
	);

	initial begin
		$dumpfile("simulation.vcd");
		$dumpvars(0,
			clk,
			reset,
			rx_done_tick,
			rx_data_out,
			tx_start_transmission,
			tx_data_in,
			tx_busy,
			// memory controller block interface signals 
			// command path signals 
			cmd_clk,
			cmd_en,
			cmd_bl,
			cmd_instr,
			cmd_addr,
			cmd_full,
			cmd_empty,
			// write datapath signals 
			wr_clk,
			wr_en,
			wr_data,
			// output wire wr_mask 
			wr_full,
			wr_empty,
			wr_underrun,
			wr_count,
			wr_error,
			// read datapath signals 
			rd_clk,
			rd_en,
			rd_data,
			rd_empty,
			rd_full,
			rd_overflow,
			rd_count,
			rd_error
		);
	end

	initial begin
		// initializing registers
		clk = 0;
		reset = 0;
		rx_done_tick = 0;
		rx_data_out = 0;
		tx_busy = 0;
		cmd_full = 0;
		cmd_empty = 0;
		wr_full = 0;
		wr_empty = 0;
		wr_underrun = 0;
		wr_count = 0;
		wr_error = 0;
		rd_data = 0;
		rd_empty = 0;
		rd_full = 0;
		rd_overflow = 0;
		rd_count = 0;
		rd_error = 0;

	end

	always begin
		#1 clk = ~ clk;
	end

	initial begin
		#10 reset <= 1;
		#2 reset <= 0;
	end

	reg [7:0] i;
	initial begin
		#30 rx_data_out <= 255;
		@(posedge(clk));
		rx_done_tick <= 1;
		#2 rx_done_tick <= 0;

		for(i=1;i<=4;i++) begin
			#29 rx_data_out <= i;
			@(posedge(clk));
			rx_done_tick <= 1;
			#2 rx_done_tick <= 0;
		end

		for(i=2;i<=4;i++) begin
			#29 rx_data_out <= i;
			@(posedge(clk));
			rx_done_tick <= 1;
			#2 rx_done_tick <= 0;
		end
		
		#100;
		@(posedge(clk));
	end

	initial begin
		#1000000 $finish;
	end

endmodule