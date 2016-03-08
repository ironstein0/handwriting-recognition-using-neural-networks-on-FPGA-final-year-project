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
   input wire [17:0] data_a,data_b,data_d,
   input wire [47:0] data_c,
   output wire [47:0] data_p,
   output wire [35:0] data_m,
   output wire [17:0] bcout
    );

   reg [47:0] PCIN;
   reg [7:0] OPMODE;
   reg CEA,CEB,CEC,CECARRYIN,CED,CEM,CEOPMODE,CEP;
   reg RSTA,RSTB,RSTC,RSTD,RSTM,RSTP,RSTOPMODE,RSTCARRYIN;
   
	reg [47:0] reg_c_0,reg_c_1;
	
	// DSP48A1: 48-bit Multi-Functional Arithmetic Block
   //          Spartan-6
   // Xilinx HDL Language Template, version 14.7
	
   DSP48A1 #(
      .A0REG(1),              // First stage A input pipeline register (0/1)
      .A1REG(1),              // Second stage A input pipeline register (0/1)
      .B0REG(1),              // First stage B input pipeline register (0/1)
      .B1REG(1),              // Second stage B input pipeline register (0/1)
      .CARRYINREG(0),         // CARRYIN input pipeline register (0/1)
      .CARRYINSEL("OPMODE5"), // Specify carry-in source, "CARRYIN" or "OPMODE5" 
      .CARRYOUTREG(0),        // CARRYOUT output pipeline register (0/1)
      .CREG(1),               // C input pipeline register (0/1)
      .DREG(1),               // D pre-adder input pipeline register (0/1)
      .MREG(1),               // M pipeline register (0/1)
      .OPMODEREG(1),          // Enable=1/disable=0 OPMODE input pipeline registers
      .PREG(1),               // P output pipeline register (0/1)
      .RSTTYPE("ASYNC")        // Specify reset type, "SYNC" or "ASYNC" 
   )
   DSP48A1_inst (
      // Cascade Ports: 18-bit (each) output: Ports to cascade from one DSP48 to another
         .BCOUT(bcout),           // 18-bit output: B port cascade output                                                  UNCONNECTED
         // .PCOUT(PCOUT),           // 48-bit output: P cascade output (if used, connect to PCIN of another DSP48A1)      UNCONNECTED
      // Data Ports: 1-bit (each) output: Data input and output ports
         // .CARRYOUT(CARRYOUT),     // 1-bit output: carry output (if used, connect to CARRYIN pin of another             UNCONNECTED
                                  // DSP48A1)

         // .CARRYOUTF(CARRYOUTF),   // 1-bit output: fabric carry output                                                  UNCONNECTED
         .M(data_m),                   // 36-bit output: fabric multiplier data output                                     UNCONNECTED
         .P(data_p),                   // 48-bit output: data output                                                       OUTPUT
      // Cascade Ports: 48-bit (each) input: Ports to cascade from one DSP48 to another
         .PCIN(PCIN),             // 48-bit input: P cascade input (if used, connect to PCOUT of another DSP48A1)          TIED TO ZEROS
      // Control Input Ports: 1-bit (each) input: Clocking and operation mode
         .CLK(clk),               // 1-bit input: clock Input                                                              INPUT
         .OPMODE(OPMODE),         // 8-bit input: operation mode Input                                                     DEFINED
      // Data Ports: 18-bit (each) input: Data input and output ports
         .A(data_a),                   // 18-bit input: A data Input                                                       INPUT
         .B(data_b),                   // 18-bit input: B data input (connected to fabric or BCOUT of adjacent DSP48A1)    INPUT
         .C(reg_c_1),                   // 48-bit input: C data input                                                       INPUT
         // .CARRYIN(CARRYIN),       // 1-bit input: carry input signal (if used, connect to CARRYOUT pin of another       UNCONNECTED
                                  // DSP48A1)

         .D(data_d),                   // 18-bit input: B pre-adder data Input                                             INPUT
      // Reset/Clock Enable Input Ports: 1-bit (each) input: Reset and enable input ports
         .CEA(CEA),               // 1-bit input: active high clock enable input for A registers                           DEFINED
         .CEB(CEB),               // 1-bit input: active high clock enable input for B registers                           DEFINED
         .CEC(CEC),               // 1-bit input: active high clock enable input for C registers                           DEFINED
         .CECARRYIN(CECARRYIN),   // 1-bit input: active high clock enable input for CARRYIN registers                     DEFINED
         .CED(CED),               // 1-bit input: active high clock enable input for D registers                           DEFINED
         .CEM(CEM),               // 1-bit input: active high clock enable input for multiplier registers                  DEFINED
         .CEOPMODE(CEOPMODE),     // 1-bit input: active high clock enable input for OPMODE registers                      DEFINED
         .CEP(CEP),               // 1-bit input: active high clock enable input for P registers                           DEFINED
         .RSTA(RSTA),             // 1-bit input: reset input for A pipeline registers                                     DEFINED
         .RSTB(RSTB),             // 1-bit input: reset input for B pipeline registers                                     DEFINED
         .RSTC(RSTC),             // 1-bit input: reset input for C pipeline registers                                     DEFINED
         .RSTCARRYIN(RSTCARRYIN), // 1-bit input: reset input for CARRYIN pipeline registers                               DEFINED
         .RSTD(RSTD),             // 1-bit input: reset input for D pipeline registers                                     DEFINED
         .RSTM(RSTM),             // 1-bit input: reset input for M pipeline registers                                     DEFINED
         .RSTOPMODE(RSTOPMODE),   // 1-bit input: reset input for OPMODE pipeline registers                                DEFINED
         .RSTP(RSTP)              // 1-bit input: reset input for P pipeline registers                                     DEFINED
   );
   // End of DSP48A1_inst instantiation
	
   initial begin
      reg_c_0     <= 0;
      reg_c_1     <= 0;
      PCIN        <= 48'b0;
      OPMODE[1:0] <= 1;  	  // Use multiplier product
      OPMODE[3:2] <= 3;  	  // Use the P out signal
      OPMODE[4]   <= 1; 	  // Pre Adder ----> Needed
      OPMODE[5]   <= 0;      // Force Carry
      OPMODE[6]   <= 0;      // Pre Adder ----> Add 
      OPMODE[7]   <= 0;      // Post Adder ---> Add
      CEA         <= 1;
      CEB         <= 1;
      CEC         <= 1;
      CECARRYIN   <= 1;
      CED         <= 1;
      CEM         <= 1; 
      CEOPMODE    <= 1;
      CEP         <= 1;
      RSTA        <= 0;
      RSTB        <= 0;
      RSTC        <= 0;
      RSTD        <= 0;
      RSTM        <= 0;
      RSTP        <= 0;
      RSTOPMODE   <= 0;
      RSTCARRYIN  <= 0;
   end //initial	
	
	always @(posedge clk) begin
		reg_c_1 <= reg_c_0;
      reg_c_0 <= data_c;
	end
endmodule // module dsp_module

module testbench();
   reg CLK;
   reg [17:0] DATA_A,DATA_B,DATA_D;
   reg [47:0] DATA_C;
   wire [47:0] DATA_P;
   wire [35:0] DATA_M;
   wire [17:0] BCOUT;

   dsp_module d(
      .clk(CLK),
      .data_a(DATA_A),
      .data_b(DATA_B),
      .data_c(DATA_C),
      .data_d(DATA_D),
      .data_p(DATA_P),
      .data_m(DATA_M),
      .bcout (BCOUT)
      );

   initial begin
      CLK = 0;
      DATA_A = 0;
      DATA_B = 0;
      DATA_C = 0;
      DATA_D = 0;
   end

   always begin
      #5 CLK = ~ CLK;
   end

   initial begin
      #120 DATA_A = 20;
      DATA_B = 2;
      DATA_D = 3;
      DATA_C = 15;
      #80 DATA_A = 2;
      DATA_B = 30;
      DATA_D = 5;
      DATA_C = 35;
	end

endmodule // module testbench