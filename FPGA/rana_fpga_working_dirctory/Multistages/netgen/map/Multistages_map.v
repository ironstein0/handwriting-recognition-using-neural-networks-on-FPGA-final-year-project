////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: Multistages_map.v
// /___/   /\     Timestamp: Fri Nov 06 00:12:03 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -s 4 -pcf Multistages.pcf -sdf_anno true -sdf_path netgen/map -insert_glbl true -w -dir netgen/map -ofmt verilog -sim Multistages_map.ncd Multistages_map.v 
// Device	: 3s100ecp132-4 (PRODUCTION 1.27 2013-10-13)
// Input file	: Multistages_map.ncd
// Output file	: D:\Xilinx_projects\Multistages\netgen\map\Multistages_map.v
// # of Modules	: 1
// Design Name	: Multistages
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

module Multistages (
  carry, sum, a, b
);
  output carry;
  output [0 : 3] sum;
  input [0 : 3] a;
  input [0 : 3] b;
  wire a_0_IBUF_73;
  wire a_1_IBUF_74;
  wire a_2_IBUF_75;
  wire a_3_IBUF_76;
  wire b_0_IBUF_77;
  wire b_1_IBUF_78;
  wire b_2_IBUF_79;
  wire b_3_IBUF_80;
  wire ripple2;
  wire ripple1;
  wire \sum<0>/O ;
  wire \carry/O ;
  wire \sum<1>/O ;
  wire \b<3>/INBUF ;
  wire \a<1>/INBUF ;
  wire sum_3_OBUF_204;
  wire \b<1>/INBUF ;
  wire \b<0>/INBUF ;
  wire \a<0>/INBUF ;
  wire \sum<3>/O ;
  wire \b<2>/INBUF ;
  wire carry_OBUF_192;
  wire ripple2_pack_1;
  wire \sum<2>/O ;
  wire \a<2>/INBUF ;
  wire \a<3>/INBUF ;
  wire sum_2_OBUF_228;
  wire ripple1_pack_1;
  wire sum_1_OBUF_252;
  wire sum_0_OBUF_245;
  wire VCC;
  initial $sdf_annotate("netgen/map/multistages_map.sdf");
  X_OPAD   \sum<0>/PAD  (
    .PAD(sum[0])
  );
  X_OBUF   sum_0_OBUF (
    .I(\sum<0>/O ),
    .O(sum[0])
  );
  X_OPAD   \carry/PAD  (
    .PAD(carry)
  );
  X_OBUF   carry_OBUF (
    .I(\carry/O ),
    .O(carry)
  );
  X_OPAD   \sum<1>/PAD  (
    .PAD(sum[1])
  );
  X_OBUF   sum_1_OBUF (
    .I(\sum<1>/O ),
    .O(sum[1])
  );
  X_IPAD   \b<3>/PAD  (
    .PAD(b[3])
  );
  X_BUF   b_3_IBUF (
    .I(b[3]),
    .O(\b<3>/INBUF )
  );
  X_IPAD   \a<1>/PAD  (
    .PAD(a[1])
  );
  X_BUF   a_1_IBUF (
    .I(a[1]),
    .O(\a<1>/INBUF )
  );
  X_IPAD   \b<1>/PAD  (
    .PAD(b[1])
  );
  X_BUF   b_1_IBUF (
    .I(b[1]),
    .O(\b<1>/INBUF )
  );
  X_IPAD   \b<0>/PAD  (
    .PAD(b[0])
  );
  X_BUF   b_0_IBUF (
    .I(b[0]),
    .O(\b<0>/INBUF )
  );
  X_IPAD   \a<0>/PAD  (
    .PAD(a[0])
  );
  X_BUF   a_0_IBUF (
    .I(a[0]),
    .O(\a<0>/INBUF )
  );
  X_OPAD   \sum<3>/PAD  (
    .PAD(sum[3])
  );
  X_OBUF   sum_3_OBUF (
    .I(\sum<3>/O ),
    .O(sum[3])
  );
  X_IPAD   \b<2>/PAD  (
    .PAD(b[2])
  );
  X_BUF   b_2_IBUF (
    .I(b[2]),
    .O(\b<2>/INBUF )
  );
  X_BUF   \carry_OBUF/YUSED  (
    .I(ripple2_pack_1),
    .O(ripple2)
  );
  X_OPAD   \sum<2>/PAD  (
    .PAD(sum[2])
  );
  X_OBUF   sum_2_OBUF (
    .I(\sum<2>/O ),
    .O(sum[2])
  );
  X_IPAD   \a<2>/PAD  (
    .PAD(a[2])
  );
  X_BUF   a_2_IBUF (
    .I(a[2]),
    .O(\a<2>/INBUF )
  );
  X_IPAD   \a<3>/PAD  (
    .PAD(a[3])
  );
  X_BUF   a_3_IBUF (
    .I(a[3]),
    .O(\a<3>/INBUF )
  );
  X_BUF   \sum_2_OBUF/YUSED  (
    .I(ripple1_pack_1),
    .O(ripple1)
  );
  X_BUF   \a<2>/IFF/IMUX  (
    .I(\a<2>/INBUF ),
    .O(a_2_IBUF_75)
  );
  X_BUF   \b<1>/IFF/IMUX  (
    .I(\b<1>/INBUF ),
    .O(b_1_IBUF_78)
  );
  X_BUF   \a<3>/IFF/IMUX  (
    .I(\a<3>/INBUF ),
    .O(a_3_IBUF_76)
  );
  X_LUT4 #(
    .INIT ( 16'hE8E8 ))
  \s2/cout1  (
    .ADR0(b_2_IBUF_79),
    .ADR1(ripple1),
    .ADR2(a_2_IBUF_75),
    .ADR3(VCC),
    .O(ripple2_pack_1)
  );
  X_BUF   \b<0>/IFF/IMUX  (
    .I(\b<0>/INBUF ),
    .O(b_0_IBUF_77)
  );
  X_BUF   \b<2>/IFF/IMUX  (
    .I(\b<2>/INBUF ),
    .O(b_2_IBUF_79)
  );
  X_BUF   \b<3>/IFF/IMUX  (
    .I(\b<3>/INBUF ),
    .O(b_3_IBUF_80)
  );
  X_LUT4 #(
    .INIT ( 16'hE8E8 ))
  \s3/cout1  (
    .ADR0(b_3_IBUF_80),
    .ADR1(ripple2),
    .ADR2(a_3_IBUF_76),
    .ADR3(VCC),
    .O(carry_OBUF_192)
  );
  X_LUT4 #(
    .INIT ( 16'h9696 ))
  \s3/Mxor_s_xo<0>1  (
    .ADR0(a_3_IBUF_76),
    .ADR1(b_3_IBUF_80),
    .ADR2(ripple2),
    .ADR3(VCC),
    .O(sum_3_OBUF_204)
  );
  X_LUT4 #(
    .INIT ( 16'hEA80 ))
  \s1/cout1  (
    .ADR0(a_1_IBUF_74),
    .ADR1(a_0_IBUF_73),
    .ADR2(b_0_IBUF_77),
    .ADR3(b_1_IBUF_78),
    .O(ripple1_pack_1)
  );
  X_BUF   \a<1>/IFF/IMUX  (
    .I(\a<1>/INBUF ),
    .O(a_1_IBUF_74)
  );
  X_BUF   \a<0>/IFF/IMUX  (
    .I(\a<0>/INBUF ),
    .O(a_0_IBUF_73)
  );
  X_LUT4 #(
    .INIT ( 16'h6666 ))
  \s0/Mxor_s_xo<0>1  (
    .ADR0(a_0_IBUF_73),
    .ADR1(b_0_IBUF_77),
    .ADR2(VCC),
    .ADR3(VCC),
    .O(sum_0_OBUF_245)
  );
  X_LUT4 #(
    .INIT ( 16'h8778 ))
  \s1/Mxor_s_xo<0>1  (
    .ADR0(a_0_IBUF_73),
    .ADR1(b_0_IBUF_77),
    .ADR2(b_1_IBUF_78),
    .ADR3(a_1_IBUF_74),
    .O(sum_1_OBUF_252)
  );
  X_LUT4 #(
    .INIT ( 16'h9696 ))
  \s2/Mxor_s_xo<0>1  (
    .ADR0(a_2_IBUF_75),
    .ADR1(b_2_IBUF_79),
    .ADR2(ripple1),
    .ADR3(VCC),
    .O(sum_2_OBUF_228)
  );
  X_BUF   \sum<0>/OUTPUT/OFF/OMUX  (
    .I(sum_0_OBUF_245),
    .O(\sum<0>/O )
  );
  X_BUF   \carry/OUTPUT/OFF/OMUX  (
    .I(carry_OBUF_192),
    .O(\carry/O )
  );
  X_BUF   \sum<1>/OUTPUT/OFF/OMUX  (
    .I(sum_1_OBUF_252),
    .O(\sum<1>/O )
  );
  X_BUF   \sum<3>/OUTPUT/OFF/OMUX  (
    .I(sum_3_OBUF_204),
    .O(\sum<3>/O )
  );
  X_BUF   \sum<2>/OUTPUT/OFF/OMUX  (
    .I(sum_2_OBUF_228),
    .O(\sum<2>/O )
  );
  X_ONE   NlwBlock_Multistages_VCC (
    .O(VCC)
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

