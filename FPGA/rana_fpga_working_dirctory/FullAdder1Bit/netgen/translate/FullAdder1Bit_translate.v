////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: FullAdder1Bit_translate.v
// /___/   /\     Timestamp: Thu Jan 28 13:27:23 2016
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/translate -ofmt verilog -sim FullAdder1Bit.ngd FullAdder1Bit_translate.v 
// Device	: 3s100ecp132-4
// Input file	: FullAdder1Bit.ngd
// Output file	: D:\Xilinx_projects\FullAdder1Bit\netgen\translate\FullAdder1Bit_translate.v
// # of Modules	: 1
// Design Name	: FullAdder1Bit
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module FullAdder1Bit (
  Cout, A, B, Sum, Cin
);
  output Cout;
  input A;
  input B;
  output Sum;
  input Cin;
  wire A_IBUF_1;
  wire B_IBUF_3;
  wire Cin_IBUF_5;
  wire Cout_OBUF_7;
  wire Sum_OBUF_9;
  X_LUT3 #(
    .INIT ( 8'hE8 ))
  Cout1 (
    .ADR0(B_IBUF_3),
    .ADR1(Cin_IBUF_5),
    .ADR2(A_IBUF_1),
    .O(Cout_OBUF_7)
  );
  X_LUT3 #(
    .INIT ( 8'h96 ))
  \Mxor_Sum_xo<0>1  (
    .ADR0(A_IBUF_1),
    .ADR1(B_IBUF_3),
    .ADR2(Cin_IBUF_5),
    .O(Sum_OBUF_9)
  );
  X_BUF   A_IBUF (
    .I(A),
    .O(A_IBUF_1)
  );
  X_BUF   B_IBUF (
    .I(B),
    .O(B_IBUF_3)
  );
  X_BUF   Cin_IBUF (
    .I(Cin),
    .O(Cin_IBUF_5)
  );
  X_IPAD   A_8 (
    .PAD(A)
  );
  X_IPAD   B_9 (
    .PAD(B)
  );
  X_IPAD   Cin_10 (
    .PAD(Cin)
  );
  X_OPAD   Cout_11 (
    .PAD(Cout)
  );
  X_OPAD   Sum_12 (
    .PAD(Sum)
  );
  X_OBUF   Cout_OBUF (
    .I(Cout_OBUF_7),
    .O(Cout)
  );
  X_OBUF   Sum_OBUF (
    .I(Sum_OBUF_9),
    .O(Sum)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

