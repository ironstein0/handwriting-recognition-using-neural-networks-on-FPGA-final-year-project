`include "uart_core/uart_core.v"
`include "utils/reset_controller.v"
`include "utils/mac_module.v"

module mac_module_test (
	// standard signals
   input wire CLK,
   input wire RESET_SWITCH,
   output wire RESET,
   // transmitter related signals
   output wire TX,
   // receiver related signals
   input wire RX,
   output wire RX_DONE_TICK
   );

   // local variables
		// transmitter related signals   
		reg TX_START_TRANSMISSION;
		wire TX_BUSY;
		reg [7:0] TX_DATA_IN;
		// receiver related signals
		wire [7:0] RX_DATA_OUT;
		// dsp_module
		reg [17:0] DATA_A, DATA_B;
		wire [47:0] DATA_P;
		reg A_VALID;
		wire B_VALID;
		// testing_related_local_modules
		reg [2:0] register_count ;
		reg b_valid_pulse_generator;

   // module instantiations
      uart_core u(
         .clk(CLK),
         .reset(RESET),
         .rx_done_tick(RX_DONE_TICK),
         .tx_start_transmission(TX_START_TRANSMISSION),
         .tx_busy(TX_BUSY),
         .rx(RX),
         .rx_data_out(RX_DATA_OUT),
         .tx(TX),
         .tx_data_in(TX_DATA_IN)
         );
      
      reset_controller r(
         .clk(CLK),
         .reset(RESET),
         .switch_input(RESET_SWITCH)
         );

      mac_module m(
         .clk(CLK),
         .reset(RESET),
         .data_a(DATA_A),
         .data_b(DATA_B),
         .data_p(DATA_P),
         .a_valid(A_VALID),
         .b_valid(B_VALID)
         );

      pulse_generator #(.PULSE_WIDTH(32'd1))
         p2(
         .clk(clk),
         .generate_pulse(b_valid_pulse_generator), // pulse generator
         .pulse(B_VALID) // generates a PULSE on B_VALID
      );

   initial begin
      register_count = 0;
      DATA_A = 0;
      DATA_B = 0;
      A_VALID = 0;
   end

	always @ (posedge clk or posedge RX_DONE_TICK) begin
		if(RX_DONE_TICK == 1) begin
	      	if(register_count[0] == 0) begin
				DATA_A = RX_DATA_OUT;
				A_VALID = 1;
				register_count = register_count + 1;
			end // if(register_count == 0)
			else begin
				if(register_count[0] == 1) begin
					DATA_B = RX_DATA_OUT;
					b_valid_pulse_generator = ~b_valid_pulse_generator;
					register_count = register_count + 1;
				end // if(register_count == 1)
	      	end // else
	   	end // if(RX_DONE_TICK == 1)

		if(register_count == 6) begin
			A_VALID = 0;
			TX_DATA_IN = DATA_P;
			TX_START_TRANSMISSION = ~TX_START_TRANSMISSION;
			register_count = 0;
		end // if(register_count == 2)

   end // always @ (posedge clk)

	// always @(posedge clk or posedge RX_DONE_TICK) begin
	// 	if((register_count == 0) & RX_DONE_TICK = 1) begin
	// 		DATA_A = RX_DATA_OUT;
	// 		A_VALID = 1;
	// 		register_count = 1;
	// 	end // if(register_count == 0)
	// end // always @(posedge clk or posedge RX_DONE_TICK)

endmodule // module synthesis_stimulus