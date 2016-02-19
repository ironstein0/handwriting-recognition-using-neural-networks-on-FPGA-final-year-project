////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: clock__translate.v
// /___/   /\     Timestamp: Fri Feb 05 10:19:12 2016
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/translate -ofmt verilog -sim clock_.ngd clock__translate.v 
// Device	: 6slx9tqg144-3
// Input file	: clock_.ngd
// Output file	: D:\Xilinx_projects\all primitive test projects\clock_gen\netgen\translate\clock__translate.v
// # of Modules	: 1
// Design Name	: clock_
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

module clock_ (
  CLK_IN1, CLK_OUT1, CLK_OUT2, CLK_OUT3, CLK_OUT4
);
  input CLK_IN1;
  output CLK_OUT1;
  output CLK_OUT2;
  output CLK_OUT3;
  output CLK_OUT4;
  wire CLK_OUT1_OBUF_9;
  wire CLK_OUT2_OBUF_10;
  wire CLK_OUT3_OBUF_11;
  wire CLK_OUT4_OBUF_12;
  wire RESET;
  wire \instance_name/clkout3 ;
  wire \instance_name/clkout2 ;
  wire \instance_name/clkout1 ;
  wire \instance_name/clkout0 ;
  wire \instance_name/clkin1 ;
  wire \instance_name/clkfbout ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_CLKOUTDCM3_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DCLK_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_CLKOUTDCM4_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DEN_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_CLKOUT5_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_CLKINSEL_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_CLKIN2_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_CLKOUTDCM2_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DRDY_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_CLKOUTDCM1_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DWE_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_CLKOUTDCM5_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_CLKFBDCM_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_CLKOUT4_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_REL_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_CLKOUTDCM0_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_LOCKED_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DADDR[4]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DADDR[3]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DADDR[2]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DADDR[1]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DADDR[0]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DI[15]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DI[14]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DI[13]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DI[12]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DI[11]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DI[10]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DI[9]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DI[8]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DI[7]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DI[6]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DI[5]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DI[4]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DI[3]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DI[2]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DI[1]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DI[0]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DO[15]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DO[14]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DO[13]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DO[12]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DO[11]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DO[10]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DO[9]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DO[8]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DO[7]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DO[6]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DO[5]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DO[4]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DO[3]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DO[2]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DO[1]_UNCONNECTED ;
  wire \NLW_instance_name/pll_base_inst/PLL_ADV_DO[0]_UNCONNECTED ;
  X_ZERO   XST_GND (
    .O(RESET)
  );
  X_CKBUF   \instance_name/clkout4_buf  (
    .O(CLK_OUT4_OBUF_12),
    .I(\instance_name/clkout3 )
  );
  X_CKBUF   \instance_name/clkout3_buf  (
    .O(CLK_OUT3_OBUF_11),
    .I(\instance_name/clkout2 )
  );
  X_CKBUF   \instance_name/clkout2_buf  (
    .O(CLK_OUT2_OBUF_10),
    .I(\instance_name/clkout1 )
  );
  X_CKBUF   \instance_name/clkout1_buf  (
    .O(CLK_OUT1_OBUF_9),
    .I(\instance_name/clkout0 )
  );
  X_CKBUF   \instance_name/clkin1_buf  (
    .I(CLK_IN1),
    .O(\instance_name/clkin1 )
  );
  X_IPAD   CLK_IN1_13 (
    .PAD(CLK_IN1)
  );
  X_OPAD   CLK_OUT1_14 (
    .PAD(CLK_OUT1)
  );
  X_OPAD   CLK_OUT2_15 (
    .PAD(CLK_OUT2)
  );
  X_OPAD   CLK_OUT3_16 (
    .PAD(CLK_OUT3)
  );
  X_OPAD   CLK_OUT4_17 (
    .PAD(CLK_OUT4)
  );
  X_PLL_ADV #(
    .SIM_DEVICE ( "SPARTAN6" ),
    .BANDWIDTH ( "OPTIMIZED" ),
    .CLKFBOUT_MULT ( 6 ),
    .CLKFBOUT_PHASE ( 0.000000 ),
    .CLKIN1_PERIOD ( 10 ),
    .CLKIN2_PERIOD ( 10 ),
    .CLKOUT0_DIVIDE ( 6 ),
    .CLKOUT0_DUTY_CYCLE ( 0.500000 ),
    .CLKOUT0_PHASE ( 0.000000 ),
    .CLKOUT1_DIVIDE ( 3 ),
    .CLKOUT1_DUTY_CYCLE ( 0.500000 ),
    .CLKOUT1_PHASE ( 0.000000 ),
    .CLKOUT2_DIVIDE ( 4 ),
    .CLKOUT2_DUTY_CYCLE ( 0.500000 ),
    .CLKOUT2_PHASE ( 90.000000 ),
    .CLKOUT3_DIVIDE ( 12 ),
    .CLKOUT3_DUTY_CYCLE ( 0.500000 ),
    .CLKOUT3_PHASE ( 0.000000 ),
    .CLKOUT4_DIVIDE ( 1 ),
    .CLKOUT4_DUTY_CYCLE ( 0.500000 ),
    .CLKOUT4_PHASE ( 0.000000 ),
    .CLKOUT5_DIVIDE ( 1 ),
    .CLKOUT5_DUTY_CYCLE ( 0.500000 ),
    .CLKOUT5_PHASE ( 0.000000 ),
    .CLK_FEEDBACK ( "CLKFBOUT" ),
    .COMPENSATION ( "INTERNAL" ),
    .DIVCLK_DIVIDE ( 1 ),
    .REF_JITTER ( 0.010000 ))
  \instance_name/pll_base_inst/PLL_ADV  (
    .CLKOUT3(\instance_name/clkout3 ),
    .CLKFBIN(\instance_name/clkfbout ),
    .CLKOUTDCM3(\NLW_instance_name/pll_base_inst/PLL_ADV_CLKOUTDCM3_UNCONNECTED ),
    .CLKFBOUT(\instance_name/clkfbout ),
    .DCLK(\NLW_instance_name/pll_base_inst/PLL_ADV_DCLK_UNCONNECTED ),
    .CLKOUTDCM4(\NLW_instance_name/pll_base_inst/PLL_ADV_CLKOUTDCM4_UNCONNECTED ),
    .CLKOUT1(\instance_name/clkout1 ),
    .DEN(\NLW_instance_name/pll_base_inst/PLL_ADV_DEN_UNCONNECTED ),
    .CLKOUT5(\NLW_instance_name/pll_base_inst/PLL_ADV_CLKOUT5_UNCONNECTED ),
    .CLKINSEL(\NLW_instance_name/pll_base_inst/PLL_ADV_CLKINSEL_UNCONNECTED ),
    .CLKIN2(\NLW_instance_name/pll_base_inst/PLL_ADV_CLKIN2_UNCONNECTED ),
    .CLKOUTDCM2(\NLW_instance_name/pll_base_inst/PLL_ADV_CLKOUTDCM2_UNCONNECTED ),
    .DRDY(\NLW_instance_name/pll_base_inst/PLL_ADV_DRDY_UNCONNECTED ),
    .CLKOUTDCM1(\NLW_instance_name/pll_base_inst/PLL_ADV_CLKOUTDCM1_UNCONNECTED ),
    .RST(RESET),
    .DWE(\NLW_instance_name/pll_base_inst/PLL_ADV_DWE_UNCONNECTED ),
    .CLKOUTDCM5(\NLW_instance_name/pll_base_inst/PLL_ADV_CLKOUTDCM5_UNCONNECTED ),
    .CLKFBDCM(\NLW_instance_name/pll_base_inst/PLL_ADV_CLKFBDCM_UNCONNECTED ),
    .CLKOUT0(\instance_name/clkout0 ),
    .CLKOUT4(\NLW_instance_name/pll_base_inst/PLL_ADV_CLKOUT4_UNCONNECTED ),
    .REL(\NLW_instance_name/pll_base_inst/PLL_ADV_REL_UNCONNECTED ),
    .CLKIN1(\instance_name/clkin1 ),
    .CLKOUT2(\instance_name/clkout2 ),
    .CLKOUTDCM0(\NLW_instance_name/pll_base_inst/PLL_ADV_CLKOUTDCM0_UNCONNECTED ),
    .LOCKED(\NLW_instance_name/pll_base_inst/PLL_ADV_LOCKED_UNCONNECTED ),
    .DADDR({\NLW_instance_name/pll_base_inst/PLL_ADV_DADDR[4]_UNCONNECTED , \NLW_instance_name/pll_base_inst/PLL_ADV_DADDR[3]_UNCONNECTED , 
\NLW_instance_name/pll_base_inst/PLL_ADV_DADDR[2]_UNCONNECTED , \NLW_instance_name/pll_base_inst/PLL_ADV_DADDR[1]_UNCONNECTED , 
\NLW_instance_name/pll_base_inst/PLL_ADV_DADDR[0]_UNCONNECTED }),
    .DI({\NLW_instance_name/pll_base_inst/PLL_ADV_DI[15]_UNCONNECTED , \NLW_instance_name/pll_base_inst/PLL_ADV_DI[14]_UNCONNECTED , 
\NLW_instance_name/pll_base_inst/PLL_ADV_DI[13]_UNCONNECTED , \NLW_instance_name/pll_base_inst/PLL_ADV_DI[12]_UNCONNECTED , 
\NLW_instance_name/pll_base_inst/PLL_ADV_DI[11]_UNCONNECTED , \NLW_instance_name/pll_base_inst/PLL_ADV_DI[10]_UNCONNECTED , 
\NLW_instance_name/pll_base_inst/PLL_ADV_DI[9]_UNCONNECTED , \NLW_instance_name/pll_base_inst/PLL_ADV_DI[8]_UNCONNECTED , 
\NLW_instance_name/pll_base_inst/PLL_ADV_DI[7]_UNCONNECTED , \NLW_instance_name/pll_base_inst/PLL_ADV_DI[6]_UNCONNECTED , 
\NLW_instance_name/pll_base_inst/PLL_ADV_DI[5]_UNCONNECTED , \NLW_instance_name/pll_base_inst/PLL_ADV_DI[4]_UNCONNECTED , 
\NLW_instance_name/pll_base_inst/PLL_ADV_DI[3]_UNCONNECTED , \NLW_instance_name/pll_base_inst/PLL_ADV_DI[2]_UNCONNECTED , 
\NLW_instance_name/pll_base_inst/PLL_ADV_DI[1]_UNCONNECTED , \NLW_instance_name/pll_base_inst/PLL_ADV_DI[0]_UNCONNECTED }),
    .DO({\NLW_instance_name/pll_base_inst/PLL_ADV_DO[15]_UNCONNECTED , \NLW_instance_name/pll_base_inst/PLL_ADV_DO[14]_UNCONNECTED , 
\NLW_instance_name/pll_base_inst/PLL_ADV_DO[13]_UNCONNECTED , \NLW_instance_name/pll_base_inst/PLL_ADV_DO[12]_UNCONNECTED , 
\NLW_instance_name/pll_base_inst/PLL_ADV_DO[11]_UNCONNECTED , \NLW_instance_name/pll_base_inst/PLL_ADV_DO[10]_UNCONNECTED , 
\NLW_instance_name/pll_base_inst/PLL_ADV_DO[9]_UNCONNECTED , \NLW_instance_name/pll_base_inst/PLL_ADV_DO[8]_UNCONNECTED , 
\NLW_instance_name/pll_base_inst/PLL_ADV_DO[7]_UNCONNECTED , \NLW_instance_name/pll_base_inst/PLL_ADV_DO[6]_UNCONNECTED , 
\NLW_instance_name/pll_base_inst/PLL_ADV_DO[5]_UNCONNECTED , \NLW_instance_name/pll_base_inst/PLL_ADV_DO[4]_UNCONNECTED , 
\NLW_instance_name/pll_base_inst/PLL_ADV_DO[3]_UNCONNECTED , \NLW_instance_name/pll_base_inst/PLL_ADV_DO[2]_UNCONNECTED , 
\NLW_instance_name/pll_base_inst/PLL_ADV_DO[1]_UNCONNECTED , \NLW_instance_name/pll_base_inst/PLL_ADV_DO[0]_UNCONNECTED })
  );
  X_OBUF   CLK_OUT1_OBUF (
    .I(CLK_OUT1_OBUF_9),
    .O(CLK_OUT1)
  );
  X_OBUF   CLK_OUT2_OBUF (
    .I(CLK_OUT2_OBUF_10),
    .O(CLK_OUT2)
  );
  X_OBUF   CLK_OUT3_OBUF (
    .I(CLK_OUT3_OBUF_11),
    .O(CLK_OUT3)
  );
  X_OBUF   CLK_OUT4_OBUF (
    .I(CLK_OUT4_OBUF_12),
    .O(CLK_OUT4)
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

