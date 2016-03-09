`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:19 03/08/2016 
// Design Name: 
// Module Name:    dsp_module 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
// 
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
// 
//////////////////////////////////////////////////////////////////////////////////
module dsp_module(
   input wire clk,
   input wire reset,   //asynchronous
   input wire [17:0] data_a,data_b,data_d,
   input wire a_valid,b_valid,c_valid,d_valid,
   output wire p_ready, m_ready,
   input wire [47:0] data_c,
   output wire [47:0] data_p,
   output wire [35:0] data_m,
   output wire [17:0] bcout
    );
   
   reg RESET;
   reg clock_enable;
   reg [47:0] PCIN;
   reg [7:0] OPMODE;
   reg CEA,CEB,CEC,CECARRYIN,CED,CEM,CEOPMODE,CEP;
   reg RSTA,RSTB,RSTC,RSTD,RSTM,RSTP,RSTOPMODE,RSTCARRYIN;
   
   wire valid_inputs;

   assign valid_inputs = a_valid & b_valid;

	// DSP48A1: 48-bit Multi-Functional Arithmetic Block
   //          Spartan-6
   // Xilinx HDL Language Template, version 14.7
	
   DSP48A1 #(
      .A0REG(0),              // First stage A input pipeline register (0/1)
      .A1REG(1),              // Second stage A input pipeline register (0/1)
      .B0REG(0),              // First stage B input pipeline register (0/1)
      .B1REG(1),              // Second stage B input pipeline register (0/1)
      .CARRYINREG(0),         // CARRYIN input pipeline register (0/1)
      .CARRYINSEL("OPMODE5"), // Specify carry-in source, "CARRYIN" or "OPMODE5" 
      .CARRYOUTREG(0),        // CARRYOUT output pipeline register (0/1)
      .CREG(0),               // C input pipeline register (0/1)
      .DREG(0),               // D pre-adder input pipeline register (0/1)
      .MREG(1),               // M pipeline register (0/1)
      .OPMODEREG(1),          // Enable=1/disable=0 OPMODE input pipeline registers
      .PREG(1),               // P output pipeline register (0/1)
      .RSTTYPE("ASYNC")        // Specify reset type, "SYNC" or "ASYNC" 
   )
   DSP48A1_inst (
      // Cascade Ports: 18-bit (each) output: Ports to cascade from one DSP48 to another
         // .BCOUT(bcout),           // 18-bit output: B port cascade output                                               UNCONNECTED
         // .PCOUT(PCOUT),           // 48-bit output: P cascade output (if used, connect to PCIN of another DSP48A1)      UNCONNECTED
      // Data Ports: 1-bit (each) output: Data input and output ports
         // .CARRYOUT(CARRYOUT),     // 1-bit output: carry output (if used, connect to CARRYIN pin of another             UNCONNECTED
                                  // DSP48A1)

         // .CARRYOUTF(CARRYOUTF),   // 1-bit output: fabric carry output                                                  UNCONNECTED
         // .M(data_m),                   // 36-bit output: fabric multiplier data output                                  UNCONNECTED
         .P(data_p),                   // 48-bit output: data output                                                       OUTPUT
      // Cascade Ports: 48-bit (each) input: Ports to cascade from one DSP48 to another
         .PCIN(48'b0),             // 48-bit input: P cascade input (if used, connect to PCOUT of another DSP48A1)         PRE-DEFINED
      // Control Input Ports: 1-bit (each) input: Clocking and operation mode
         .CLK(clk),               // 1-bit input: clock Input                                                              INPUT
         .OPMODE(OPMODE),         // 8-bit input: operation mode Input                                                     DEFINED
      // Data Ports: 18-bit (each) input: Data input and output ports
         .A(data_a),                   // 18-bit input: A data Input                                                       INPUT
         .B(data_b),                   // 18-bit input: B data input (connected to fabric or BCOUT of adjacent DSP48A1)    INPUT
         .C(data_c),                   // 48-bit input: C data input                                                       INPUT
         // .CARRYIN(CARRYIN),       // 1-bit input: carry input signal (if used, connect to CARRYOUT pin of another       UNCONNECTED
                                  // DSP48A1)

         .D(data_d),                   // 18-bit input: B pre-adder data Input                                             INPUT
      // Reset/Clock Enable Input Ports: 1-bit (each) input: Reset and enable input ports
         .CEA(clock_enable),      // 1-bit input: active high clock enable input for A registers                           DEFINED
         .CEB(clock_enable),      // 1-bit input: active high clock enable input for B registers                           DEFINED
         .CEC(1),               // 1-bit input: active high clock enable input for C registers                             PRE-DEFINED
         .CECARRYIN(1),   // 1-bit input: active high clock enable input for CARRYIN registers                             PRE-DEFINED
         .CED(1),               // 1-bit input: active high clock enable input for D registers                             PRE-DEFINED
         .CEM(clock_enable),      // 1-bit input: active high clock enable input for multiplier registers                  DEFINED
         .CEOPMODE(1),     // 1-bit input: active high clock enable input for OPMODE registers                             PRE-DEFINED
         .CEP(clock_enable),      // 1-bit input: active high clock enable input for P registers                           DEFINED
         .RSTA(RESET),            // 1-bit input: reset input for A pipeline registers                                     DEFINED
         .RSTB(RESET),            // 1-bit input: reset input for B pipeline registers                                     DEFINED
         .RSTC(RESET),            // 1-bit input: reset input for C pipeline registers                                     DEFINED
         .RSTCARRYIN(RESET),      // 1-bit input: reset input for CARRYIN pipeline registers                               DEFINED
         .RSTD(RESET),            // 1-bit input: reset input for D pipeline registers                                     DEFINED
         .RSTM(RESET),            // 1-bit input: reset input for M pipeline registers                                     DEFINED
         .RSTOPMODE(RESET),       // 1-bit input: reset input for OPMODE pipeline registers                                DEFINED
         .RSTP(RESET)             // 1-bit input: reset input for P pipeline registers                                     DEFINED
   );
   // End of DSP48A1_inst instantiation
	
   initial begin
      clock_enable <= 0;
      RESET        <= 1;
      OPMODE[1:0]  <= 1;      // Use multiplier product
      OPMODE[3:2]  <= 2;      // Use the P out signal
      OPMODE[4]    <= 0;      // Pre Adder ----> Not Needed
      OPMODE[5]    <= 0;      // Force Carry
      OPMODE[6]    <= 0;      // Pre Adder ----> Add 
      OPMODE[7]    <= 0;      // Post Adder ---> Add
   end //initial	
	
	always @(posedge clk) begin
      if(reset) begin
         RESET = 1;
      end // if(reset)
      else begin
         RESET = 0;
         if(valid_inputs) begin
            clock_enable <= 1;
         end // if(valid_inputs)
         else begin
            clock_enable <= 0;
         end // else(valid_inputs)
      end // else(reset)
	end // always

endmodule // module dsp_module

module testbench();
   reg CLK;
   reg [17:0] DATA_A,DATA_B;
   wire [47:0] DATA_P;
   // wire [35:0] DATA_M;
   // wire [17:0] BCOUT;
   reg A_VALID,B_VALID;

   dsp_module d(
      .clk(CLK),
      .data_a(DATA_A),
      .data_b(DATA_B),
      .data_p(DATA_P),
      // .data_m(DATA_M),
      // .bcout (BCOUT),
      .a_valid(A_VALID),
      .b_valid(B_VALID)
      );

   initial begin
      CLK = 0;
      DATA_A = 0;
      DATA_B = 0;
		A_VALID = 0;
		B_VALID = 0;
   end

   always begin
      #5 CLK = ~ CLK;
   end

   initial begin
      #120 DATA_A = 20;
      DATA_B = 2;
      A_VALID = 1;
      B_VALID = 1;
      #10 A_VALID = 0;
      B_VALID = 0;

      #10 DATA_A = 2;
      DATA_B = 30;
      A_VALID = 1;
      B_VALID = 1;
      #10 A_VALID = 0;
      B_VALID = 0;
      
      #10 DATA_A = 30;
      DATA_B = 3;
      A_VALID = 1;
      B_VALID = 1;
      #10 A_VALID = 0;
      B_VALID = 0;
      
      #10 DATA_A = 9;
      DATA_B = 10;
      A_VALID = 1;
      B_VALID = 1;
      #10 A_VALID = 0;
      B_VALID = 0;
		
		#10 DATA_A = 0;
      DATA_B = 0;
      A_VALID = 1;
      B_VALID = 1;
	end

endmodule // module testbench