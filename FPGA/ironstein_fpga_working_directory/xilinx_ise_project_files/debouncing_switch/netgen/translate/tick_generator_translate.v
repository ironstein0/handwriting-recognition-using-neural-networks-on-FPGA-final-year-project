////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: M.70d
//  \   \         Application: netgen
//  /   /         Filename: tick_generator_translate.v
// /___/   /\     Timestamp: Wed Mar 02 09:54:01 2016
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/translate -ofmt verilog -sim tick_generator.ngd tick_generator_translate.v 
// Device	: 6slx9csg324-3
// Input file	: tick_generator.ngd
// Output file	: E:\projects_working_directory\debouncing_switch\netgen\translate\tick_generator_translate.v
// # of Modules	: 1
// Design Name	: tick_generator
// Xilinx        : C:\Xilinx\12.3\ISE_DS\ISE\
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

module tick_generator (
  clk, tick
);
  input clk;
  output tick;
  wire clk_BUFGP;
  wire tick_OBUF_4;
  wire \count[32]_GND_1_o_add_1_OUT<32> ;
  wire \count[32]_GND_1_o_add_1_OUT<31> ;
  wire \count[32]_GND_1_o_add_1_OUT<30> ;
  wire \count[32]_GND_1_o_add_1_OUT<29> ;
  wire \count[32]_GND_1_o_add_1_OUT<28> ;
  wire \count[32]_GND_1_o_add_1_OUT<27> ;
  wire \count[32]_GND_1_o_add_1_OUT<26> ;
  wire \count[32]_GND_1_o_add_1_OUT<25> ;
  wire \count[32]_GND_1_o_add_1_OUT<24> ;
  wire \count[32]_GND_1_o_add_1_OUT<23> ;
  wire \count[32]_GND_1_o_add_1_OUT<22> ;
  wire \count[32]_GND_1_o_add_1_OUT<21> ;
  wire \count[32]_GND_1_o_add_1_OUT<20> ;
  wire \count[32]_GND_1_o_add_1_OUT<19> ;
  wire \count[32]_GND_1_o_add_1_OUT<18> ;
  wire \count[32]_GND_1_o_add_1_OUT<17> ;
  wire \count[32]_GND_1_o_add_1_OUT<16> ;
  wire \count[32]_GND_1_o_add_1_OUT<15> ;
  wire \count[32]_GND_1_o_add_1_OUT<14> ;
  wire \count[32]_GND_1_o_add_1_OUT<13> ;
  wire \count[32]_GND_1_o_add_1_OUT<12> ;
  wire \count[32]_GND_1_o_add_1_OUT<11> ;
  wire \count[32]_GND_1_o_add_1_OUT<10> ;
  wire \count[32]_GND_1_o_add_1_OUT<9> ;
  wire \count[32]_GND_1_o_add_1_OUT<8> ;
  wire \count[32]_GND_1_o_add_1_OUT<7> ;
  wire \count[32]_GND_1_o_add_1_OUT<6> ;
  wire \count[32]_GND_1_o_add_1_OUT<5> ;
  wire \count[32]_GND_1_o_add_1_OUT<4> ;
  wire \count[32]_GND_1_o_add_1_OUT<3> ;
  wire \count[32]_GND_1_o_add_1_OUT<2> ;
  wire \count[32]_GND_1_o_add_1_OUT<1> ;
  wire \count[32]_GND_1_o_add_1_OUT<0> ;
  wire \count[32]_GND_1_o_equal_3_o ;
  wire N0;
  wire N1;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_lut<0> ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<0>_108 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<1>_109 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<2>_110 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_111 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<4>_112 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<5>_113 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<6>_114 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_115 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<8>_116 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<9>_117 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<10>_118 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_119 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<12>_120 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<13>_121 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<14>_122 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_123 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<16>_124 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<17>_125 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<18>_126 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_127 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<20>_128 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<21>_129 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<22>_130 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_131 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<24>_132 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<25>_133 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<26>_134 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_135 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<28>_136 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<29>_137 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<30>_138 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_139 ;
  wire \count[32]_GND_1_o_equal_3_o<32> ;
  wire \count[32]_GND_1_o_equal_3_o<32>1_174 ;
  wire \count[32]_GND_1_o_equal_3_o<32>2_175 ;
  wire \count[32]_GND_1_o_equal_3_o<32>4 ;
  wire \count[32]_GND_1_o_equal_3_o<32>5_177 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<1>_rt_180 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<2>_rt_181 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_rt_182 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<4>_rt_183 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<5>_rt_184 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<6>_rt_185 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_rt_186 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<8>_rt_187 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<9>_rt_188 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<10>_rt_189 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_rt_190 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<12>_rt_191 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<13>_rt_192 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<14>_rt_193 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_rt_194 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<16>_rt_195 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<17>_rt_196 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<18>_rt_197 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_rt_198 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<20>_rt_199 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<21>_rt_200 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<22>_rt_201 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_rt_202 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<24>_rt_203 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<25>_rt_204 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<26>_rt_205 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_rt_206 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<28>_rt_207 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<29>_rt_208 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<30>_rt_209 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_rt_210 ;
  wire \Mcount_count_cy<1>_rt_211 ;
  wire \Mcount_count_cy<2>_rt_212 ;
  wire \Mcount_count_cy<3>_rt_213 ;
  wire \Mcount_count_cy<4>_rt_214 ;
  wire \Mcount_count_cy<5>_rt_215 ;
  wire \Mcount_count_cy<6>_rt_216 ;
  wire \Mcount_count_cy<7>_rt_217 ;
  wire \Mcount_count_cy<8>_rt_218 ;
  wire \Mcount_count_cy<9>_rt_219 ;
  wire \Mcount_count_cy<10>_rt_220 ;
  wire \Mcount_count_cy<11>_rt_221 ;
  wire \Mcount_count_cy<12>_rt_222 ;
  wire \Mcount_count_cy<13>_rt_223 ;
  wire \Mcount_count_cy<14>_rt_224 ;
  wire \Mcount_count_cy<15>_rt_225 ;
  wire \Mcount_count_cy<16>_rt_226 ;
  wire \Mcount_count_cy<17>_rt_227 ;
  wire \Mcount_count_cy<18>_rt_228 ;
  wire \Mcount_count_cy<19>_rt_229 ;
  wire \Mcount_count_cy<20>_rt_230 ;
  wire \Mcount_count_cy<21>_rt_231 ;
  wire \Mcount_count_cy<22>_rt_232 ;
  wire \Mcount_count_cy<23>_rt_233 ;
  wire \Mcount_count_cy<24>_rt_234 ;
  wire \Mcount_count_cy<25>_rt_235 ;
  wire \Mcount_count_cy<26>_rt_236 ;
  wire \Mcount_count_cy<27>_rt_237 ;
  wire \Mcount_count_cy<28>_rt_238 ;
  wire \Mcount_count_cy<29>_rt_239 ;
  wire \Mcount_count_cy<30>_rt_240 ;
  wire \Mcount_count_cy<31>_rt_241 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_rt_242 ;
  wire \Mcount_count_xor<32>_rt_243 ;
  wire count_0_rstpot_244;
  wire count_1_rstpot_245;
  wire count_2_rstpot_246;
  wire count_3_rstpot_247;
  wire count_4_rstpot_248;
  wire count_5_rstpot_249;
  wire count_6_rstpot_250;
  wire count_7_rstpot_251;
  wire count_8_rstpot_252;
  wire count_9_rstpot_253;
  wire count_10_rstpot_254;
  wire count_11_rstpot_255;
  wire count_12_rstpot_256;
  wire count_13_rstpot_257;
  wire count_14_rstpot_258;
  wire count_15_rstpot_259;
  wire count_16_rstpot_260;
  wire count_17_rstpot_261;
  wire count_18_rstpot_262;
  wire count_19_rstpot_263;
  wire count_20_rstpot_264;
  wire count_21_rstpot_265;
  wire count_22_rstpot_266;
  wire count_23_rstpot_267;
  wire count_24_rstpot_268;
  wire count_25_rstpot_269;
  wire count_26_rstpot_270;
  wire count_27_rstpot_271;
  wire count_28_rstpot_272;
  wire count_29_rstpot_273;
  wire count_30_rstpot_274;
  wire count_31_rstpot_275;
  wire count_32_rstpot_276;
  wire N4;
  wire \count[32]_GND_1_o_equal_3_o<32>7_278 ;
  wire \clk_BUFGP/IBUFG_2 ;
  wire VCC;
  wire GND;
  wire [32 : 0] count;
  wire [32 : 0] Result;
  wire [0 : 0] Mcount_count_lut;
  wire [31 : 0] Mcount_count_cy;
  X_ONE   XST_VCC (
    .O(N0)
  );
  X_ZERO   XST_GND (
    .O(N1)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  tick_3 (
    .CLK(clk_BUFGP),
    .I(\count[32]_GND_1_o_equal_3_o ),
    .O(tick_OBUF_4),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<0>  (
    .IB(N1),
    .IA(N0),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_lut<0> ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<0>_108 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<0>  (
    .I0(N1),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_lut<0> ),
    .O(\count[32]_GND_1_o_add_1_OUT<0> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<1>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<0>_108 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<1>_rt_180 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<1>_109 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<1>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<0>_108 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<1>_rt_180 ),
    .O(\count[32]_GND_1_o_add_1_OUT<1> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<2>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<1>_109 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<2>_rt_181 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<2>_110 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<2>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<1>_109 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<2>_rt_181 ),
    .O(\count[32]_GND_1_o_add_1_OUT<2> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<3>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<2>_110 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_rt_182 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_111 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<3>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<2>_110 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_rt_182 ),
    .O(\count[32]_GND_1_o_add_1_OUT<3> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<4>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_111 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<4>_rt_183 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<4>_112 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<4>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_111 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<4>_rt_183 ),
    .O(\count[32]_GND_1_o_add_1_OUT<4> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<5>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<4>_112 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<5>_rt_184 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<5>_113 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<5>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<4>_112 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<5>_rt_184 ),
    .O(\count[32]_GND_1_o_add_1_OUT<5> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<6>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<5>_113 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<6>_rt_185 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<6>_114 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<6>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<5>_113 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<6>_rt_185 ),
    .O(\count[32]_GND_1_o_add_1_OUT<6> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<7>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<6>_114 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_rt_186 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_115 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<7>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<6>_114 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_rt_186 ),
    .O(\count[32]_GND_1_o_add_1_OUT<7> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<8>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_115 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<8>_rt_187 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<8>_116 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<8>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_115 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<8>_rt_187 ),
    .O(\count[32]_GND_1_o_add_1_OUT<8> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<9>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<8>_116 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<9>_rt_188 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<9>_117 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<9>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<8>_116 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<9>_rt_188 ),
    .O(\count[32]_GND_1_o_add_1_OUT<9> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<10>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<9>_117 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<10>_rt_189 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<10>_118 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<10>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<9>_117 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<10>_rt_189 ),
    .O(\count[32]_GND_1_o_add_1_OUT<10> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<11>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<10>_118 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_rt_190 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_119 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<11>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<10>_118 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_rt_190 ),
    .O(\count[32]_GND_1_o_add_1_OUT<11> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<12>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_119 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<12>_rt_191 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<12>_120 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<12>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_119 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<12>_rt_191 ),
    .O(\count[32]_GND_1_o_add_1_OUT<12> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<13>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<12>_120 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<13>_rt_192 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<13>_121 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<13>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<12>_120 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<13>_rt_192 ),
    .O(\count[32]_GND_1_o_add_1_OUT<13> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<14>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<13>_121 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<14>_rt_193 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<14>_122 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<14>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<13>_121 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<14>_rt_193 ),
    .O(\count[32]_GND_1_o_add_1_OUT<14> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<15>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<14>_122 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_rt_194 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_123 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<15>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<14>_122 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_rt_194 ),
    .O(\count[32]_GND_1_o_add_1_OUT<15> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<16>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_123 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<16>_rt_195 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<16>_124 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<16>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_123 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<16>_rt_195 ),
    .O(\count[32]_GND_1_o_add_1_OUT<16> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<17>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<16>_124 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<17>_rt_196 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<17>_125 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<17>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<16>_124 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<17>_rt_196 ),
    .O(\count[32]_GND_1_o_add_1_OUT<17> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<18>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<17>_125 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<18>_rt_197 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<18>_126 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<18>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<17>_125 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<18>_rt_197 ),
    .O(\count[32]_GND_1_o_add_1_OUT<18> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<19>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<18>_126 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_rt_198 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_127 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<19>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<18>_126 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_rt_198 ),
    .O(\count[32]_GND_1_o_add_1_OUT<19> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<20>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_127 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<20>_rt_199 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<20>_128 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<20>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_127 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<20>_rt_199 ),
    .O(\count[32]_GND_1_o_add_1_OUT<20> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<21>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<20>_128 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<21>_rt_200 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<21>_129 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<21>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<20>_128 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<21>_rt_200 ),
    .O(\count[32]_GND_1_o_add_1_OUT<21> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<22>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<21>_129 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<22>_rt_201 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<22>_130 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<22>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<21>_129 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<22>_rt_201 ),
    .O(\count[32]_GND_1_o_add_1_OUT<22> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<23>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<22>_130 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_rt_202 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_131 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<23>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<22>_130 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_rt_202 ),
    .O(\count[32]_GND_1_o_add_1_OUT<23> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<24>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_131 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<24>_rt_203 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<24>_132 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<24>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_131 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<24>_rt_203 ),
    .O(\count[32]_GND_1_o_add_1_OUT<24> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<25>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<24>_132 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<25>_rt_204 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<25>_133 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<25>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<24>_132 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<25>_rt_204 ),
    .O(\count[32]_GND_1_o_add_1_OUT<25> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<26>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<25>_133 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<26>_rt_205 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<26>_134 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<26>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<25>_133 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<26>_rt_205 ),
    .O(\count[32]_GND_1_o_add_1_OUT<26> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<27>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<26>_134 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_rt_206 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_135 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<27>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<26>_134 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_rt_206 ),
    .O(\count[32]_GND_1_o_add_1_OUT<27> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<28>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_135 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<28>_rt_207 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<28>_136 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<28>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_135 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<28>_rt_207 ),
    .O(\count[32]_GND_1_o_add_1_OUT<28> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<29>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<28>_136 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<29>_rt_208 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<29>_137 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<29>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<28>_136 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<29>_rt_208 ),
    .O(\count[32]_GND_1_o_add_1_OUT<29> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<30>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<29>_137 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<30>_rt_209 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<30>_138 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<30>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<29>_137 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<30>_rt_209 ),
    .O(\count[32]_GND_1_o_add_1_OUT<30> )
  );
  X_MUX2   \Madd_count[32]_GND_1_o_add_1_OUT_cy<31>  (
    .IB(\Madd_count[32]_GND_1_o_add_1_OUT_cy<30>_138 ),
    .IA(N1),
    .SEL(\Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_rt_210 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_139 )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<31>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<30>_138 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_rt_210 ),
    .O(\count[32]_GND_1_o_add_1_OUT<31> )
  );
  X_XOR2   \Madd_count[32]_GND_1_o_add_1_OUT_xor<32>  (
    .I0(\Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_139 ),
    .I1(\Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_rt_242 ),
    .O(\count[32]_GND_1_o_add_1_OUT<32> )
  );
  X_MUX2   \Mcount_count_cy<0>  (
    .IB(N1),
    .IA(N0),
    .SEL(Mcount_count_lut[0]),
    .O(Mcount_count_cy[0])
  );
  X_XOR2   \Mcount_count_xor<0>  (
    .I0(N1),
    .I1(Mcount_count_lut[0]),
    .O(Result[0])
  );
  X_MUX2   \Mcount_count_cy<1>  (
    .IB(Mcount_count_cy[0]),
    .IA(N1),
    .SEL(\Mcount_count_cy<1>_rt_211 ),
    .O(Mcount_count_cy[1])
  );
  X_XOR2   \Mcount_count_xor<1>  (
    .I0(Mcount_count_cy[0]),
    .I1(\Mcount_count_cy<1>_rt_211 ),
    .O(Result[1])
  );
  X_MUX2   \Mcount_count_cy<2>  (
    .IB(Mcount_count_cy[1]),
    .IA(N1),
    .SEL(\Mcount_count_cy<2>_rt_212 ),
    .O(Mcount_count_cy[2])
  );
  X_XOR2   \Mcount_count_xor<2>  (
    .I0(Mcount_count_cy[1]),
    .I1(\Mcount_count_cy<2>_rt_212 ),
    .O(Result[2])
  );
  X_MUX2   \Mcount_count_cy<3>  (
    .IB(Mcount_count_cy[2]),
    .IA(N1),
    .SEL(\Mcount_count_cy<3>_rt_213 ),
    .O(Mcount_count_cy[3])
  );
  X_XOR2   \Mcount_count_xor<3>  (
    .I0(Mcount_count_cy[2]),
    .I1(\Mcount_count_cy<3>_rt_213 ),
    .O(Result[3])
  );
  X_MUX2   \Mcount_count_cy<4>  (
    .IB(Mcount_count_cy[3]),
    .IA(N1),
    .SEL(\Mcount_count_cy<4>_rt_214 ),
    .O(Mcount_count_cy[4])
  );
  X_XOR2   \Mcount_count_xor<4>  (
    .I0(Mcount_count_cy[3]),
    .I1(\Mcount_count_cy<4>_rt_214 ),
    .O(Result[4])
  );
  X_MUX2   \Mcount_count_cy<5>  (
    .IB(Mcount_count_cy[4]),
    .IA(N1),
    .SEL(\Mcount_count_cy<5>_rt_215 ),
    .O(Mcount_count_cy[5])
  );
  X_XOR2   \Mcount_count_xor<5>  (
    .I0(Mcount_count_cy[4]),
    .I1(\Mcount_count_cy<5>_rt_215 ),
    .O(Result[5])
  );
  X_MUX2   \Mcount_count_cy<6>  (
    .IB(Mcount_count_cy[5]),
    .IA(N1),
    .SEL(\Mcount_count_cy<6>_rt_216 ),
    .O(Mcount_count_cy[6])
  );
  X_XOR2   \Mcount_count_xor<6>  (
    .I0(Mcount_count_cy[5]),
    .I1(\Mcount_count_cy<6>_rt_216 ),
    .O(Result[6])
  );
  X_MUX2   \Mcount_count_cy<7>  (
    .IB(Mcount_count_cy[6]),
    .IA(N1),
    .SEL(\Mcount_count_cy<7>_rt_217 ),
    .O(Mcount_count_cy[7])
  );
  X_XOR2   \Mcount_count_xor<7>  (
    .I0(Mcount_count_cy[6]),
    .I1(\Mcount_count_cy<7>_rt_217 ),
    .O(Result[7])
  );
  X_MUX2   \Mcount_count_cy<8>  (
    .IB(Mcount_count_cy[7]),
    .IA(N1),
    .SEL(\Mcount_count_cy<8>_rt_218 ),
    .O(Mcount_count_cy[8])
  );
  X_XOR2   \Mcount_count_xor<8>  (
    .I0(Mcount_count_cy[7]),
    .I1(\Mcount_count_cy<8>_rt_218 ),
    .O(Result[8])
  );
  X_MUX2   \Mcount_count_cy<9>  (
    .IB(Mcount_count_cy[8]),
    .IA(N1),
    .SEL(\Mcount_count_cy<9>_rt_219 ),
    .O(Mcount_count_cy[9])
  );
  X_XOR2   \Mcount_count_xor<9>  (
    .I0(Mcount_count_cy[8]),
    .I1(\Mcount_count_cy<9>_rt_219 ),
    .O(Result[9])
  );
  X_MUX2   \Mcount_count_cy<10>  (
    .IB(Mcount_count_cy[9]),
    .IA(N1),
    .SEL(\Mcount_count_cy<10>_rt_220 ),
    .O(Mcount_count_cy[10])
  );
  X_XOR2   \Mcount_count_xor<10>  (
    .I0(Mcount_count_cy[9]),
    .I1(\Mcount_count_cy<10>_rt_220 ),
    .O(Result[10])
  );
  X_MUX2   \Mcount_count_cy<11>  (
    .IB(Mcount_count_cy[10]),
    .IA(N1),
    .SEL(\Mcount_count_cy<11>_rt_221 ),
    .O(Mcount_count_cy[11])
  );
  X_XOR2   \Mcount_count_xor<11>  (
    .I0(Mcount_count_cy[10]),
    .I1(\Mcount_count_cy<11>_rt_221 ),
    .O(Result[11])
  );
  X_MUX2   \Mcount_count_cy<12>  (
    .IB(Mcount_count_cy[11]),
    .IA(N1),
    .SEL(\Mcount_count_cy<12>_rt_222 ),
    .O(Mcount_count_cy[12])
  );
  X_XOR2   \Mcount_count_xor<12>  (
    .I0(Mcount_count_cy[11]),
    .I1(\Mcount_count_cy<12>_rt_222 ),
    .O(Result[12])
  );
  X_MUX2   \Mcount_count_cy<13>  (
    .IB(Mcount_count_cy[12]),
    .IA(N1),
    .SEL(\Mcount_count_cy<13>_rt_223 ),
    .O(Mcount_count_cy[13])
  );
  X_XOR2   \Mcount_count_xor<13>  (
    .I0(Mcount_count_cy[12]),
    .I1(\Mcount_count_cy<13>_rt_223 ),
    .O(Result[13])
  );
  X_MUX2   \Mcount_count_cy<14>  (
    .IB(Mcount_count_cy[13]),
    .IA(N1),
    .SEL(\Mcount_count_cy<14>_rt_224 ),
    .O(Mcount_count_cy[14])
  );
  X_XOR2   \Mcount_count_xor<14>  (
    .I0(Mcount_count_cy[13]),
    .I1(\Mcount_count_cy<14>_rt_224 ),
    .O(Result[14])
  );
  X_MUX2   \Mcount_count_cy<15>  (
    .IB(Mcount_count_cy[14]),
    .IA(N1),
    .SEL(\Mcount_count_cy<15>_rt_225 ),
    .O(Mcount_count_cy[15])
  );
  X_XOR2   \Mcount_count_xor<15>  (
    .I0(Mcount_count_cy[14]),
    .I1(\Mcount_count_cy<15>_rt_225 ),
    .O(Result[15])
  );
  X_MUX2   \Mcount_count_cy<16>  (
    .IB(Mcount_count_cy[15]),
    .IA(N1),
    .SEL(\Mcount_count_cy<16>_rt_226 ),
    .O(Mcount_count_cy[16])
  );
  X_XOR2   \Mcount_count_xor<16>  (
    .I0(Mcount_count_cy[15]),
    .I1(\Mcount_count_cy<16>_rt_226 ),
    .O(Result[16])
  );
  X_MUX2   \Mcount_count_cy<17>  (
    .IB(Mcount_count_cy[16]),
    .IA(N1),
    .SEL(\Mcount_count_cy<17>_rt_227 ),
    .O(Mcount_count_cy[17])
  );
  X_XOR2   \Mcount_count_xor<17>  (
    .I0(Mcount_count_cy[16]),
    .I1(\Mcount_count_cy<17>_rt_227 ),
    .O(Result[17])
  );
  X_MUX2   \Mcount_count_cy<18>  (
    .IB(Mcount_count_cy[17]),
    .IA(N1),
    .SEL(\Mcount_count_cy<18>_rt_228 ),
    .O(Mcount_count_cy[18])
  );
  X_XOR2   \Mcount_count_xor<18>  (
    .I0(Mcount_count_cy[17]),
    .I1(\Mcount_count_cy<18>_rt_228 ),
    .O(Result[18])
  );
  X_MUX2   \Mcount_count_cy<19>  (
    .IB(Mcount_count_cy[18]),
    .IA(N1),
    .SEL(\Mcount_count_cy<19>_rt_229 ),
    .O(Mcount_count_cy[19])
  );
  X_XOR2   \Mcount_count_xor<19>  (
    .I0(Mcount_count_cy[18]),
    .I1(\Mcount_count_cy<19>_rt_229 ),
    .O(Result[19])
  );
  X_MUX2   \Mcount_count_cy<20>  (
    .IB(Mcount_count_cy[19]),
    .IA(N1),
    .SEL(\Mcount_count_cy<20>_rt_230 ),
    .O(Mcount_count_cy[20])
  );
  X_XOR2   \Mcount_count_xor<20>  (
    .I0(Mcount_count_cy[19]),
    .I1(\Mcount_count_cy<20>_rt_230 ),
    .O(Result[20])
  );
  X_MUX2   \Mcount_count_cy<21>  (
    .IB(Mcount_count_cy[20]),
    .IA(N1),
    .SEL(\Mcount_count_cy<21>_rt_231 ),
    .O(Mcount_count_cy[21])
  );
  X_XOR2   \Mcount_count_xor<21>  (
    .I0(Mcount_count_cy[20]),
    .I1(\Mcount_count_cy<21>_rt_231 ),
    .O(Result[21])
  );
  X_MUX2   \Mcount_count_cy<22>  (
    .IB(Mcount_count_cy[21]),
    .IA(N1),
    .SEL(\Mcount_count_cy<22>_rt_232 ),
    .O(Mcount_count_cy[22])
  );
  X_XOR2   \Mcount_count_xor<22>  (
    .I0(Mcount_count_cy[21]),
    .I1(\Mcount_count_cy<22>_rt_232 ),
    .O(Result[22])
  );
  X_MUX2   \Mcount_count_cy<23>  (
    .IB(Mcount_count_cy[22]),
    .IA(N1),
    .SEL(\Mcount_count_cy<23>_rt_233 ),
    .O(Mcount_count_cy[23])
  );
  X_XOR2   \Mcount_count_xor<23>  (
    .I0(Mcount_count_cy[22]),
    .I1(\Mcount_count_cy<23>_rt_233 ),
    .O(Result[23])
  );
  X_MUX2   \Mcount_count_cy<24>  (
    .IB(Mcount_count_cy[23]),
    .IA(N1),
    .SEL(\Mcount_count_cy<24>_rt_234 ),
    .O(Mcount_count_cy[24])
  );
  X_XOR2   \Mcount_count_xor<24>  (
    .I0(Mcount_count_cy[23]),
    .I1(\Mcount_count_cy<24>_rt_234 ),
    .O(Result[24])
  );
  X_MUX2   \Mcount_count_cy<25>  (
    .IB(Mcount_count_cy[24]),
    .IA(N1),
    .SEL(\Mcount_count_cy<25>_rt_235 ),
    .O(Mcount_count_cy[25])
  );
  X_XOR2   \Mcount_count_xor<25>  (
    .I0(Mcount_count_cy[24]),
    .I1(\Mcount_count_cy<25>_rt_235 ),
    .O(Result[25])
  );
  X_MUX2   \Mcount_count_cy<26>  (
    .IB(Mcount_count_cy[25]),
    .IA(N1),
    .SEL(\Mcount_count_cy<26>_rt_236 ),
    .O(Mcount_count_cy[26])
  );
  X_XOR2   \Mcount_count_xor<26>  (
    .I0(Mcount_count_cy[25]),
    .I1(\Mcount_count_cy<26>_rt_236 ),
    .O(Result[26])
  );
  X_MUX2   \Mcount_count_cy<27>  (
    .IB(Mcount_count_cy[26]),
    .IA(N1),
    .SEL(\Mcount_count_cy<27>_rt_237 ),
    .O(Mcount_count_cy[27])
  );
  X_XOR2   \Mcount_count_xor<27>  (
    .I0(Mcount_count_cy[26]),
    .I1(\Mcount_count_cy<27>_rt_237 ),
    .O(Result[27])
  );
  X_MUX2   \Mcount_count_cy<28>  (
    .IB(Mcount_count_cy[27]),
    .IA(N1),
    .SEL(\Mcount_count_cy<28>_rt_238 ),
    .O(Mcount_count_cy[28])
  );
  X_XOR2   \Mcount_count_xor<28>  (
    .I0(Mcount_count_cy[27]),
    .I1(\Mcount_count_cy<28>_rt_238 ),
    .O(Result[28])
  );
  X_MUX2   \Mcount_count_cy<29>  (
    .IB(Mcount_count_cy[28]),
    .IA(N1),
    .SEL(\Mcount_count_cy<29>_rt_239 ),
    .O(Mcount_count_cy[29])
  );
  X_XOR2   \Mcount_count_xor<29>  (
    .I0(Mcount_count_cy[28]),
    .I1(\Mcount_count_cy<29>_rt_239 ),
    .O(Result[29])
  );
  X_MUX2   \Mcount_count_cy<30>  (
    .IB(Mcount_count_cy[29]),
    .IA(N1),
    .SEL(\Mcount_count_cy<30>_rt_240 ),
    .O(Mcount_count_cy[30])
  );
  X_XOR2   \Mcount_count_xor<30>  (
    .I0(Mcount_count_cy[29]),
    .I1(\Mcount_count_cy<30>_rt_240 ),
    .O(Result[30])
  );
  X_MUX2   \Mcount_count_cy<31>  (
    .IB(Mcount_count_cy[30]),
    .IA(N1),
    .SEL(\Mcount_count_cy<31>_rt_241 ),
    .O(Mcount_count_cy[31])
  );
  X_XOR2   \Mcount_count_xor<31>  (
    .I0(Mcount_count_cy[30]),
    .I1(\Mcount_count_cy<31>_rt_241 ),
    .O(Result[31])
  );
  X_XOR2   \Mcount_count_xor<32>  (
    .I0(Mcount_count_cy[31]),
    .I1(\Mcount_count_xor<32>_rt_243 ),
    .O(Result[32])
  );
  X_LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \count[32]_GND_1_o_equal_3_o<32>1  (
    .ADR0(\count[32]_GND_1_o_add_1_OUT<17> ),
    .ADR1(\count[32]_GND_1_o_add_1_OUT<18> ),
    .ADR2(\count[32]_GND_1_o_add_1_OUT<19> ),
    .ADR3(\count[32]_GND_1_o_add_1_OUT<20> ),
    .ADR4(\count[32]_GND_1_o_add_1_OUT<21> ),
    .ADR5(\count[32]_GND_1_o_add_1_OUT<22> ),
    .O(\count[32]_GND_1_o_equal_3_o<32> )
  );
  X_LUT5 #(
    .INIT ( 32'h00000001 ))
  \count[32]_GND_1_o_equal_3_o<32>2  (
    .ADR0(\count[32]_GND_1_o_add_1_OUT<28> ),
    .ADR1(\count[32]_GND_1_o_add_1_OUT<29> ),
    .ADR2(\count[32]_GND_1_o_add_1_OUT<30> ),
    .ADR3(\count[32]_GND_1_o_add_1_OUT<31> ),
    .ADR4(\count[32]_GND_1_o_add_1_OUT<32> ),
    .O(\count[32]_GND_1_o_equal_3_o<32>1_174 )
  );
  X_LUT6 #(
    .INIT ( 64'h0000000000000020 ))
  \count[32]_GND_1_o_equal_3_o<32>3  (
    .ADR0(\count[32]_GND_1_o_add_1_OUT<0> ),
    .ADR1(\count[32]_GND_1_o_add_1_OUT<1> ),
    .ADR2(\count[32]_GND_1_o_add_1_OUT<2> ),
    .ADR3(\count[32]_GND_1_o_add_1_OUT<3> ),
    .ADR4(\count[32]_GND_1_o_add_1_OUT<4> ),
    .ADR5(\count[32]_GND_1_o_add_1_OUT<5> ),
    .O(\count[32]_GND_1_o_equal_3_o<32>2_175 )
  );
  X_LUT4 #(
    .INIT ( 16'h0001 ))
  \count[32]_GND_1_o_equal_3_o<32>5  (
    .ADR0(\count[32]_GND_1_o_add_1_OUT<24> ),
    .ADR1(\count[32]_GND_1_o_add_1_OUT<25> ),
    .ADR2(\count[32]_GND_1_o_add_1_OUT<26> ),
    .ADR3(\count[32]_GND_1_o_add_1_OUT<27> ),
    .O(\count[32]_GND_1_o_equal_3_o<32>4 )
  );
  X_LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \count[32]_GND_1_o_equal_3_o<32>6  (
    .ADR0(\count[32]_GND_1_o_add_1_OUT<6> ),
    .ADR1(\count[32]_GND_1_o_add_1_OUT<7> ),
    .ADR2(\count[32]_GND_1_o_add_1_OUT<8> ),
    .ADR3(\count[32]_GND_1_o_add_1_OUT<9> ),
    .ADR4(\count[32]_GND_1_o_add_1_OUT<10> ),
    .ADR5(\count[32]_GND_1_o_add_1_OUT<11> ),
    .O(\count[32]_GND_1_o_equal_3_o<32>5_177 )
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<1>_rt  (
    .ADR0(count[1]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<1>_rt_180 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<2>_rt  (
    .ADR0(count[2]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<2>_rt_181 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_rt  (
    .ADR0(count[3]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_rt_182 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<4>_rt  (
    .ADR0(count[4]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<4>_rt_183 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<5>_rt  (
    .ADR0(count[5]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<5>_rt_184 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<6>_rt  (
    .ADR0(count[6]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<6>_rt_185 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_rt  (
    .ADR0(count[7]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_rt_186 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<8>_rt  (
    .ADR0(count[8]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<8>_rt_187 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<9>_rt  (
    .ADR0(count[9]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<9>_rt_188 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<10>_rt  (
    .ADR0(count[10]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<10>_rt_189 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_rt  (
    .ADR0(count[11]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_rt_190 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<12>_rt  (
    .ADR0(count[12]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<12>_rt_191 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<13>_rt  (
    .ADR0(count[13]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<13>_rt_192 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<14>_rt  (
    .ADR0(count[14]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<14>_rt_193 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_rt  (
    .ADR0(count[15]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_rt_194 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<16>_rt  (
    .ADR0(count[16]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<16>_rt_195 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<17>_rt  (
    .ADR0(count[17]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<17>_rt_196 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<18>_rt  (
    .ADR0(count[18]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<18>_rt_197 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_rt  (
    .ADR0(count[19]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_rt_198 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<20>_rt  (
    .ADR0(count[20]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<20>_rt_199 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<21>_rt  (
    .ADR0(count[21]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<21>_rt_200 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<22>_rt  (
    .ADR0(count[22]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<22>_rt_201 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_rt  (
    .ADR0(count[23]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_rt_202 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<24>_rt  (
    .ADR0(count[24]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<24>_rt_203 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<25>_rt  (
    .ADR0(count[25]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<25>_rt_204 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<26>_rt  (
    .ADR0(count[26]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<26>_rt_205 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_rt  (
    .ADR0(count[27]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_rt_206 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<28>_rt  (
    .ADR0(count[28]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<28>_rt_207 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<29>_rt  (
    .ADR0(count[29]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<29>_rt_208 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<30>_rt  (
    .ADR0(count[30]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<30>_rt_209 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_rt  (
    .ADR0(count[31]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_rt_210 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<1>_rt  (
    .ADR0(count[1]),
    .O(\Mcount_count_cy<1>_rt_211 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<2>_rt  (
    .ADR0(count[2]),
    .O(\Mcount_count_cy<2>_rt_212 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<3>_rt  (
    .ADR0(count[3]),
    .O(\Mcount_count_cy<3>_rt_213 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<4>_rt  (
    .ADR0(count[4]),
    .O(\Mcount_count_cy<4>_rt_214 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<5>_rt  (
    .ADR0(count[5]),
    .O(\Mcount_count_cy<5>_rt_215 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<6>_rt  (
    .ADR0(count[6]),
    .O(\Mcount_count_cy<6>_rt_216 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<7>_rt  (
    .ADR0(count[7]),
    .O(\Mcount_count_cy<7>_rt_217 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<8>_rt  (
    .ADR0(count[8]),
    .O(\Mcount_count_cy<8>_rt_218 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<9>_rt  (
    .ADR0(count[9]),
    .O(\Mcount_count_cy<9>_rt_219 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<10>_rt  (
    .ADR0(count[10]),
    .O(\Mcount_count_cy<10>_rt_220 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<11>_rt  (
    .ADR0(count[11]),
    .O(\Mcount_count_cy<11>_rt_221 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<12>_rt  (
    .ADR0(count[12]),
    .O(\Mcount_count_cy<12>_rt_222 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<13>_rt  (
    .ADR0(count[13]),
    .O(\Mcount_count_cy<13>_rt_223 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<14>_rt  (
    .ADR0(count[14]),
    .O(\Mcount_count_cy<14>_rt_224 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<15>_rt  (
    .ADR0(count[15]),
    .O(\Mcount_count_cy<15>_rt_225 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<16>_rt  (
    .ADR0(count[16]),
    .O(\Mcount_count_cy<16>_rt_226 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<17>_rt  (
    .ADR0(count[17]),
    .O(\Mcount_count_cy<17>_rt_227 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<18>_rt  (
    .ADR0(count[18]),
    .O(\Mcount_count_cy<18>_rt_228 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<19>_rt  (
    .ADR0(count[19]),
    .O(\Mcount_count_cy<19>_rt_229 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<20>_rt  (
    .ADR0(count[20]),
    .O(\Mcount_count_cy<20>_rt_230 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<21>_rt  (
    .ADR0(count[21]),
    .O(\Mcount_count_cy<21>_rt_231 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<22>_rt  (
    .ADR0(count[22]),
    .O(\Mcount_count_cy<22>_rt_232 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<23>_rt  (
    .ADR0(count[23]),
    .O(\Mcount_count_cy<23>_rt_233 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<24>_rt  (
    .ADR0(count[24]),
    .O(\Mcount_count_cy<24>_rt_234 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<25>_rt  (
    .ADR0(count[25]),
    .O(\Mcount_count_cy<25>_rt_235 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<26>_rt  (
    .ADR0(count[26]),
    .O(\Mcount_count_cy<26>_rt_236 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<27>_rt  (
    .ADR0(count[27]),
    .O(\Mcount_count_cy<27>_rt_237 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<28>_rt  (
    .ADR0(count[28]),
    .O(\Mcount_count_cy<28>_rt_238 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<29>_rt  (
    .ADR0(count[29]),
    .O(\Mcount_count_cy<29>_rt_239 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<30>_rt  (
    .ADR0(count[30]),
    .O(\Mcount_count_cy<30>_rt_240 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_cy<31>_rt  (
    .ADR0(count[31]),
    .O(\Mcount_count_cy<31>_rt_241 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_rt  (
    .ADR0(count[32]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_rt_242 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'hA ))
  \Mcount_count_xor<32>_rt  (
    .ADR0(count[32]),
    .O(\Mcount_count_xor<32>_rt_243 ),
    .ADR1(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_0_rstpot (
    .ADR0(Result[0]),
    .ADR1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_0_rstpot_244)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_0 (
    .CLK(clk_BUFGP),
    .I(count_0_rstpot_244),
    .O(count[0]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_1_rstpot (
    .ADR0(Result[1]),
    .ADR1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_1_rstpot_245)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_1 (
    .CLK(clk_BUFGP),
    .I(count_1_rstpot_245),
    .O(count[1]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_2_rstpot (
    .ADR0(Result[2]),
    .ADR1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_2_rstpot_246)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_2 (
    .CLK(clk_BUFGP),
    .I(count_2_rstpot_246),
    .O(count[2]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_3_rstpot (
    .ADR0(Result[3]),
    .ADR1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_3_rstpot_247)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_3 (
    .CLK(clk_BUFGP),
    .I(count_3_rstpot_247),
    .O(count[3]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_4_rstpot (
    .ADR0(Result[4]),
    .ADR1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_4_rstpot_248)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_4 (
    .CLK(clk_BUFGP),
    .I(count_4_rstpot_248),
    .O(count[4]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_5_rstpot (
    .ADR0(Result[5]),
    .ADR1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_5_rstpot_249)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_5 (
    .CLK(clk_BUFGP),
    .I(count_5_rstpot_249),
    .O(count[5]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_6_rstpot (
    .ADR0(Result[6]),
    .ADR1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_6_rstpot_250)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_6 (
    .CLK(clk_BUFGP),
    .I(count_6_rstpot_250),
    .O(count[6]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_7_rstpot (
    .ADR0(Result[7]),
    .ADR1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_7_rstpot_251)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_7 (
    .CLK(clk_BUFGP),
    .I(count_7_rstpot_251),
    .O(count[7]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_8_rstpot (
    .ADR0(Result[8]),
    .ADR1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_8_rstpot_252)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_8 (
    .CLK(clk_BUFGP),
    .I(count_8_rstpot_252),
    .O(count[8]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_9_rstpot (
    .ADR0(Result[9]),
    .ADR1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_9_rstpot_253)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_9 (
    .CLK(clk_BUFGP),
    .I(count_9_rstpot_253),
    .O(count[9]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_10_rstpot (
    .ADR0(Result[10]),
    .ADR1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_10_rstpot_254)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_10 (
    .CLK(clk_BUFGP),
    .I(count_10_rstpot_254),
    .O(count[10]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_11_rstpot (
    .ADR0(Result[11]),
    .ADR1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_11_rstpot_255)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_11 (
    .CLK(clk_BUFGP),
    .I(count_11_rstpot_255),
    .O(count[11]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_12_rstpot (
    .ADR0(Result[12]),
    .ADR1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_12_rstpot_256)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_12 (
    .CLK(clk_BUFGP),
    .I(count_12_rstpot_256),
    .O(count[12]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_13_rstpot (
    .ADR0(Result[13]),
    .ADR1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_13_rstpot_257)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_13 (
    .CLK(clk_BUFGP),
    .I(count_13_rstpot_257),
    .O(count[13]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_14_rstpot (
    .ADR0(Result[14]),
    .ADR1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_14_rstpot_258)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_14 (
    .CLK(clk_BUFGP),
    .I(count_14_rstpot_258),
    .O(count[14]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_15_rstpot (
    .ADR0(Result[15]),
    .ADR1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_15_rstpot_259)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_15 (
    .CLK(clk_BUFGP),
    .I(count_15_rstpot_259),
    .O(count[15]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_16_rstpot (
    .ADR0(Result[16]),
    .ADR1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_16_rstpot_260)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_16 (
    .CLK(clk_BUFGP),
    .I(count_16_rstpot_260),
    .O(count[16]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_17_rstpot (
    .ADR0(Result[17]),
    .ADR1(\count[32]_GND_1_o_equal_3_o<32>7_278 ),
    .O(count_17_rstpot_261)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_17 (
    .CLK(clk_BUFGP),
    .I(count_17_rstpot_261),
    .O(count[17]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_18_rstpot (
    .ADR0(Result[18]),
    .ADR1(\count[32]_GND_1_o_equal_3_o<32>7_278 ),
    .O(count_18_rstpot_262)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_18 (
    .CLK(clk_BUFGP),
    .I(count_18_rstpot_262),
    .O(count[18]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_19_rstpot (
    .ADR0(Result[19]),
    .ADR1(\count[32]_GND_1_o_equal_3_o<32>7_278 ),
    .O(count_19_rstpot_263)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_19 (
    .CLK(clk_BUFGP),
    .I(count_19_rstpot_263),
    .O(count[19]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_20_rstpot (
    .ADR0(Result[20]),
    .ADR1(\count[32]_GND_1_o_equal_3_o<32>7_278 ),
    .O(count_20_rstpot_264)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_20 (
    .CLK(clk_BUFGP),
    .I(count_20_rstpot_264),
    .O(count[20]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_21_rstpot (
    .ADR0(Result[21]),
    .ADR1(\count[32]_GND_1_o_equal_3_o<32>7_278 ),
    .O(count_21_rstpot_265)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_21 (
    .CLK(clk_BUFGP),
    .I(count_21_rstpot_265),
    .O(count[21]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_22_rstpot (
    .ADR0(Result[22]),
    .ADR1(\count[32]_GND_1_o_equal_3_o<32>7_278 ),
    .O(count_22_rstpot_266)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_22 (
    .CLK(clk_BUFGP),
    .I(count_22_rstpot_266),
    .O(count[22]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_23_rstpot (
    .ADR0(Result[23]),
    .ADR1(\count[32]_GND_1_o_equal_3_o<32>7_278 ),
    .O(count_23_rstpot_267)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_23 (
    .CLK(clk_BUFGP),
    .I(count_23_rstpot_267),
    .O(count[23]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_24_rstpot (
    .ADR0(Result[24]),
    .ADR1(\count[32]_GND_1_o_equal_3_o<32>7_278 ),
    .O(count_24_rstpot_268)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_24 (
    .CLK(clk_BUFGP),
    .I(count_24_rstpot_268),
    .O(count[24]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_25_rstpot (
    .ADR0(Result[25]),
    .ADR1(\count[32]_GND_1_o_equal_3_o<32>7_278 ),
    .O(count_25_rstpot_269)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_25 (
    .CLK(clk_BUFGP),
    .I(count_25_rstpot_269),
    .O(count[25]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_26_rstpot (
    .ADR0(Result[26]),
    .ADR1(\count[32]_GND_1_o_equal_3_o<32>7_278 ),
    .O(count_26_rstpot_270)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_26 (
    .CLK(clk_BUFGP),
    .I(count_26_rstpot_270),
    .O(count[26]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_27_rstpot (
    .ADR0(Result[27]),
    .ADR1(\count[32]_GND_1_o_equal_3_o<32>7_278 ),
    .O(count_27_rstpot_271)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_27 (
    .CLK(clk_BUFGP),
    .I(count_27_rstpot_271),
    .O(count[27]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_28_rstpot (
    .ADR0(Result[28]),
    .ADR1(\count[32]_GND_1_o_equal_3_o<32>7_278 ),
    .O(count_28_rstpot_272)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_28 (
    .CLK(clk_BUFGP),
    .I(count_28_rstpot_272),
    .O(count[28]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_29_rstpot (
    .ADR0(Result[29]),
    .ADR1(\count[32]_GND_1_o_equal_3_o<32>7_278 ),
    .O(count_29_rstpot_273)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_29 (
    .CLK(clk_BUFGP),
    .I(count_29_rstpot_273),
    .O(count[29]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_30_rstpot (
    .ADR0(Result[30]),
    .ADR1(\count[32]_GND_1_o_equal_3_o<32>7_278 ),
    .O(count_30_rstpot_274)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_30 (
    .CLK(clk_BUFGP),
    .I(count_30_rstpot_274),
    .O(count[30]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_31_rstpot (
    .ADR0(Result[31]),
    .ADR1(\count[32]_GND_1_o_equal_3_o<32>7_278 ),
    .O(count_31_rstpot_275)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_31 (
    .CLK(clk_BUFGP),
    .I(count_31_rstpot_275),
    .O(count[31]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT2 #(
    .INIT ( 4'h2 ))
  count_32_rstpot (
    .ADR0(Result[32]),
    .ADR1(\count[32]_GND_1_o_equal_3_o<32>7_278 ),
    .O(count_32_rstpot_276)
  );
  X_FF #(
    .INIT ( 1'b0 ))
  count_32 (
    .CLK(clk_BUFGP),
    .I(count_32_rstpot_276),
    .O(count[32]),
    .CE(VCC),
    .SET(GND),
    .RST(GND)
  );
  X_LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \count[32]_GND_1_o_equal_3_o<32>4_SW0  (
    .ADR0(\count[32]_GND_1_o_add_1_OUT<12> ),
    .ADR1(\count[32]_GND_1_o_add_1_OUT<13> ),
    .ADR2(\count[32]_GND_1_o_add_1_OUT<14> ),
    .ADR3(\count[32]_GND_1_o_add_1_OUT<15> ),
    .ADR4(\count[32]_GND_1_o_add_1_OUT<16> ),
    .ADR5(\count[32]_GND_1_o_add_1_OUT<23> ),
    .O(N4)
  );
  X_LUT6 #(
    .INIT ( 64'h0800000000000000 ))
  \count[32]_GND_1_o_equal_3_o<32>7  (
    .ADR0(\count[32]_GND_1_o_equal_3_o<32>2_175 ),
    .ADR1(\count[32]_GND_1_o_equal_3_o<32>5_177 ),
    .ADR2(N4),
    .ADR3(\count[32]_GND_1_o_equal_3_o<32>4 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o<32> ),
    .ADR5(\count[32]_GND_1_o_equal_3_o<32>1_174 ),
    .O(\count[32]_GND_1_o_equal_3_o )
  );
  X_LUT6 #(
    .INIT ( 64'h0800000000000000 ))
  \count[32]_GND_1_o_equal_3_o<32>7_1  (
    .ADR0(\count[32]_GND_1_o_equal_3_o<32>2_175 ),
    .ADR1(\count[32]_GND_1_o_equal_3_o<32>5_177 ),
    .ADR2(N4),
    .ADR3(\count[32]_GND_1_o_equal_3_o<32>4 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o<32> ),
    .ADR5(\count[32]_GND_1_o_equal_3_o<32>1_174 ),
    .O(\count[32]_GND_1_o_equal_3_o<32>7_278 )
  );
  X_INV   \Madd_count[32]_GND_1_o_add_1_OUT_lut<0>_INV_0  (
    .I(count[0]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_lut<0> )
  );
  X_INV   \Mcount_count_lut<0>_INV_0  (
    .I(count[0]),
    .O(Mcount_count_lut[0])
  );
  X_IPAD   clk_278 (
    .PAD(clk)
  );
  X_OPAD   \tick.PAD  (
    .PAD(tick)
  );
  X_CKBUF   \clk_BUFGP/BUFG  (
    .I(\clk_BUFGP/IBUFG_2 ),
    .O(clk_BUFGP)
  );
  X_CKBUF   \clk_BUFGP/IBUFG  (
    .I(clk),
    .O(\clk_BUFGP/IBUFG_2 )
  );
  X_OBUF   tick_OBUF (
    .I(tick_OBUF_4),
    .O(tick)
  );
  X_ONE   NlwBlock_tick_generator_VCC (
    .O(VCC)
  );
  X_ZERO   NlwBlock_tick_generator_GND (
    .O(GND)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

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

