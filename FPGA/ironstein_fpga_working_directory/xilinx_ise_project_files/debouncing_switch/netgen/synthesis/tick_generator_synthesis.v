////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: M.70d
//  \   \         Application: netgen
//  /   /         Filename: tick_generator_synthesis.v
// /___/   /\     Timestamp: Wed Mar 02 09:48:11 2016
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim tick_generator.ngc tick_generator_synthesis.v 
// Device	: xc6slx9-3-csg324
// Input file	: tick_generator.ngc
// Output file	: E:\projects_working_directory\debouncing_switch\netgen\synthesis\tick_generator_synthesis.v
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
  wire clk_BUFGP_0;
  wire tick_OBUF_1;
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
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<0>_105 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<1>_106 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<2>_107 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_108 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<4>_109 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<5>_110 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<6>_111 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_112 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<8>_113 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<9>_114 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<10>_115 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_116 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<12>_117 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<13>_118 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<14>_119 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_120 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<16>_121 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<17>_122 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<18>_123 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_124 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<20>_125 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<21>_126 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<22>_127 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_128 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<24>_129 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<25>_130 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<26>_131 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_132 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<28>_133 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<29>_134 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<30>_135 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_136 ;
  wire \count[32]_GND_1_o_equal_3_o<32> ;
  wire \count[32]_GND_1_o_equal_3_o<32>1_171 ;
  wire \count[32]_GND_1_o_equal_3_o<32>2_172 ;
  wire \count[32]_GND_1_o_equal_3_o<32>3_173 ;
  wire \count[32]_GND_1_o_equal_3_o<32>4_174 ;
  wire \count[32]_GND_1_o_equal_3_o<32>5_175 ;
  wire \count[32]_GND_1_o_equal_3_o<32>6_176 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<1>_rt_179 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<2>_rt_180 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_rt_181 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<4>_rt_182 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<5>_rt_183 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<6>_rt_184 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_rt_185 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<8>_rt_186 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<9>_rt_187 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<10>_rt_188 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_rt_189 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<12>_rt_190 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<13>_rt_191 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<14>_rt_192 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_rt_193 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<16>_rt_194 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<17>_rt_195 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<18>_rt_196 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_rt_197 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<20>_rt_198 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<21>_rt_199 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<22>_rt_200 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_rt_201 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<24>_rt_202 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<25>_rt_203 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<26>_rt_204 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_rt_205 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<28>_rt_206 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<29>_rt_207 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<30>_rt_208 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_rt_209 ;
  wire \Mcount_count_cy<1>_rt_210 ;
  wire \Mcount_count_cy<2>_rt_211 ;
  wire \Mcount_count_cy<3>_rt_212 ;
  wire \Mcount_count_cy<4>_rt_213 ;
  wire \Mcount_count_cy<5>_rt_214 ;
  wire \Mcount_count_cy<6>_rt_215 ;
  wire \Mcount_count_cy<7>_rt_216 ;
  wire \Mcount_count_cy<8>_rt_217 ;
  wire \Mcount_count_cy<9>_rt_218 ;
  wire \Mcount_count_cy<10>_rt_219 ;
  wire \Mcount_count_cy<11>_rt_220 ;
  wire \Mcount_count_cy<12>_rt_221 ;
  wire \Mcount_count_cy<13>_rt_222 ;
  wire \Mcount_count_cy<14>_rt_223 ;
  wire \Mcount_count_cy<15>_rt_224 ;
  wire \Mcount_count_cy<16>_rt_225 ;
  wire \Mcount_count_cy<17>_rt_226 ;
  wire \Mcount_count_cy<18>_rt_227 ;
  wire \Mcount_count_cy<19>_rt_228 ;
  wire \Mcount_count_cy<20>_rt_229 ;
  wire \Mcount_count_cy<21>_rt_230 ;
  wire \Mcount_count_cy<22>_rt_231 ;
  wire \Mcount_count_cy<23>_rt_232 ;
  wire \Mcount_count_cy<24>_rt_233 ;
  wire \Mcount_count_cy<25>_rt_234 ;
  wire \Mcount_count_cy<26>_rt_235 ;
  wire \Mcount_count_cy<27>_rt_236 ;
  wire \Mcount_count_cy<28>_rt_237 ;
  wire \Mcount_count_cy<29>_rt_238 ;
  wire \Mcount_count_cy<30>_rt_239 ;
  wire \Mcount_count_cy<31>_rt_240 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_rt_241 ;
  wire \Mcount_count_xor<32>_rt_242 ;
  wire count_0_rstpot_243;
  wire count_1_rstpot_244;
  wire count_2_rstpot_245;
  wire count_3_rstpot_246;
  wire count_4_rstpot_247;
  wire count_5_rstpot_248;
  wire count_6_rstpot_249;
  wire count_7_rstpot_250;
  wire count_8_rstpot_251;
  wire count_9_rstpot_252;
  wire count_10_rstpot_253;
  wire count_11_rstpot_254;
  wire count_12_rstpot_255;
  wire count_13_rstpot_256;
  wire count_14_rstpot_257;
  wire count_15_rstpot_258;
  wire count_16_rstpot_259;
  wire count_17_rstpot_260;
  wire count_18_rstpot_261;
  wire count_19_rstpot_262;
  wire count_20_rstpot_263;
  wire count_21_rstpot_264;
  wire count_22_rstpot_265;
  wire count_23_rstpot_266;
  wire count_24_rstpot_267;
  wire count_25_rstpot_268;
  wire count_26_rstpot_269;
  wire count_27_rstpot_270;
  wire count_28_rstpot_271;
  wire count_29_rstpot_272;
  wire count_30_rstpot_273;
  wire count_31_rstpot_274;
  wire count_32_rstpot_275;
  wire \count[32]_GND_1_o_equal_3_o<32>8_276 ;
  wire [32 : 0] count;
  wire [32 : 0] Result;
  wire [0 : 0] Mcount_count_lut;
  wire [31 : 0] Mcount_count_cy;
  VCC   XST_VCC (
    .P(N0)
  );
  GND   XST_GND (
    .G(N1)
  );
  FD #(
    .INIT ( 1'b0 ))
  tick_3 (
    .C(clk_BUFGP_0),
    .D(\count[32]_GND_1_o_equal_3_o ),
    .Q(tick_OBUF_1)
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<0>  (
    .CI(N1),
    .DI(N0),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_lut<0> ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<0>_105 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<0>  (
    .CI(N1),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_lut<0> ),
    .O(\count[32]_GND_1_o_add_1_OUT<0> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<1>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<0>_105 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<1>_rt_179 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<1>_106 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<1>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<0>_105 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<1>_rt_179 ),
    .O(\count[32]_GND_1_o_add_1_OUT<1> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<2>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<1>_106 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<2>_rt_180 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<2>_107 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<2>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<1>_106 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<2>_rt_180 ),
    .O(\count[32]_GND_1_o_add_1_OUT<2> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<3>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<2>_107 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_rt_181 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_108 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<3>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<2>_107 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_rt_181 ),
    .O(\count[32]_GND_1_o_add_1_OUT<3> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<4>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_108 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<4>_rt_182 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<4>_109 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<4>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_108 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<4>_rt_182 ),
    .O(\count[32]_GND_1_o_add_1_OUT<4> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<5>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<4>_109 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<5>_rt_183 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<5>_110 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<5>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<4>_109 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<5>_rt_183 ),
    .O(\count[32]_GND_1_o_add_1_OUT<5> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<6>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<5>_110 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<6>_rt_184 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<6>_111 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<6>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<5>_110 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<6>_rt_184 ),
    .O(\count[32]_GND_1_o_add_1_OUT<6> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<7>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<6>_111 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_rt_185 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_112 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<7>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<6>_111 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_rt_185 ),
    .O(\count[32]_GND_1_o_add_1_OUT<7> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<8>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_112 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<8>_rt_186 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<8>_113 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<8>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_112 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<8>_rt_186 ),
    .O(\count[32]_GND_1_o_add_1_OUT<8> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<9>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<8>_113 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<9>_rt_187 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<9>_114 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<9>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<8>_113 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<9>_rt_187 ),
    .O(\count[32]_GND_1_o_add_1_OUT<9> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<10>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<9>_114 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<10>_rt_188 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<10>_115 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<10>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<9>_114 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<10>_rt_188 ),
    .O(\count[32]_GND_1_o_add_1_OUT<10> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<11>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<10>_115 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_rt_189 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_116 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<11>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<10>_115 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_rt_189 ),
    .O(\count[32]_GND_1_o_add_1_OUT<11> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<12>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_116 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<12>_rt_190 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<12>_117 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<12>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_116 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<12>_rt_190 ),
    .O(\count[32]_GND_1_o_add_1_OUT<12> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<13>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<12>_117 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<13>_rt_191 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<13>_118 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<13>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<12>_117 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<13>_rt_191 ),
    .O(\count[32]_GND_1_o_add_1_OUT<13> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<14>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<13>_118 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<14>_rt_192 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<14>_119 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<14>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<13>_118 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<14>_rt_192 ),
    .O(\count[32]_GND_1_o_add_1_OUT<14> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<15>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<14>_119 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_rt_193 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_120 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<15>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<14>_119 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_rt_193 ),
    .O(\count[32]_GND_1_o_add_1_OUT<15> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<16>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_120 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<16>_rt_194 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<16>_121 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<16>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_120 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<16>_rt_194 ),
    .O(\count[32]_GND_1_o_add_1_OUT<16> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<17>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<16>_121 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<17>_rt_195 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<17>_122 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<17>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<16>_121 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<17>_rt_195 ),
    .O(\count[32]_GND_1_o_add_1_OUT<17> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<18>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<17>_122 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<18>_rt_196 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<18>_123 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<18>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<17>_122 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<18>_rt_196 ),
    .O(\count[32]_GND_1_o_add_1_OUT<18> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<19>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<18>_123 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_rt_197 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_124 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<19>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<18>_123 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_rt_197 ),
    .O(\count[32]_GND_1_o_add_1_OUT<19> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<20>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_124 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<20>_rt_198 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<20>_125 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<20>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_124 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<20>_rt_198 ),
    .O(\count[32]_GND_1_o_add_1_OUT<20> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<21>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<20>_125 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<21>_rt_199 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<21>_126 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<21>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<20>_125 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<21>_rt_199 ),
    .O(\count[32]_GND_1_o_add_1_OUT<21> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<22>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<21>_126 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<22>_rt_200 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<22>_127 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<22>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<21>_126 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<22>_rt_200 ),
    .O(\count[32]_GND_1_o_add_1_OUT<22> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<23>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<22>_127 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_rt_201 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_128 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<23>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<22>_127 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_rt_201 ),
    .O(\count[32]_GND_1_o_add_1_OUT<23> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<24>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_128 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<24>_rt_202 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<24>_129 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<24>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_128 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<24>_rt_202 ),
    .O(\count[32]_GND_1_o_add_1_OUT<24> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<25>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<24>_129 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<25>_rt_203 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<25>_130 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<25>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<24>_129 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<25>_rt_203 ),
    .O(\count[32]_GND_1_o_add_1_OUT<25> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<26>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<25>_130 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<26>_rt_204 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<26>_131 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<26>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<25>_130 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<26>_rt_204 ),
    .O(\count[32]_GND_1_o_add_1_OUT<26> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<27>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<26>_131 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_rt_205 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_132 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<27>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<26>_131 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_rt_205 ),
    .O(\count[32]_GND_1_o_add_1_OUT<27> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<28>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_132 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<28>_rt_206 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<28>_133 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<28>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_132 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<28>_rt_206 ),
    .O(\count[32]_GND_1_o_add_1_OUT<28> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<29>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<28>_133 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<29>_rt_207 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<29>_134 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<29>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<28>_133 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<29>_rt_207 ),
    .O(\count[32]_GND_1_o_add_1_OUT<29> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<30>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<29>_134 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<30>_rt_208 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<30>_135 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<30>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<29>_134 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<30>_rt_208 ),
    .O(\count[32]_GND_1_o_add_1_OUT<30> )
  );
  MUXCY   \Madd_count[32]_GND_1_o_add_1_OUT_cy<31>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<30>_135 ),
    .DI(N1),
    .S(\Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_rt_209 ),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_136 )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<31>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<30>_135 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_rt_209 ),
    .O(\count[32]_GND_1_o_add_1_OUT<31> )
  );
  XORCY   \Madd_count[32]_GND_1_o_add_1_OUT_xor<32>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_136 ),
    .LI(\Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_rt_241 ),
    .O(\count[32]_GND_1_o_add_1_OUT<32> )
  );
  MUXCY   \Mcount_count_cy<0>  (
    .CI(N1),
    .DI(N0),
    .S(Mcount_count_lut[0]),
    .O(Mcount_count_cy[0])
  );
  XORCY   \Mcount_count_xor<0>  (
    .CI(N1),
    .LI(Mcount_count_lut[0]),
    .O(Result[0])
  );
  MUXCY   \Mcount_count_cy<1>  (
    .CI(Mcount_count_cy[0]),
    .DI(N1),
    .S(\Mcount_count_cy<1>_rt_210 ),
    .O(Mcount_count_cy[1])
  );
  XORCY   \Mcount_count_xor<1>  (
    .CI(Mcount_count_cy[0]),
    .LI(\Mcount_count_cy<1>_rt_210 ),
    .O(Result[1])
  );
  MUXCY   \Mcount_count_cy<2>  (
    .CI(Mcount_count_cy[1]),
    .DI(N1),
    .S(\Mcount_count_cy<2>_rt_211 ),
    .O(Mcount_count_cy[2])
  );
  XORCY   \Mcount_count_xor<2>  (
    .CI(Mcount_count_cy[1]),
    .LI(\Mcount_count_cy<2>_rt_211 ),
    .O(Result[2])
  );
  MUXCY   \Mcount_count_cy<3>  (
    .CI(Mcount_count_cy[2]),
    .DI(N1),
    .S(\Mcount_count_cy<3>_rt_212 ),
    .O(Mcount_count_cy[3])
  );
  XORCY   \Mcount_count_xor<3>  (
    .CI(Mcount_count_cy[2]),
    .LI(\Mcount_count_cy<3>_rt_212 ),
    .O(Result[3])
  );
  MUXCY   \Mcount_count_cy<4>  (
    .CI(Mcount_count_cy[3]),
    .DI(N1),
    .S(\Mcount_count_cy<4>_rt_213 ),
    .O(Mcount_count_cy[4])
  );
  XORCY   \Mcount_count_xor<4>  (
    .CI(Mcount_count_cy[3]),
    .LI(\Mcount_count_cy<4>_rt_213 ),
    .O(Result[4])
  );
  MUXCY   \Mcount_count_cy<5>  (
    .CI(Mcount_count_cy[4]),
    .DI(N1),
    .S(\Mcount_count_cy<5>_rt_214 ),
    .O(Mcount_count_cy[5])
  );
  XORCY   \Mcount_count_xor<5>  (
    .CI(Mcount_count_cy[4]),
    .LI(\Mcount_count_cy<5>_rt_214 ),
    .O(Result[5])
  );
  MUXCY   \Mcount_count_cy<6>  (
    .CI(Mcount_count_cy[5]),
    .DI(N1),
    .S(\Mcount_count_cy<6>_rt_215 ),
    .O(Mcount_count_cy[6])
  );
  XORCY   \Mcount_count_xor<6>  (
    .CI(Mcount_count_cy[5]),
    .LI(\Mcount_count_cy<6>_rt_215 ),
    .O(Result[6])
  );
  MUXCY   \Mcount_count_cy<7>  (
    .CI(Mcount_count_cy[6]),
    .DI(N1),
    .S(\Mcount_count_cy<7>_rt_216 ),
    .O(Mcount_count_cy[7])
  );
  XORCY   \Mcount_count_xor<7>  (
    .CI(Mcount_count_cy[6]),
    .LI(\Mcount_count_cy<7>_rt_216 ),
    .O(Result[7])
  );
  MUXCY   \Mcount_count_cy<8>  (
    .CI(Mcount_count_cy[7]),
    .DI(N1),
    .S(\Mcount_count_cy<8>_rt_217 ),
    .O(Mcount_count_cy[8])
  );
  XORCY   \Mcount_count_xor<8>  (
    .CI(Mcount_count_cy[7]),
    .LI(\Mcount_count_cy<8>_rt_217 ),
    .O(Result[8])
  );
  MUXCY   \Mcount_count_cy<9>  (
    .CI(Mcount_count_cy[8]),
    .DI(N1),
    .S(\Mcount_count_cy<9>_rt_218 ),
    .O(Mcount_count_cy[9])
  );
  XORCY   \Mcount_count_xor<9>  (
    .CI(Mcount_count_cy[8]),
    .LI(\Mcount_count_cy<9>_rt_218 ),
    .O(Result[9])
  );
  MUXCY   \Mcount_count_cy<10>  (
    .CI(Mcount_count_cy[9]),
    .DI(N1),
    .S(\Mcount_count_cy<10>_rt_219 ),
    .O(Mcount_count_cy[10])
  );
  XORCY   \Mcount_count_xor<10>  (
    .CI(Mcount_count_cy[9]),
    .LI(\Mcount_count_cy<10>_rt_219 ),
    .O(Result[10])
  );
  MUXCY   \Mcount_count_cy<11>  (
    .CI(Mcount_count_cy[10]),
    .DI(N1),
    .S(\Mcount_count_cy<11>_rt_220 ),
    .O(Mcount_count_cy[11])
  );
  XORCY   \Mcount_count_xor<11>  (
    .CI(Mcount_count_cy[10]),
    .LI(\Mcount_count_cy<11>_rt_220 ),
    .O(Result[11])
  );
  MUXCY   \Mcount_count_cy<12>  (
    .CI(Mcount_count_cy[11]),
    .DI(N1),
    .S(\Mcount_count_cy<12>_rt_221 ),
    .O(Mcount_count_cy[12])
  );
  XORCY   \Mcount_count_xor<12>  (
    .CI(Mcount_count_cy[11]),
    .LI(\Mcount_count_cy<12>_rt_221 ),
    .O(Result[12])
  );
  MUXCY   \Mcount_count_cy<13>  (
    .CI(Mcount_count_cy[12]),
    .DI(N1),
    .S(\Mcount_count_cy<13>_rt_222 ),
    .O(Mcount_count_cy[13])
  );
  XORCY   \Mcount_count_xor<13>  (
    .CI(Mcount_count_cy[12]),
    .LI(\Mcount_count_cy<13>_rt_222 ),
    .O(Result[13])
  );
  MUXCY   \Mcount_count_cy<14>  (
    .CI(Mcount_count_cy[13]),
    .DI(N1),
    .S(\Mcount_count_cy<14>_rt_223 ),
    .O(Mcount_count_cy[14])
  );
  XORCY   \Mcount_count_xor<14>  (
    .CI(Mcount_count_cy[13]),
    .LI(\Mcount_count_cy<14>_rt_223 ),
    .O(Result[14])
  );
  MUXCY   \Mcount_count_cy<15>  (
    .CI(Mcount_count_cy[14]),
    .DI(N1),
    .S(\Mcount_count_cy<15>_rt_224 ),
    .O(Mcount_count_cy[15])
  );
  XORCY   \Mcount_count_xor<15>  (
    .CI(Mcount_count_cy[14]),
    .LI(\Mcount_count_cy<15>_rt_224 ),
    .O(Result[15])
  );
  MUXCY   \Mcount_count_cy<16>  (
    .CI(Mcount_count_cy[15]),
    .DI(N1),
    .S(\Mcount_count_cy<16>_rt_225 ),
    .O(Mcount_count_cy[16])
  );
  XORCY   \Mcount_count_xor<16>  (
    .CI(Mcount_count_cy[15]),
    .LI(\Mcount_count_cy<16>_rt_225 ),
    .O(Result[16])
  );
  MUXCY   \Mcount_count_cy<17>  (
    .CI(Mcount_count_cy[16]),
    .DI(N1),
    .S(\Mcount_count_cy<17>_rt_226 ),
    .O(Mcount_count_cy[17])
  );
  XORCY   \Mcount_count_xor<17>  (
    .CI(Mcount_count_cy[16]),
    .LI(\Mcount_count_cy<17>_rt_226 ),
    .O(Result[17])
  );
  MUXCY   \Mcount_count_cy<18>  (
    .CI(Mcount_count_cy[17]),
    .DI(N1),
    .S(\Mcount_count_cy<18>_rt_227 ),
    .O(Mcount_count_cy[18])
  );
  XORCY   \Mcount_count_xor<18>  (
    .CI(Mcount_count_cy[17]),
    .LI(\Mcount_count_cy<18>_rt_227 ),
    .O(Result[18])
  );
  MUXCY   \Mcount_count_cy<19>  (
    .CI(Mcount_count_cy[18]),
    .DI(N1),
    .S(\Mcount_count_cy<19>_rt_228 ),
    .O(Mcount_count_cy[19])
  );
  XORCY   \Mcount_count_xor<19>  (
    .CI(Mcount_count_cy[18]),
    .LI(\Mcount_count_cy<19>_rt_228 ),
    .O(Result[19])
  );
  MUXCY   \Mcount_count_cy<20>  (
    .CI(Mcount_count_cy[19]),
    .DI(N1),
    .S(\Mcount_count_cy<20>_rt_229 ),
    .O(Mcount_count_cy[20])
  );
  XORCY   \Mcount_count_xor<20>  (
    .CI(Mcount_count_cy[19]),
    .LI(\Mcount_count_cy<20>_rt_229 ),
    .O(Result[20])
  );
  MUXCY   \Mcount_count_cy<21>  (
    .CI(Mcount_count_cy[20]),
    .DI(N1),
    .S(\Mcount_count_cy<21>_rt_230 ),
    .O(Mcount_count_cy[21])
  );
  XORCY   \Mcount_count_xor<21>  (
    .CI(Mcount_count_cy[20]),
    .LI(\Mcount_count_cy<21>_rt_230 ),
    .O(Result[21])
  );
  MUXCY   \Mcount_count_cy<22>  (
    .CI(Mcount_count_cy[21]),
    .DI(N1),
    .S(\Mcount_count_cy<22>_rt_231 ),
    .O(Mcount_count_cy[22])
  );
  XORCY   \Mcount_count_xor<22>  (
    .CI(Mcount_count_cy[21]),
    .LI(\Mcount_count_cy<22>_rt_231 ),
    .O(Result[22])
  );
  MUXCY   \Mcount_count_cy<23>  (
    .CI(Mcount_count_cy[22]),
    .DI(N1),
    .S(\Mcount_count_cy<23>_rt_232 ),
    .O(Mcount_count_cy[23])
  );
  XORCY   \Mcount_count_xor<23>  (
    .CI(Mcount_count_cy[22]),
    .LI(\Mcount_count_cy<23>_rt_232 ),
    .O(Result[23])
  );
  MUXCY   \Mcount_count_cy<24>  (
    .CI(Mcount_count_cy[23]),
    .DI(N1),
    .S(\Mcount_count_cy<24>_rt_233 ),
    .O(Mcount_count_cy[24])
  );
  XORCY   \Mcount_count_xor<24>  (
    .CI(Mcount_count_cy[23]),
    .LI(\Mcount_count_cy<24>_rt_233 ),
    .O(Result[24])
  );
  MUXCY   \Mcount_count_cy<25>  (
    .CI(Mcount_count_cy[24]),
    .DI(N1),
    .S(\Mcount_count_cy<25>_rt_234 ),
    .O(Mcount_count_cy[25])
  );
  XORCY   \Mcount_count_xor<25>  (
    .CI(Mcount_count_cy[24]),
    .LI(\Mcount_count_cy<25>_rt_234 ),
    .O(Result[25])
  );
  MUXCY   \Mcount_count_cy<26>  (
    .CI(Mcount_count_cy[25]),
    .DI(N1),
    .S(\Mcount_count_cy<26>_rt_235 ),
    .O(Mcount_count_cy[26])
  );
  XORCY   \Mcount_count_xor<26>  (
    .CI(Mcount_count_cy[25]),
    .LI(\Mcount_count_cy<26>_rt_235 ),
    .O(Result[26])
  );
  MUXCY   \Mcount_count_cy<27>  (
    .CI(Mcount_count_cy[26]),
    .DI(N1),
    .S(\Mcount_count_cy<27>_rt_236 ),
    .O(Mcount_count_cy[27])
  );
  XORCY   \Mcount_count_xor<27>  (
    .CI(Mcount_count_cy[26]),
    .LI(\Mcount_count_cy<27>_rt_236 ),
    .O(Result[27])
  );
  MUXCY   \Mcount_count_cy<28>  (
    .CI(Mcount_count_cy[27]),
    .DI(N1),
    .S(\Mcount_count_cy<28>_rt_237 ),
    .O(Mcount_count_cy[28])
  );
  XORCY   \Mcount_count_xor<28>  (
    .CI(Mcount_count_cy[27]),
    .LI(\Mcount_count_cy<28>_rt_237 ),
    .O(Result[28])
  );
  MUXCY   \Mcount_count_cy<29>  (
    .CI(Mcount_count_cy[28]),
    .DI(N1),
    .S(\Mcount_count_cy<29>_rt_238 ),
    .O(Mcount_count_cy[29])
  );
  XORCY   \Mcount_count_xor<29>  (
    .CI(Mcount_count_cy[28]),
    .LI(\Mcount_count_cy<29>_rt_238 ),
    .O(Result[29])
  );
  MUXCY   \Mcount_count_cy<30>  (
    .CI(Mcount_count_cy[29]),
    .DI(N1),
    .S(\Mcount_count_cy<30>_rt_239 ),
    .O(Mcount_count_cy[30])
  );
  XORCY   \Mcount_count_xor<30>  (
    .CI(Mcount_count_cy[29]),
    .LI(\Mcount_count_cy<30>_rt_239 ),
    .O(Result[30])
  );
  MUXCY   \Mcount_count_cy<31>  (
    .CI(Mcount_count_cy[30]),
    .DI(N1),
    .S(\Mcount_count_cy<31>_rt_240 ),
    .O(Mcount_count_cy[31])
  );
  XORCY   \Mcount_count_xor<31>  (
    .CI(Mcount_count_cy[30]),
    .LI(\Mcount_count_cy<31>_rt_240 ),
    .O(Result[31])
  );
  XORCY   \Mcount_count_xor<32>  (
    .CI(Mcount_count_cy[31]),
    .LI(\Mcount_count_xor<32>_rt_242 ),
    .O(Result[32])
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  \count[32]_GND_1_o_equal_3_o<32>1  (
    .I0(\count[32]_GND_1_o_add_1_OUT<3> ),
    .I1(\count[32]_GND_1_o_add_1_OUT<4> ),
    .I2(\count[32]_GND_1_o_add_1_OUT<5> ),
    .I3(\count[32]_GND_1_o_add_1_OUT<6> ),
    .I4(\count[32]_GND_1_o_add_1_OUT<8> ),
    .O(\count[32]_GND_1_o_equal_3_o<32> )
  );
  LUT6 #(
    .INIT ( 64'h0000004000000000 ))
  \count[32]_GND_1_o_equal_3_o<32>2  (
    .I0(\count[32]_GND_1_o_add_1_OUT<9> ),
    .I1(\count[32]_GND_1_o_add_1_OUT<20> ),
    .I2(\count[32]_GND_1_o_add_1_OUT<21> ),
    .I3(\count[32]_GND_1_o_add_1_OUT<31> ),
    .I4(\count[32]_GND_1_o_add_1_OUT<32> ),
    .I5(\count[32]_GND_1_o_equal_3_o<32> ),
    .O(\count[32]_GND_1_o_equal_3_o<32>1_171 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000010 ))
  \count[32]_GND_1_o_equal_3_o<32>3  (
    .I0(\count[32]_GND_1_o_add_1_OUT<1> ),
    .I1(\count[32]_GND_1_o_add_1_OUT<2> ),
    .I2(\count[32]_GND_1_o_add_1_OUT<25> ),
    .I3(\count[32]_GND_1_o_add_1_OUT<26> ),
    .I4(\count[32]_GND_1_o_add_1_OUT<27> ),
    .I5(\count[32]_GND_1_o_add_1_OUT<28> ),
    .O(\count[32]_GND_1_o_equal_3_o<32>2_172 )
  );
  LUT6 #(
    .INIT ( 64'h0000080000000000 ))
  \count[32]_GND_1_o_equal_3_o<32>4  (
    .I0(\count[32]_GND_1_o_add_1_OUT<14> ),
    .I1(\count[32]_GND_1_o_add_1_OUT<15> ),
    .I2(\count[32]_GND_1_o_add_1_OUT<16> ),
    .I3(\count[32]_GND_1_o_add_1_OUT<17> ),
    .I4(\count[32]_GND_1_o_add_1_OUT<18> ),
    .I5(\count[32]_GND_1_o_add_1_OUT<19> ),
    .O(\count[32]_GND_1_o_equal_3_o<32>3_173 )
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  \count[32]_GND_1_o_equal_3_o<32>5  (
    .I0(\count[32]_GND_1_o_add_1_OUT<29> ),
    .I1(\count[32]_GND_1_o_add_1_OUT<30> ),
    .O(\count[32]_GND_1_o_equal_3_o<32>4_174 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \count[32]_GND_1_o_equal_3_o<32>6  (
    .I0(\count[32]_GND_1_o_add_1_OUT<22> ),
    .I1(\count[32]_GND_1_o_add_1_OUT<23> ),
    .I2(\count[32]_GND_1_o_add_1_OUT<24> ),
    .O(\count[32]_GND_1_o_equal_3_o<32>5_175 )
  );
  LUT6 #(
    .INIT ( 64'h0004000000000000 ))
  \count[32]_GND_1_o_equal_3_o<32>7  (
    .I0(\count[32]_GND_1_o_add_1_OUT<0> ),
    .I1(\count[32]_GND_1_o_add_1_OUT<7> ),
    .I2(\count[32]_GND_1_o_add_1_OUT<10> ),
    .I3(\count[32]_GND_1_o_add_1_OUT<11> ),
    .I4(\count[32]_GND_1_o_add_1_OUT<12> ),
    .I5(\count[32]_GND_1_o_add_1_OUT<13> ),
    .O(\count[32]_GND_1_o_equal_3_o<32>6_176 )
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \count[32]_GND_1_o_equal_3_o<32>8  (
    .I0(\count[32]_GND_1_o_equal_3_o<32>6_176 ),
    .I1(\count[32]_GND_1_o_equal_3_o<32>5_175 ),
    .I2(\count[32]_GND_1_o_equal_3_o<32>4_174 ),
    .I3(\count[32]_GND_1_o_equal_3_o<32>3_173 ),
    .I4(\count[32]_GND_1_o_equal_3_o<32>2_172 ),
    .I5(\count[32]_GND_1_o_equal_3_o<32>1_171 ),
    .O(\count[32]_GND_1_o_equal_3_o )
  );
  OBUF   tick_OBUF (
    .I(tick_OBUF_1),
    .O(tick)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<1>_rt  (
    .I0(count[1]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<1>_rt_179 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<2>_rt  (
    .I0(count[2]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<2>_rt_180 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_rt  (
    .I0(count[3]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_rt_181 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<4>_rt  (
    .I0(count[4]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<4>_rt_182 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<5>_rt  (
    .I0(count[5]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<5>_rt_183 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<6>_rt  (
    .I0(count[6]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<6>_rt_184 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_rt  (
    .I0(count[7]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_rt_185 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<8>_rt  (
    .I0(count[8]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<8>_rt_186 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<9>_rt  (
    .I0(count[9]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<9>_rt_187 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<10>_rt  (
    .I0(count[10]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<10>_rt_188 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_rt  (
    .I0(count[11]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_rt_189 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<12>_rt  (
    .I0(count[12]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<12>_rt_190 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<13>_rt  (
    .I0(count[13]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<13>_rt_191 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<14>_rt  (
    .I0(count[14]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<14>_rt_192 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_rt  (
    .I0(count[15]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_rt_193 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<16>_rt  (
    .I0(count[16]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<16>_rt_194 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<17>_rt  (
    .I0(count[17]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<17>_rt_195 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<18>_rt  (
    .I0(count[18]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<18>_rt_196 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_rt  (
    .I0(count[19]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_rt_197 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<20>_rt  (
    .I0(count[20]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<20>_rt_198 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<21>_rt  (
    .I0(count[21]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<21>_rt_199 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<22>_rt  (
    .I0(count[22]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<22>_rt_200 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_rt  (
    .I0(count[23]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_rt_201 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<24>_rt  (
    .I0(count[24]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<24>_rt_202 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<25>_rt  (
    .I0(count[25]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<25>_rt_203 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<26>_rt  (
    .I0(count[26]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<26>_rt_204 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_rt  (
    .I0(count[27]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_rt_205 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<28>_rt  (
    .I0(count[28]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<28>_rt_206 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<29>_rt  (
    .I0(count[29]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<29>_rt_207 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<30>_rt  (
    .I0(count[30]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<30>_rt_208 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_rt  (
    .I0(count[31]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_rt_209 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<1>_rt  (
    .I0(count[1]),
    .O(\Mcount_count_cy<1>_rt_210 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<2>_rt  (
    .I0(count[2]),
    .O(\Mcount_count_cy<2>_rt_211 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<3>_rt  (
    .I0(count[3]),
    .O(\Mcount_count_cy<3>_rt_212 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<4>_rt  (
    .I0(count[4]),
    .O(\Mcount_count_cy<4>_rt_213 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<5>_rt  (
    .I0(count[5]),
    .O(\Mcount_count_cy<5>_rt_214 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<6>_rt  (
    .I0(count[6]),
    .O(\Mcount_count_cy<6>_rt_215 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<7>_rt  (
    .I0(count[7]),
    .O(\Mcount_count_cy<7>_rt_216 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<8>_rt  (
    .I0(count[8]),
    .O(\Mcount_count_cy<8>_rt_217 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<9>_rt  (
    .I0(count[9]),
    .O(\Mcount_count_cy<9>_rt_218 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<10>_rt  (
    .I0(count[10]),
    .O(\Mcount_count_cy<10>_rt_219 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<11>_rt  (
    .I0(count[11]),
    .O(\Mcount_count_cy<11>_rt_220 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<12>_rt  (
    .I0(count[12]),
    .O(\Mcount_count_cy<12>_rt_221 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<13>_rt  (
    .I0(count[13]),
    .O(\Mcount_count_cy<13>_rt_222 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<14>_rt  (
    .I0(count[14]),
    .O(\Mcount_count_cy<14>_rt_223 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<15>_rt  (
    .I0(count[15]),
    .O(\Mcount_count_cy<15>_rt_224 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<16>_rt  (
    .I0(count[16]),
    .O(\Mcount_count_cy<16>_rt_225 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<17>_rt  (
    .I0(count[17]),
    .O(\Mcount_count_cy<17>_rt_226 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<18>_rt  (
    .I0(count[18]),
    .O(\Mcount_count_cy<18>_rt_227 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<19>_rt  (
    .I0(count[19]),
    .O(\Mcount_count_cy<19>_rt_228 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<20>_rt  (
    .I0(count[20]),
    .O(\Mcount_count_cy<20>_rt_229 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<21>_rt  (
    .I0(count[21]),
    .O(\Mcount_count_cy<21>_rt_230 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<22>_rt  (
    .I0(count[22]),
    .O(\Mcount_count_cy<22>_rt_231 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<23>_rt  (
    .I0(count[23]),
    .O(\Mcount_count_cy<23>_rt_232 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<24>_rt  (
    .I0(count[24]),
    .O(\Mcount_count_cy<24>_rt_233 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<25>_rt  (
    .I0(count[25]),
    .O(\Mcount_count_cy<25>_rt_234 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<26>_rt  (
    .I0(count[26]),
    .O(\Mcount_count_cy<26>_rt_235 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<27>_rt  (
    .I0(count[27]),
    .O(\Mcount_count_cy<27>_rt_236 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<28>_rt  (
    .I0(count[28]),
    .O(\Mcount_count_cy<28>_rt_237 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<29>_rt  (
    .I0(count[29]),
    .O(\Mcount_count_cy<29>_rt_238 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<30>_rt  (
    .I0(count[30]),
    .O(\Mcount_count_cy<30>_rt_239 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_cy<31>_rt  (
    .I0(count[31]),
    .O(\Mcount_count_cy<31>_rt_240 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_rt  (
    .I0(count[32]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_rt_241 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \Mcount_count_xor<32>_rt  (
    .I0(count[32]),
    .O(\Mcount_count_xor<32>_rt_242 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_0_rstpot (
    .I0(Result[0]),
    .I1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_0_rstpot_243)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_0 (
    .C(clk_BUFGP_0),
    .D(count_0_rstpot_243),
    .Q(count[0])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_1_rstpot (
    .I0(Result[1]),
    .I1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_1_rstpot_244)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_1 (
    .C(clk_BUFGP_0),
    .D(count_1_rstpot_244),
    .Q(count[1])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_2_rstpot (
    .I0(Result[2]),
    .I1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_2_rstpot_245)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_2 (
    .C(clk_BUFGP_0),
    .D(count_2_rstpot_245),
    .Q(count[2])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_3_rstpot (
    .I0(Result[3]),
    .I1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_3_rstpot_246)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_3 (
    .C(clk_BUFGP_0),
    .D(count_3_rstpot_246),
    .Q(count[3])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_4_rstpot (
    .I0(Result[4]),
    .I1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_4_rstpot_247)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_4 (
    .C(clk_BUFGP_0),
    .D(count_4_rstpot_247),
    .Q(count[4])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_5_rstpot (
    .I0(Result[5]),
    .I1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_5_rstpot_248)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_5 (
    .C(clk_BUFGP_0),
    .D(count_5_rstpot_248),
    .Q(count[5])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_6_rstpot (
    .I0(Result[6]),
    .I1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_6_rstpot_249)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_6 (
    .C(clk_BUFGP_0),
    .D(count_6_rstpot_249),
    .Q(count[6])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_7_rstpot (
    .I0(Result[7]),
    .I1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_7_rstpot_250)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_7 (
    .C(clk_BUFGP_0),
    .D(count_7_rstpot_250),
    .Q(count[7])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_8_rstpot (
    .I0(Result[8]),
    .I1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_8_rstpot_251)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_8 (
    .C(clk_BUFGP_0),
    .D(count_8_rstpot_251),
    .Q(count[8])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_9_rstpot (
    .I0(Result[9]),
    .I1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_9_rstpot_252)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_9 (
    .C(clk_BUFGP_0),
    .D(count_9_rstpot_252),
    .Q(count[9])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_10_rstpot (
    .I0(Result[10]),
    .I1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_10_rstpot_253)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_10 (
    .C(clk_BUFGP_0),
    .D(count_10_rstpot_253),
    .Q(count[10])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_11_rstpot (
    .I0(Result[11]),
    .I1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_11_rstpot_254)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_11 (
    .C(clk_BUFGP_0),
    .D(count_11_rstpot_254),
    .Q(count[11])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_12_rstpot (
    .I0(Result[12]),
    .I1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_12_rstpot_255)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_12 (
    .C(clk_BUFGP_0),
    .D(count_12_rstpot_255),
    .Q(count[12])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_13_rstpot (
    .I0(Result[13]),
    .I1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_13_rstpot_256)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_13 (
    .C(clk_BUFGP_0),
    .D(count_13_rstpot_256),
    .Q(count[13])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_14_rstpot (
    .I0(Result[14]),
    .I1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_14_rstpot_257)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_14 (
    .C(clk_BUFGP_0),
    .D(count_14_rstpot_257),
    .Q(count[14])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_15_rstpot (
    .I0(Result[15]),
    .I1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_15_rstpot_258)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_15 (
    .C(clk_BUFGP_0),
    .D(count_15_rstpot_258),
    .Q(count[15])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_16_rstpot (
    .I0(Result[16]),
    .I1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_16_rstpot_259)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_16 (
    .C(clk_BUFGP_0),
    .D(count_16_rstpot_259),
    .Q(count[16])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_17_rstpot (
    .I0(Result[17]),
    .I1(\count[32]_GND_1_o_equal_3_o<32>8_276 ),
    .O(count_17_rstpot_260)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_17 (
    .C(clk_BUFGP_0),
    .D(count_17_rstpot_260),
    .Q(count[17])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_18_rstpot (
    .I0(Result[18]),
    .I1(\count[32]_GND_1_o_equal_3_o<32>8_276 ),
    .O(count_18_rstpot_261)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_18 (
    .C(clk_BUFGP_0),
    .D(count_18_rstpot_261),
    .Q(count[18])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_19_rstpot (
    .I0(Result[19]),
    .I1(\count[32]_GND_1_o_equal_3_o<32>8_276 ),
    .O(count_19_rstpot_262)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_19 (
    .C(clk_BUFGP_0),
    .D(count_19_rstpot_262),
    .Q(count[19])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_20_rstpot (
    .I0(Result[20]),
    .I1(\count[32]_GND_1_o_equal_3_o<32>8_276 ),
    .O(count_20_rstpot_263)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_20 (
    .C(clk_BUFGP_0),
    .D(count_20_rstpot_263),
    .Q(count[20])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_21_rstpot (
    .I0(Result[21]),
    .I1(\count[32]_GND_1_o_equal_3_o<32>8_276 ),
    .O(count_21_rstpot_264)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_21 (
    .C(clk_BUFGP_0),
    .D(count_21_rstpot_264),
    .Q(count[21])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_22_rstpot (
    .I0(Result[22]),
    .I1(\count[32]_GND_1_o_equal_3_o<32>8_276 ),
    .O(count_22_rstpot_265)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_22 (
    .C(clk_BUFGP_0),
    .D(count_22_rstpot_265),
    .Q(count[22])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_23_rstpot (
    .I0(Result[23]),
    .I1(\count[32]_GND_1_o_equal_3_o<32>8_276 ),
    .O(count_23_rstpot_266)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_23 (
    .C(clk_BUFGP_0),
    .D(count_23_rstpot_266),
    .Q(count[23])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_24_rstpot (
    .I0(Result[24]),
    .I1(\count[32]_GND_1_o_equal_3_o<32>8_276 ),
    .O(count_24_rstpot_267)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_24 (
    .C(clk_BUFGP_0),
    .D(count_24_rstpot_267),
    .Q(count[24])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_25_rstpot (
    .I0(Result[25]),
    .I1(\count[32]_GND_1_o_equal_3_o<32>8_276 ),
    .O(count_25_rstpot_268)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_25 (
    .C(clk_BUFGP_0),
    .D(count_25_rstpot_268),
    .Q(count[25])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_26_rstpot (
    .I0(Result[26]),
    .I1(\count[32]_GND_1_o_equal_3_o<32>8_276 ),
    .O(count_26_rstpot_269)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_26 (
    .C(clk_BUFGP_0),
    .D(count_26_rstpot_269),
    .Q(count[26])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_27_rstpot (
    .I0(Result[27]),
    .I1(\count[32]_GND_1_o_equal_3_o<32>8_276 ),
    .O(count_27_rstpot_270)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_27 (
    .C(clk_BUFGP_0),
    .D(count_27_rstpot_270),
    .Q(count[27])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_28_rstpot (
    .I0(Result[28]),
    .I1(\count[32]_GND_1_o_equal_3_o<32>8_276 ),
    .O(count_28_rstpot_271)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_28 (
    .C(clk_BUFGP_0),
    .D(count_28_rstpot_271),
    .Q(count[28])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_29_rstpot (
    .I0(Result[29]),
    .I1(\count[32]_GND_1_o_equal_3_o<32>8_276 ),
    .O(count_29_rstpot_272)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_29 (
    .C(clk_BUFGP_0),
    .D(count_29_rstpot_272),
    .Q(count[29])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_30_rstpot (
    .I0(Result[30]),
    .I1(\count[32]_GND_1_o_equal_3_o<32>8_276 ),
    .O(count_30_rstpot_273)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_30 (
    .C(clk_BUFGP_0),
    .D(count_30_rstpot_273),
    .Q(count[30])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_31_rstpot (
    .I0(Result[31]),
    .I1(\count[32]_GND_1_o_equal_3_o<32>8_276 ),
    .O(count_31_rstpot_274)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_31 (
    .C(clk_BUFGP_0),
    .D(count_31_rstpot_274),
    .Q(count[31])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  count_32_rstpot (
    .I0(Result[32]),
    .I1(\count[32]_GND_1_o_equal_3_o<32>8_276 ),
    .O(count_32_rstpot_275)
  );
  FD #(
    .INIT ( 1'b0 ))
  count_32 (
    .C(clk_BUFGP_0),
    .D(count_32_rstpot_275),
    .Q(count[32])
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \count[32]_GND_1_o_equal_3_o<32>8_1  (
    .I0(\count[32]_GND_1_o_equal_3_o<32>6_176 ),
    .I1(\count[32]_GND_1_o_equal_3_o<32>5_175 ),
    .I2(\count[32]_GND_1_o_equal_3_o<32>4_174 ),
    .I3(\count[32]_GND_1_o_equal_3_o<32>3_173 ),
    .I4(\count[32]_GND_1_o_equal_3_o<32>2_172 ),
    .I5(\count[32]_GND_1_o_equal_3_o<32>1_171 ),
    .O(\count[32]_GND_1_o_equal_3_o<32>8_276 )
  );
  BUFGP   clk_BUFGP (
    .I(clk),
    .O(clk_BUFGP_0)
  );
  INV   \Madd_count[32]_GND_1_o_add_1_OUT_lut<0>_INV_0  (
    .I(count[0]),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_lut<0> )
  );
  INV   \Mcount_count_lut<0>_INV_0  (
    .I(count[0]),
    .O(Mcount_count_lut[0])
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

