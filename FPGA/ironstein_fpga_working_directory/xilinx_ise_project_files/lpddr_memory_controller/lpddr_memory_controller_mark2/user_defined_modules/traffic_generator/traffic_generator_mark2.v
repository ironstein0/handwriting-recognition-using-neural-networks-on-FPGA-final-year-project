`include "my_fifo.v"
//`include "pulse_generator.v"

module traffic_generator(
	// control signals
		input wire 							clk,
		input wire 							reset,
	// uart signals
		input wire [7:0] 					rx_data_out,
		output reg [7:0] 					tx_data_in,
		input wire 							rx_done_tick,
		output reg	 						tx_start_transmission,
	// lpddr_memory_controller signals
		// command datapath signals
		output wire 					cmd_clk,					//	wire because driven by assign statement
		output wire	 					cmd_en,					//	wire because driven by output wire in pulse generator
		output reg [2:0] 				cmd_instr,				//	
		output reg [5:0] 				cmd_bl,					//
		output reg [29:0] 			cmd_byte_addr,			//
		input wire 						cmd_empty,				//
		input wire 						cmd_full,				//x
		// write datapath signals
		output wire 					wr_clk,					//	wire because driven by assign statement
		output wire	 					wr_en,					// wire because assigned value as that of fifo_pop
		output reg [3:0] 				wr_mask,					//	
		output wire [31:0] 			wr_data,					//	wire because output of fifo
		input wire 						wr_full,					//
		input wire 						wr_empty,				//x
		input wire [6:0] 				wr_count,				//
		input wire 						wr_underrun,			//x
		input wire 						wr_error,				//x
		// read datapath signals
		output wire 					rd_clk,
		output wire	 					rd_en,
		input wire [31:0] 			rd_data,
		input wire 						rd_full,
		input wire 						rd_empty,
		input wire [6:0] 				rd_count,
		input wire 						rd_overflow,
		input wire 						rd_error
		
	);

	// signal declarations
		reg tx_stop_flag;		// if 1 means stop condition has been transmitted
							// if 0 means start condition has been transmitted

	// module instantiations
		// fifo instantiation
		reg fifo_pop;
		assign wr_en = fifo_pop;
		reg fifo_push;
		wire fifo_full;
		wire fifo_empty;
		wire [31:0] fifo_count;
		wire [31:0] fifo_data_input;	// 32 bits since write datapath FIFO is 32 bits wide
		wire [31:0] fifo_data_output;	// 32 bits since write datapath FIFO is 32 bits wide
		/* 
			change this to add directly 32 bit words to FIFO register
			or else maybe read 4 bytes from the FIFO directly
		*/
		assign fifo_data_input = {24'd0,rx_data_out};	// to make it 32 bits (for NOW)

		fifo #(.data_size(6'd32),.buffer_size(7'd64))
			intermediate_fifo(
				.clk(clk),							//
				.reset(reset),						//
				.read_data(fifo_pop),				//	wr_en
				.write_data(fifo_push),				//	at rx_done_tick
				.full(fifo_full),					//x
				.empty(fifo_empty),					//x
				.data_input(fifo_data_input),		//	rx_data_output
				.data_output(fifo_data_output),		//	wr_data
				.fifo_count(fifo_count)				//x
			);

		// pulse generator instantiation
		reg generate_cmd_en_pulse;

		pulse_generator cmd_en_pulse_generator(
			.clk(clk),
			.generate_pulse(generate_cmd_en_pulse),
			.pulse(cmd_en)
		);

	// command path logic

		assign cmd_clk = clk;
		always @(posedge(clk),posedge(reset)) begin
			if(reset) begin
				cmd_byte_addr = 30'b0;
			end else begin
				cmd_byte_addr = cmd_byte_addr;
			end
		end

		localparam [2:0] 
			COMMAND_WRITE = 					3'b000,
			COMMAND_READ = 						3'b001,
			COMMAND_WRITE_WITH_AUTO_PRECHARGE = 3'b010,
			COMMAND_READ_WITH_AUTO_PRECHARGE = 	3'b011,
			COMMAND_REFRESH = 					3'b100;

		reg write_flag;	// if 1 --> can not write a new command now
						// if 0 --> can write a new command
		/*
			generate_cmd_en_pulse
			write_flag
			cmd_instr
			cmd_bl
		*/
		always @(posedge(clk),posedge(reset)) begin
			if(reset) begin
				generate_cmd_en_pulse = 1'b0;
				cmd_bl = 6'd1;
				cmd_instr = 3'b000;
				write_flag = 1'b0;				
			end else begin
				if(wr_count == 64) begin
					if(cmd_empty && (~write_flag)) begin
						/*
							change to implementation where you can write
							commands until cmd_full becomes high
							(first think what are the implications)
						*/
						cmd_instr = 1'b0;
						cmd_bl = 6'd63;		// translates to 64
						generate_cmd_en_pulse = ~ generate_cmd_en_pulse;
						write_flag = 1'b1;
					end else begin
						cmd_instr = cmd_instr;
						cmd_bl = cmd_bl;
						generate_cmd_en_pulse = generate_cmd_en_pulse;
						write_flag = write_flag;
					end
				end else if(wr_count == 0) begin
					cmd_instr = cmd_instr;
					cmd_bl = cmd_bl;
					generate_cmd_en_pulse = generate_cmd_en_pulse;
					write_flag = 1'b0;
				end
			end
		end

	// write datapath logic

		assign wr_clk = clk;
		assign wr_data = fifo_data_output;	// fifo data size = 32 bits

		/*
			wr_mask
		*/
		always @(posedge(clk),posedge(reset)) begin
			if(reset) begin
				wr_mask = 1'b0;
			end else begin
				wr_mask = wr_mask;
			end
		end

		/*
			fifo_push
		*/
		always @(posedge(clk),posedge(rx_done_tick),posedge(reset)) begin
			if(reset) begin
				fifo_push = 1'b0;
			end else begin
				if(rx_done_tick) begin
					fifo_push = 1'b1;
				end else begin
					fifo_push = 1'b0;
				end
			end
		end

		/*
			fifo_pop / wr_en
		*/
		always @(posedge(clk),negedge(clk),posedge(reset)) begin
			if(reset) begin
				fifo_pop = 1'b0;
			end else begin
				if((!wr_full) && (fifo_count != 0)) begin
					fifo_pop = 1'b1;
				end else begin
					fifo_pop = 1'b0;
				end
			end
		end

		/*
			tx_stop_flag
			tx_start_transmission
			tx_data_in
		*/
		localparam [7:0]
			TX_START_TRANSMISSION_BYTE = 8'b1,
			TX_STOP_TRANSMISSION_BYTE = 8'd98;

		always @(posedge(clk),posedge(reset)) begin
			if(reset) begin
				tx_stop_flag = 1'b0;
				tx_start_transmission = 1'b0;
				tx_data_in = 8'b0;
			end else begin
				if(wr_full) begin
					if(tx_stop_flag == 1'b1) begin
						// stop signal already sent
						tx_data_in = tx_data_in;
						tx_start_transmission = tx_start_transmission;
						tx_stop_flag = tx_stop_flag;
					end else begin
						// transmit stop signal
						tx_data_in = TX_STOP_TRANSMISSION_BYTE;
						tx_start_transmission = ~ tx_start_transmission;
						tx_stop_flag = 1'b1;
					end
				end else begin
					if(tx_stop_flag == 1'b1) begin
						// transmit start signal
						tx_data_in = TX_START_TRANSMISSION_BYTE;
						tx_start_transmission = ~ tx_start_transmission;
						tx_stop_flag = 1'b0;
					end else begin
						// start signal already sent
						tx_data_in = tx_data_in;
						tx_start_transmission = tx_start_transmission;
						tx_stop_flag = tx_stop_flag;
					end
				end
			end
		end

endmodule

//module test_bench();
//	// control signals
//		reg CLK;
//		reg RESET;
//	// uart signals
//		reg RX_DONE_TICK;
//		reg [7:0] RX_DATA_OUT;
//		wire TX_START_TRANSMISSION;
//		wire [7:0] TX_DATA_IN;
//	// lpddr_memory_controller signals
//		// command path signals
//		wire CMD_CLK;
//		wire CMD_EN;
//		wire [2:0] CMD_INSTR;
//		wire [5:0] CMD_BL;
//		wire [29:0] CMD_BYTE_ADDR;
//		reg CMD_EMPTY;
//		reg CMD_FULL;
//		// write datapath signals
//		wire WR_CLK;
//		wire WR_EN;
//		wire [3:0] WR_MASK;
//		wire [31:0] WR_DATA;
//		reg WR_FULL;
//		reg WR_EMPTY;
//		reg [6:0] WR_COUNT;
//		reg WR_UNDERRUN;
//		reg WR_ERROR;
//		// read datapath signals
//		wire RD_CLK;
//		wire RD_EN;
//		reg [31:0] RD_DATA;
//		reg RD_FULL;
//		reg RD_EMPTY;
//		reg [6:0] RD_COUNT;
//		reg RD_OVERFLOW;
//		reg RD_ERROR;
//	
//	// module instantiation
//	traffic_generator traffic_generator_instance1(
//		.clk(CLK),
//		.reset(RESET),
//		// uart
//		.rx_done_tick(RX_DONE_TICK),
//		.rx_data_out(RX_DATA_OUT),
//		.tx_start_transmission(TX_START_TRANSMISSION),
//		.tx_data_in(TX_DATA_IN),
//		// command path signals
//		.cmd_clk(CMD_CLK),
//		.cmd_en(CMD_EN),
//		.cmd_instr(CMD_INSTR),
//		.cmd_bl(CMD_BL),
//		.cmd_byte_addr(CMD_BYTE_ADDR),
//		.cmd_empty(CMD_EMPTY),
//		.cmd_full(CMD_FULL),
//		// write datapath signals
//		.wr_clk(WR_CLK),
//		.wr_en(WR_EN),
//		.wr_mask(WR_MASK),
//		.wr_data(WR_DATA),
//		.wr_full(WR_FULL),
//		.wr_empty(WR_EMPTY),
//		.wr_count(WR_COUNT),
//		.wr_underrun(WR_UNDERRUN),
//		.wr_error(WR_ERROR),
//		// read datapath signals
//		.rd_clk(RD_CLK),
//		.rd_en(RD_EN),
//		.rd_data(RD_DATA),
//		.rd_full(RD_FULL),
//		.rd_empty(RD_EMPTY),
//		.rd_count(RD_COUNT),
//		.rd_overflow(RD_OVERFLOW),
//		.rd_error(RD_ERROR)
//	);
//
//	/*
//		ALL SIGNALS
//	*/
//		initial begin
//			$dumpfile("simulation.vcd");
//			$dumpvars(0,
//				// control signals
//				CLK,
//				RESET,
//				// uart signals
//				RX_DONE_TICK,
//				RX_DATA_OUT,
//				TX_START_TRANSMISSION,
//				TX_DATA_IN,
//				// lpddr_memory_controller signals
//					// command path signals
//					CMD_CLK,
//					CMD_EN,
//					CMD_INSTR,
//					CMD_BL,
//					CMD_BYTE_ADDR,
//					CMD_EMPTY,
//					CMD_FULL,
//					// write datapath signals
//					WR_CLK,
//					WR_EN,
//					WR_MASK,
//					WR_DATA,
//					WR_FULL,
//					WR_EMPTY,
//					WR_COUNT,
//					WR_UNDERRUN,
//					WR_ERROR,
//					// read datapath signals
//					RD_CLK,
//					RD_EN,
//					RD_DATA,
//					RD_FULL,
//					RD_EMPTY,
//					RD_COUNT,
//					RD_OVERFLOW,
//					RD_ERROR
//			);
//		end
//
//	/*
//		FOR CHECKING COMMAND PATH LOGIC
//	*/
//		// initial begin
//		// 	$dumpfile("simulation.vcd");
//		// 	$dumpvars(0,
//		// 		// control signals
//		// 		CLK,
//		// 		RESET,
//		// 		// command path signals
//		// 		CMD_CLK,
//		// 		CMD_EN,
//		// 		CMD_INSTR,
//		// 		CMD_BL,
//		// 		CMD_BYTE_ADDR,
//		// 		CMD_EMPTY,
//		// 		CMD_FULL,
//		// 		// write datapath signals
//		// 		WR_COUNT,
//		// 		// read datapath signals
//		// 	);
//		// end
//
//	/*
//		FOR CHECKING WRITE DATAPATH LOGIC
//	*/
//		// initial begin
//		// 	$dumpfile("simulation.vcd");
//		// 	$dumpvars(0,
//		// 		// control signals
//		// 		CLK,
//		// 		RESET,
//		// 		// uart signals
//		// 		RX_DONE_TICK,
//		// 		RX_DATA_OUT,
//		// 		TX_START_TRANSMISSION,
//		// 		TX_DATA_IN,
//		// 		// lpddr_memory_controller signals
//		// 			// command path signals
//		// 			// write datapath signals
//		// 			WR_CLK,
//		// 			WR_EN,
//		// 			WR_MASK,
//		// 			WR_DATA,
//		// 			WR_FULL,
//		// 			WR_EMPTY,
//		// 			WR_COUNT,
//		// 			WR_UNDERRUN,
//		// 			WR_ERROR,
//		// 			// read datapath signals
//		// 	);
//		// end
//
//	// clk
//	initial begin
//		CLK = 1'b0;
//	end
//	always begin
//		#1 CLK = ~ CLK;
//	end
//
//
//	// reset
//	initial begin
//		RESET = 1'b0;
//		#10 RESET = 1'b1;
//		#2 RESET = 1'b0;	
//	end
//
//	// wr_full
//	initial begin
//		WR_FULL = 1'b0;
//		#50 WR_FULL = 1'b1;
//		#30 WR_FULL = 1'b0;
//		#50 WR_FULL = 1'b1;
//		#800 WR_FULL = 1'b0;
//	end
//
//	// wr_count
//	initial begin
//		#1000 WR_COUNT = 64;
//		#10 WR_COUNT = 10;
//		#10 WR_COUNT = 64;
//		#10 WR_COUNT = 0;
//		#10 CMD_EMPTY = 1'b0;
//		#10 WR_COUNT = 64;
//		#10 CMD_EMPTY = 1'b1;
//	end
//
//	initial begin
//		CMD_FULL = 1'b0;
//		CMD_EMPTY = 1'b1;
//		WR_EMPTY = 1'b0;
//	end
//
//	reg i = 1'b0;
//	initial begin
//		#1 RX_DATA_OUT = 0;
//		for(i=0;i<100;i++) begin
//			#10;
//			RX_DATA_OUT = RX_DATA_OUT + 1;
//			RX_DONE_TICK = 1'b1;
//			#2 RX_DONE_TICK = 1'b0;
//		end
//	end
//
//	initial begin
//		#2000 $finish;
//	end
//
//endmodule