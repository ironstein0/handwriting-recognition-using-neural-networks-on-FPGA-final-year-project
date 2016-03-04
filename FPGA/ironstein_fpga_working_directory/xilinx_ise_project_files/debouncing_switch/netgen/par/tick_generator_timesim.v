////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: M.70d
//  \   \         Application: netgen
//  /   /         Filename: tick_generator_timesim.v
// /___/   /\     Timestamp: Wed Mar 02 09:50:36 2016
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -s 3 -pcf tick_generator.pcf -sdf_anno true -sdf_path netgen/par -insert_glbl true -insert_pp_buffers true -w -dir netgen/par -ofmt verilog -sim tick_generator.ncd tick_generator_timesim.v 
// Device	: 6slx9csg324-3 (PRELIMINARY 1.12c 2010-09-15)
// Input file	: tick_generator.ncd
// Output file	: E:\projects_working_directory\debouncing_switch\netgen\par\tick_generator_timesim.v
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
  wire \count[32]_GND_1_o_add_1_OUT<0>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<1>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<2>_0 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_572 ;
  wire \count[32]_GND_1_o_add_1_OUT<3>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<4>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<5>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<6>_0 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_582 ;
  wire \count[32]_GND_1_o_add_1_OUT<7>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<8>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<9>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<10>_0 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_591 ;
  wire \count[32]_GND_1_o_add_1_OUT<11>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<12>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<13>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<14>_0 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_600 ;
  wire \count[32]_GND_1_o_add_1_OUT<15>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<16>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<17>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<18>_0 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_609 ;
  wire \count[32]_GND_1_o_add_1_OUT<19>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<20>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<21>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<22>_0 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_618 ;
  wire \count[32]_GND_1_o_add_1_OUT<23>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<24>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<25>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<26>_0 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_627 ;
  wire \count[32]_GND_1_o_add_1_OUT<27>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<28>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<29>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<30>_0 ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_636 ;
  wire \count[32]_GND_1_o_add_1_OUT<31>_0 ;
  wire \count[32]_GND_1_o_add_1_OUT<32>_0 ;
  wire \Result<0>_0 ;
  wire \Result<1>_0 ;
  wire \Result<2>_0 ;
  wire \Mcount_count_cy[3] ;
  wire \Result<3>_0 ;
  wire \Result<4>_0 ;
  wire \Result<5>_0 ;
  wire \Result<6>_0 ;
  wire \Mcount_count_cy[7] ;
  wire \Result<7>_0 ;
  wire \Result<8>_0 ;
  wire \Result<9>_0 ;
  wire \Result<10>_0 ;
  wire \Mcount_count_cy[11] ;
  wire \Result<11>_0 ;
  wire \Result<12>_0 ;
  wire \Result<13>_0 ;
  wire \Result<14>_0 ;
  wire \Mcount_count_cy[15] ;
  wire \Result<15>_0 ;
  wire \Result<16>_0 ;
  wire \Result<17>_0 ;
  wire \Result<18>_0 ;
  wire \Mcount_count_cy[19] ;
  wire \Result<19>_0 ;
  wire \Result<20>_0 ;
  wire \Result<21>_0 ;
  wire \Result<22>_0 ;
  wire \Mcount_count_cy[23] ;
  wire \Result<23>_0 ;
  wire \Result<24>_0 ;
  wire \Result<25>_0 ;
  wire \Result<26>_0 ;
  wire \Mcount_count_cy[27] ;
  wire \Result<27>_0 ;
  wire \Result<28>_0 ;
  wire \Result<29>_0 ;
  wire \Result<30>_0 ;
  wire \Mcount_count_cy[31] ;
  wire \Result<31>_0 ;
  wire \Result<32>_0 ;
  wire \clk_BUFGP/IBUFG_0 ;
  wire tick_OBUF_683;
  wire clk_BUFGP;
  wire \count[32]_GND_1_o_equal_3_o ;
  wire \count[32]_GND_1_o_equal_3_o<32>6_686 ;
  wire \count[32]_GND_1_o_equal_3_o<32>5_687 ;
  wire \count[32]_GND_1_o_equal_3_o<32>4_688 ;
  wire \count[32]_GND_1_o_equal_3_o<32>3_689 ;
  wire \count[32]_GND_1_o_equal_3_o<32>2_690 ;
  wire \count[32]_GND_1_o_equal_3_o<32>1_691 ;
  wire \count[32]_GND_1_o_equal_3_o<32>8_692 ;
  wire \count[32]_GND_1_o_equal_3_o<32> ;
  wire \Madd_count[32]_GND_1_o_add_1_OUT_lut<0> ;
  wire \count<1>_rt_12 ;
  wire \count<2>_rt_9 ;
  wire \count[32]_GND_1_o_add_1_OUT<0> ;
  wire \count[32]_GND_1_o_add_1_OUT<1> ;
  wire \count[32]_GND_1_o_add_1_OUT<2> ;
  wire \count[32]_GND_1_o_add_1_OUT<3> ;
  wire \ProtoComp0.CYINITGND.0 ;
  wire \count<3>_rt_0 ;
  wire \count<4>_rt_37 ;
  wire \count<5>_rt_34 ;
  wire \count<6>_rt_31 ;
  wire \count[32]_GND_1_o_add_1_OUT<4> ;
  wire \count[32]_GND_1_o_add_1_OUT<5> ;
  wire \count[32]_GND_1_o_add_1_OUT<6> ;
  wire \count[32]_GND_1_o_add_1_OUT<7> ;
  wire \count<7>_rt_22 ;
  wire \count<8>_rt_59 ;
  wire \count<9>_rt_56 ;
  wire \count<10>_rt_53 ;
  wire \count[32]_GND_1_o_add_1_OUT<8> ;
  wire \count[32]_GND_1_o_add_1_OUT<9> ;
  wire \count[32]_GND_1_o_add_1_OUT<10> ;
  wire \count[32]_GND_1_o_add_1_OUT<11> ;
  wire \count<11>_rt_44 ;
  wire \count<12>_rt_81 ;
  wire \count<13>_rt_78 ;
  wire \count<14>_rt_75 ;
  wire \count[32]_GND_1_o_add_1_OUT<12> ;
  wire \count[32]_GND_1_o_add_1_OUT<13> ;
  wire \count[32]_GND_1_o_add_1_OUT<14> ;
  wire \count[32]_GND_1_o_add_1_OUT<15> ;
  wire \count<15>_rt_66 ;
  wire \count<16>_rt_103 ;
  wire \count<17>_rt_100 ;
  wire \count<18>_rt_97 ;
  wire \count[32]_GND_1_o_add_1_OUT<16> ;
  wire \count[32]_GND_1_o_add_1_OUT<17> ;
  wire \count[32]_GND_1_o_add_1_OUT<18> ;
  wire \count[32]_GND_1_o_add_1_OUT<19> ;
  wire \count<19>_rt_88 ;
  wire \count<20>_rt_125 ;
  wire \count<21>_rt_122 ;
  wire \count<22>_rt_119 ;
  wire \count[32]_GND_1_o_add_1_OUT<20> ;
  wire \count[32]_GND_1_o_add_1_OUT<21> ;
  wire \count[32]_GND_1_o_add_1_OUT<22> ;
  wire \count[32]_GND_1_o_add_1_OUT<23> ;
  wire \count<23>_rt_110 ;
  wire \count<24>_rt_147 ;
  wire \count<25>_rt_144 ;
  wire \count<26>_rt_141 ;
  wire \count[32]_GND_1_o_add_1_OUT<24> ;
  wire \count[32]_GND_1_o_add_1_OUT<25> ;
  wire \count[32]_GND_1_o_add_1_OUT<26> ;
  wire \count[32]_GND_1_o_add_1_OUT<27> ;
  wire \count<27>_rt_132 ;
  wire \count<28>_rt_169 ;
  wire \count<29>_rt_166 ;
  wire \count<30>_rt_163 ;
  wire \count[32]_GND_1_o_add_1_OUT<28> ;
  wire \count[32]_GND_1_o_add_1_OUT<29> ;
  wire \count[32]_GND_1_o_add_1_OUT<30> ;
  wire \count[32]_GND_1_o_add_1_OUT<31> ;
  wire \count<31>_rt_154 ;
  wire \count<32>_rt_178 ;
  wire \count[32]_GND_1_o_add_1_OUT<32> ;
  wire \Mcount_count_cy<3>/count<1>_rt ;
  wire \Mcount_count_cy<3>/count<2>_rt ;
  wire \Mcount_count_cy<3>/ProtoComp0.CYINITGND.0 ;
  wire \Mcount_count_cy<3>/count<3>_rt ;
  wire \Mcount_count_cy<7>/count<4>_rt ;
  wire \Mcount_count_cy<7>/count<5>_rt ;
  wire \Mcount_count_cy<7>/count<6>_rt ;
  wire \Mcount_count_cy<7>/count<7>_rt ;
  wire \Mcount_count_cy<11>/count<8>_rt ;
  wire \Mcount_count_cy<11>/count<9>_rt ;
  wire \Mcount_count_cy<11>/count<10>_rt ;
  wire \Mcount_count_cy<11>/count<11>_rt ;
  wire \Mcount_count_cy<15>/count<12>_rt ;
  wire \Mcount_count_cy<15>/count<13>_rt ;
  wire \Mcount_count_cy<15>/count<14>_rt ;
  wire \Mcount_count_cy<15>/count<15>_rt ;
  wire \Mcount_count_cy<19>/count<16>_rt ;
  wire \Mcount_count_cy<19>/count<17>_rt ;
  wire \Mcount_count_cy<19>/count<18>_rt ;
  wire \Mcount_count_cy<19>/count<19>_rt ;
  wire \Mcount_count_cy<23>/count<20>_rt ;
  wire \Mcount_count_cy<23>/count<21>_rt ;
  wire \Mcount_count_cy<23>/count<22>_rt ;
  wire \Mcount_count_cy<23>/count<23>_rt ;
  wire \Mcount_count_cy<27>/count<24>_rt ;
  wire \Mcount_count_cy<27>/count<25>_rt ;
  wire \Mcount_count_cy<27>/count<26>_rt ;
  wire \Mcount_count_cy<27>/count<27>_rt ;
  wire \Mcount_count_cy<31>/count<28>_rt ;
  wire \Mcount_count_cy<31>/count<29>_rt ;
  wire \Mcount_count_cy<31>/count<30>_rt ;
  wire \Mcount_count_cy<31>/count<31>_rt ;
  wire \Result<32>/count<32>_rt ;
  wire \clk_BUFGP/IBUFG_361 ;
  wire count_1_rstpot_385;
  wire count_2_rstpot_381;
  wire count_0_rstpot_370;
  wire count_3_rstpot_445;
  wire count_4_rstpot_438;
  wire count_5_rstpot_437;
  wire count_6_rstpot_430;
  wire count_7_rstpot_462;
  wire count_8_rstpot_455;
  wire count_9_rstpot_454;
  wire count_10_rstpot_447;
  wire count_11_rstpot_479;
  wire count_12_rstpot_472;
  wire count_13_rstpot_471;
  wire count_14_rstpot_464;
  wire count_15_rstpot_498;
  wire count_16_rstpot_492;
  wire count_17_rstpot_480;
  wire count_22_rstpot_516;
  wire count_23_rstpot_509;
  wire count_24_rstpot_508;
  wire count_25_rstpot_501;
  wire count_26_rstpot_533;
  wire count_27_rstpot_526;
  wire count_28_rstpot_525;
  wire count_29_rstpot_518;
  wire count_30_rstpot_544;
  wire count_31_rstpot_540;
  wire count_32_rstpot_536;
  wire count_18_rstpot_563;
  wire count_19_rstpot_556;
  wire count_20_rstpot_555;
  wire count_21_rstpot_548;
  wire \NlwBufferSignal_tick_OBUF/I ;
  wire \NlwBufferSignal_clk_BUFGP/BUFG/IN ;
  wire \NlwBufferSignal_count_2/CLK ;
  wire \NlwBufferSignal_count_1/CLK ;
  wire \NlwBufferSignal_tick/CLK ;
  wire \NlwBufferSignal_count_0/CLK ;
  wire \NlwBufferSignal_count_6/CLK ;
  wire \NlwBufferSignal_count_5/CLK ;
  wire \NlwBufferSignal_count_4/CLK ;
  wire \NlwBufferSignal_count_3/CLK ;
  wire \NlwBufferSignal_count_10/CLK ;
  wire \NlwBufferSignal_count_9/CLK ;
  wire \NlwBufferSignal_count_8/CLK ;
  wire \NlwBufferSignal_count_7/CLK ;
  wire \NlwBufferSignal_count_14/CLK ;
  wire \NlwBufferSignal_count_13/CLK ;
  wire \NlwBufferSignal_count_12/CLK ;
  wire \NlwBufferSignal_count_11/CLK ;
  wire \NlwBufferSignal_count_17/CLK ;
  wire \NlwBufferSignal_count_16/CLK ;
  wire \NlwBufferSignal_count_15/CLK ;
  wire \NlwBufferSignal_count_25/CLK ;
  wire \NlwBufferSignal_count_24/CLK ;
  wire \NlwBufferSignal_count_23/CLK ;
  wire \NlwBufferSignal_count_22/CLK ;
  wire \NlwBufferSignal_count_29/CLK ;
  wire \NlwBufferSignal_count_28/CLK ;
  wire \NlwBufferSignal_count_27/CLK ;
  wire \NlwBufferSignal_count_26/CLK ;
  wire \NlwBufferSignal_count_32/CLK ;
  wire \NlwBufferSignal_count_31/CLK ;
  wire \NlwBufferSignal_count_30/CLK ;
  wire \NlwBufferSignal_count_21/CLK ;
  wire \NlwBufferSignal_count_20/CLK ;
  wire \NlwBufferSignal_count_19/CLK ;
  wire \NlwBufferSignal_count_18/CLK ;
  wire \NLW_N1_5.D5LUT_O_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_CO[0]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_CO[1]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_CO[2]_UNCONNECTED ;
  wire \NLW_N1_4.C5LUT_O_UNCONNECTED ;
  wire \NLW_N1_3.B5LUT_O_UNCONNECTED ;
  wire \NLW_N0.A5LUT_O_UNCONNECTED ;
  wire \NLW_N1_9.D5LUT_O_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_CO[0]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_CO[1]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_CO[2]_UNCONNECTED ;
  wire \NLW_N1_8.C5LUT_O_UNCONNECTED ;
  wire \NLW_N1_7.B5LUT_O_UNCONNECTED ;
  wire \NLW_N1_6.A5LUT_O_UNCONNECTED ;
  wire \NLW_N1_13.D5LUT_O_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_CO[0]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_CO[1]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_CO[2]_UNCONNECTED ;
  wire \NLW_N1_12.C5LUT_O_UNCONNECTED ;
  wire \NLW_N1_11.B5LUT_O_UNCONNECTED ;
  wire \NLW_N1_10.A5LUT_O_UNCONNECTED ;
  wire \NLW_N1_17.D5LUT_O_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_CO[0]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_CO[1]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_CO[2]_UNCONNECTED ;
  wire \NLW_N1_16.C5LUT_O_UNCONNECTED ;
  wire \NLW_N1_15.B5LUT_O_UNCONNECTED ;
  wire \NLW_N1_14.A5LUT_O_UNCONNECTED ;
  wire \NLW_N1_21.D5LUT_O_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_CO[0]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_CO[1]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_CO[2]_UNCONNECTED ;
  wire \NLW_N1_20.C5LUT_O_UNCONNECTED ;
  wire \NLW_N1_19.B5LUT_O_UNCONNECTED ;
  wire \NLW_N1_18.A5LUT_O_UNCONNECTED ;
  wire \NLW_N1_25.D5LUT_O_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_CO[0]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_CO[1]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_CO[2]_UNCONNECTED ;
  wire \NLW_N1_24.C5LUT_O_UNCONNECTED ;
  wire \NLW_N1_23.B5LUT_O_UNCONNECTED ;
  wire \NLW_N1_22.A5LUT_O_UNCONNECTED ;
  wire \NLW_N1_29.D5LUT_O_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_CO[0]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_CO[1]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_CO[2]_UNCONNECTED ;
  wire \NLW_N1_28.C5LUT_O_UNCONNECTED ;
  wire \NLW_N1_27.B5LUT_O_UNCONNECTED ;
  wire \NLW_N1_26.A5LUT_O_UNCONNECTED ;
  wire \NLW_N1_33.D5LUT_O_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_CO[0]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_CO[1]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_CO[2]_UNCONNECTED ;
  wire \NLW_N1_32.C5LUT_O_UNCONNECTED ;
  wire \NLW_N1_31.B5LUT_O_UNCONNECTED ;
  wire \NLW_N1_30.A5LUT_O_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_CO[0]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_CO[1]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_CO[2]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_CO[3]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_DI[0]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_DI[1]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_DI[2]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_DI[3]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_O[1]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_O[2]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_O[3]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_S[1]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_S[2]_UNCONNECTED ;
  wire \NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_S[3]_UNCONNECTED ;
  wire \NLW_N1_38.D5LUT_O_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<3>_CO[0]_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<3>_CO[1]_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<3>_CO[2]_UNCONNECTED ;
  wire \NLW_N1_37.C5LUT_O_UNCONNECTED ;
  wire \NLW_N1_36.B5LUT_O_UNCONNECTED ;
  wire \NLW_N0_2.A5LUT_O_UNCONNECTED ;
  wire \NLW_N1_42.D5LUT_O_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<7>_CO[0]_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<7>_CO[1]_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<7>_CO[2]_UNCONNECTED ;
  wire \NLW_N1_41.C5LUT_O_UNCONNECTED ;
  wire \NLW_N1_40.B5LUT_O_UNCONNECTED ;
  wire \NLW_N1_39.A5LUT_O_UNCONNECTED ;
  wire \NLW_N1_46.D5LUT_O_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<11>_CO[0]_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<11>_CO[1]_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<11>_CO[2]_UNCONNECTED ;
  wire \NLW_N1_45.C5LUT_O_UNCONNECTED ;
  wire \NLW_N1_44.B5LUT_O_UNCONNECTED ;
  wire \NLW_N1_43.A5LUT_O_UNCONNECTED ;
  wire \NLW_N1_50.D5LUT_O_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<15>_CO[0]_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<15>_CO[1]_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<15>_CO[2]_UNCONNECTED ;
  wire \NLW_N1_49.C5LUT_O_UNCONNECTED ;
  wire \NLW_N1_48.B5LUT_O_UNCONNECTED ;
  wire \NLW_N1_47.A5LUT_O_UNCONNECTED ;
  wire \NLW_N1_54.D5LUT_O_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<19>_CO[0]_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<19>_CO[1]_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<19>_CO[2]_UNCONNECTED ;
  wire \NLW_N1_53.C5LUT_O_UNCONNECTED ;
  wire \NLW_N1_52.B5LUT_O_UNCONNECTED ;
  wire \NLW_N1_51.A5LUT_O_UNCONNECTED ;
  wire \NLW_N1_58.D5LUT_O_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<23>_CO[0]_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<23>_CO[1]_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<23>_CO[2]_UNCONNECTED ;
  wire \NLW_N1_57.C5LUT_O_UNCONNECTED ;
  wire \NLW_N1_56.B5LUT_O_UNCONNECTED ;
  wire \NLW_N1_55.A5LUT_O_UNCONNECTED ;
  wire \NLW_N1_62.D5LUT_O_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<27>_CO[0]_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<27>_CO[1]_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<27>_CO[2]_UNCONNECTED ;
  wire \NLW_N1_61.C5LUT_O_UNCONNECTED ;
  wire \NLW_N1_60.B5LUT_O_UNCONNECTED ;
  wire \NLW_N1_59.A5LUT_O_UNCONNECTED ;
  wire \NLW_N1_66.D5LUT_O_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<31>_CO[0]_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<31>_CO[1]_UNCONNECTED ;
  wire \NLW_Mcount_count_cy<31>_CO[2]_UNCONNECTED ;
  wire \NLW_N1_65.C5LUT_O_UNCONNECTED ;
  wire \NLW_N1_64.B5LUT_O_UNCONNECTED ;
  wire \NLW_N1_63.A5LUT_O_UNCONNECTED ;
  wire \NLW_Mcount_count_xor<32>_CO[0]_UNCONNECTED ;
  wire \NLW_Mcount_count_xor<32>_CO[1]_UNCONNECTED ;
  wire \NLW_Mcount_count_xor<32>_CO[2]_UNCONNECTED ;
  wire \NLW_Mcount_count_xor<32>_CO[3]_UNCONNECTED ;
  wire \NLW_Mcount_count_xor<32>_DI[0]_UNCONNECTED ;
  wire \NLW_Mcount_count_xor<32>_DI[1]_UNCONNECTED ;
  wire \NLW_Mcount_count_xor<32>_DI[2]_UNCONNECTED ;
  wire \NLW_Mcount_count_xor<32>_DI[3]_UNCONNECTED ;
  wire \NLW_Mcount_count_xor<32>_O[1]_UNCONNECTED ;
  wire \NLW_Mcount_count_xor<32>_O[2]_UNCONNECTED ;
  wire \NLW_Mcount_count_xor<32>_O[3]_UNCONNECTED ;
  wire \NLW_Mcount_count_xor<32>_S[1]_UNCONNECTED ;
  wire \NLW_Mcount_count_xor<32>_S[2]_UNCONNECTED ;
  wire \NLW_Mcount_count_xor<32>_S[3]_UNCONNECTED ;
  wire VCC;
  wire GND;
  wire [32 : 0] count;
  wire [0 : 0] Mcount_count_lut;
  wire [32 : 0] Result;
  initial $sdf_annotate("netgen/par/tick_generator_timesim.sdf");
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<3>/Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_DMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<3> ),
    .O(\count[32]_GND_1_o_add_1_OUT<3>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<3>/Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_CMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<2> ),
    .O(\count[32]_GND_1_o_add_1_OUT<2>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<3>/Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_BMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<1> ),
    .O(\count[32]_GND_1_o_add_1_OUT<1>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<3>/Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_AMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<0> ),
    .O(\count[32]_GND_1_o_add_1_OUT<0>_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y17" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<3>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[3]),
    .ADR5(1'b1),
    .O(\count<3>_rt_0 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y17" ),
    .INIT ( 32'h00000000 ))
  \N1_5.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_5.D5LUT_O_UNCONNECTED )
  );
  X_ZERO #(
    .LOC ( "SLICE_X4Y17" ))
  \ProtoComp0.CYINITGND  (
    .O(\ProtoComp0.CYINITGND.0 )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X4Y17" ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<3>  (
    .CI(1'b0),
    .CYINIT(\ProtoComp0.CYINITGND.0 ),
    .CO({\Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_572 , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_CO[2]_UNCONNECTED , 
\NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_CO[1]_UNCONNECTED , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b1}),
    .O({\count[32]_GND_1_o_add_1_OUT<3> , \count[32]_GND_1_o_add_1_OUT<2> , \count[32]_GND_1_o_add_1_OUT<1> , \count[32]_GND_1_o_add_1_OUT<0> }),
    .S({\count<3>_rt_0 , \count<2>_rt_9 , \count<1>_rt_12 , \Madd_count[32]_GND_1_o_add_1_OUT_lut<0> })
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y17" ),
    .INIT ( 64'hF0F0F0F0F0F0F0F0 ))
  \count<2>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR4(1'b1),
    .ADR3(1'b1),
    .ADR2(count[2]),
    .ADR5(1'b1),
    .O(\count<2>_rt_9 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y17" ),
    .INIT ( 32'h00000000 ))
  \N1_4.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_4.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y17" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \count<1>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR3(count[1]),
    .ADR5(1'b1),
    .O(\count<1>_rt_12 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y17" ),
    .INIT ( 32'h00000000 ))
  \N1_3.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_3.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y17" ),
    .INIT ( 64'h0000FFFF0000FFFF ))
  \Madd_count[32]_GND_1_o_add_1_OUT_lut<0>_INV_0  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[0]),
    .ADR5(1'b1),
    .O(\Madd_count[32]_GND_1_o_add_1_OUT_lut<0> )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y17" ),
    .INIT ( 32'hFFFFFFFF ))
  \N0.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0.A5LUT_O_UNCONNECTED )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<7>/Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_DMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<7> ),
    .O(\count[32]_GND_1_o_add_1_OUT<7>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<7>/Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_CMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<6> ),
    .O(\count[32]_GND_1_o_add_1_OUT<6>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<7>/Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_BMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<5> ),
    .O(\count[32]_GND_1_o_add_1_OUT<5>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<7>/Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_AMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<4> ),
    .O(\count[32]_GND_1_o_add_1_OUT<4>_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y18" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<7>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[7]),
    .ADR5(1'b1),
    .O(\count<7>_rt_22 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y18" ),
    .INIT ( 32'h00000000 ))
  \N1_9.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_9.D5LUT_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X4Y18" ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<7>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<3>_572 ),
    .CYINIT(1'b0),
    .CO({\Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_582 , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_CO[2]_UNCONNECTED , 
\NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_CO[1]_UNCONNECTED , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({\count[32]_GND_1_o_add_1_OUT<7> , \count[32]_GND_1_o_add_1_OUT<6> , \count[32]_GND_1_o_add_1_OUT<5> , \count[32]_GND_1_o_add_1_OUT<4> }),
    .S({\count<7>_rt_22 , \count<6>_rt_31 , \count<5>_rt_34 , \count<4>_rt_37 })
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y18" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<6>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[6]),
    .ADR5(1'b1),
    .O(\count<6>_rt_31 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y18" ),
    .INIT ( 32'h00000000 ))
  \N1_8.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_8.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y18" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \count<5>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR3(count[5]),
    .ADR5(1'b1),
    .O(\count<5>_rt_34 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y18" ),
    .INIT ( 32'h00000000 ))
  \N1_7.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_7.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y18" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<4>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[4]),
    .ADR5(1'b1),
    .O(\count<4>_rt_37 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y18" ),
    .INIT ( 32'h00000000 ))
  \N1_6.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_6.A5LUT_O_UNCONNECTED )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<11>/Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_DMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<11> ),
    .O(\count[32]_GND_1_o_add_1_OUT<11>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<11>/Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_CMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<10> ),
    .O(\count[32]_GND_1_o_add_1_OUT<10>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<11>/Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_BMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<9> ),
    .O(\count[32]_GND_1_o_add_1_OUT<9>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<11>/Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_AMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<8> ),
    .O(\count[32]_GND_1_o_add_1_OUT<8>_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y19" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<11>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[11]),
    .ADR5(1'b1),
    .O(\count<11>_rt_44 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y19" ),
    .INIT ( 32'h00000000 ))
  \N1_13.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_13.D5LUT_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X4Y19" ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<11>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<7>_582 ),
    .CYINIT(1'b0),
    .CO({\Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_591 , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_CO[2]_UNCONNECTED , 
\NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_CO[1]_UNCONNECTED , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({\count[32]_GND_1_o_add_1_OUT<11> , \count[32]_GND_1_o_add_1_OUT<10> , \count[32]_GND_1_o_add_1_OUT<9> , \count[32]_GND_1_o_add_1_OUT<8> }),
    .S({\count<11>_rt_44 , \count<10>_rt_53 , \count<9>_rt_56 , \count<8>_rt_59 })
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y19" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<10>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[10]),
    .ADR5(1'b1),
    .O(\count<10>_rt_53 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y19" ),
    .INIT ( 32'h00000000 ))
  \N1_12.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_12.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y19" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \count<9>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR3(count[9]),
    .ADR5(1'b1),
    .O(\count<9>_rt_56 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y19" ),
    .INIT ( 32'h00000000 ))
  \N1_11.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_11.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y19" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<8>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[8]),
    .ADR5(1'b1),
    .O(\count<8>_rt_59 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y19" ),
    .INIT ( 32'h00000000 ))
  \N1_10.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_10.A5LUT_O_UNCONNECTED )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<15>/Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_DMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<15> ),
    .O(\count[32]_GND_1_o_add_1_OUT<15>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<15>/Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_CMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<14> ),
    .O(\count[32]_GND_1_o_add_1_OUT<14>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<15>/Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_BMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<13> ),
    .O(\count[32]_GND_1_o_add_1_OUT<13>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<15>/Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_AMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<12> ),
    .O(\count[32]_GND_1_o_add_1_OUT<12>_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y20" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<15>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[15]),
    .ADR5(1'b1),
    .O(\count<15>_rt_66 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y20" ),
    .INIT ( 32'h00000000 ))
  \N1_17.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_17.D5LUT_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X4Y20" ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<15>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<11>_591 ),
    .CYINIT(1'b0),
    .CO({\Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_600 , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_CO[2]_UNCONNECTED , 
\NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_CO[1]_UNCONNECTED , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({\count[32]_GND_1_o_add_1_OUT<15> , \count[32]_GND_1_o_add_1_OUT<14> , \count[32]_GND_1_o_add_1_OUT<13> , \count[32]_GND_1_o_add_1_OUT<12> }),
    .S({\count<15>_rt_66 , \count<14>_rt_75 , \count<13>_rt_78 , \count<12>_rt_81 })
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y20" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<14>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[14]),
    .ADR5(1'b1),
    .O(\count<14>_rt_75 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y20" ),
    .INIT ( 32'h00000000 ))
  \N1_16.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_16.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y20" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \count<13>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR3(count[13]),
    .ADR5(1'b1),
    .O(\count<13>_rt_78 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y20" ),
    .INIT ( 32'h00000000 ))
  \N1_15.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_15.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y20" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<12>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[12]),
    .ADR5(1'b1),
    .O(\count<12>_rt_81 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y20" ),
    .INIT ( 32'h00000000 ))
  \N1_14.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_14.A5LUT_O_UNCONNECTED )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<19>/Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_DMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<19> ),
    .O(\count[32]_GND_1_o_add_1_OUT<19>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<19>/Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_CMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<18> ),
    .O(\count[32]_GND_1_o_add_1_OUT<18>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<19>/Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_BMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<17> ),
    .O(\count[32]_GND_1_o_add_1_OUT<17>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<19>/Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_AMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<16> ),
    .O(\count[32]_GND_1_o_add_1_OUT<16>_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y21" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<19>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[19]),
    .ADR5(1'b1),
    .O(\count<19>_rt_88 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y21" ),
    .INIT ( 32'h00000000 ))
  \N1_21.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_21.D5LUT_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X4Y21" ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<19>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<15>_600 ),
    .CYINIT(1'b0),
    .CO({\Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_609 , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_CO[2]_UNCONNECTED , 
\NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_CO[1]_UNCONNECTED , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({\count[32]_GND_1_o_add_1_OUT<19> , \count[32]_GND_1_o_add_1_OUT<18> , \count[32]_GND_1_o_add_1_OUT<17> , \count[32]_GND_1_o_add_1_OUT<16> }),
    .S({\count<19>_rt_88 , \count<18>_rt_97 , \count<17>_rt_100 , \count<16>_rt_103 })
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y21" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<18>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[18]),
    .ADR5(1'b1),
    .O(\count<18>_rt_97 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y21" ),
    .INIT ( 32'h00000000 ))
  \N1_20.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_20.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y21" ),
    .INIT ( 64'hF0F0F0F0F0F0F0F0 ))
  \count<17>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR4(1'b1),
    .ADR3(1'b1),
    .ADR2(count[17]),
    .ADR5(1'b1),
    .O(\count<17>_rt_100 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y21" ),
    .INIT ( 32'h00000000 ))
  \N1_19.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_19.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y21" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<16>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[16]),
    .ADR5(1'b1),
    .O(\count<16>_rt_103 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y21" ),
    .INIT ( 32'h00000000 ))
  \N1_18.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_18.A5LUT_O_UNCONNECTED )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<23>/Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_DMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<23> ),
    .O(\count[32]_GND_1_o_add_1_OUT<23>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<23>/Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_CMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<22> ),
    .O(\count[32]_GND_1_o_add_1_OUT<22>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<23>/Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_BMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<21> ),
    .O(\count[32]_GND_1_o_add_1_OUT<21>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<23>/Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_AMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<20> ),
    .O(\count[32]_GND_1_o_add_1_OUT<20>_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y22" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<23>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[23]),
    .ADR5(1'b1),
    .O(\count<23>_rt_110 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y22" ),
    .INIT ( 32'h00000000 ))
  \N1_25.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_25.D5LUT_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X4Y22" ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<23>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<19>_609 ),
    .CYINIT(1'b0),
    .CO({\Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_618 , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_CO[2]_UNCONNECTED , 
\NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_CO[1]_UNCONNECTED , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({\count[32]_GND_1_o_add_1_OUT<23> , \count[32]_GND_1_o_add_1_OUT<22> , \count[32]_GND_1_o_add_1_OUT<21> , \count[32]_GND_1_o_add_1_OUT<20> }),
    .S({\count<23>_rt_110 , \count<22>_rt_119 , \count<21>_rt_122 , \count<20>_rt_125 })
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y22" ),
    .INIT ( 64'hF0F0F0F0F0F0F0F0 ))
  \count<22>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR4(1'b1),
    .ADR3(1'b1),
    .ADR2(count[22]),
    .ADR5(1'b1),
    .O(\count<22>_rt_119 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y22" ),
    .INIT ( 32'h00000000 ))
  \N1_24.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_24.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y22" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \count<21>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR3(count[21]),
    .ADR5(1'b1),
    .O(\count<21>_rt_122 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y22" ),
    .INIT ( 32'h00000000 ))
  \N1_23.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_23.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y22" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<20>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[20]),
    .ADR5(1'b1),
    .O(\count<20>_rt_125 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y22" ),
    .INIT ( 32'h00000000 ))
  \N1_22.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_22.A5LUT_O_UNCONNECTED )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<27>/Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_DMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<27> ),
    .O(\count[32]_GND_1_o_add_1_OUT<27>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<27>/Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_CMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<26> ),
    .O(\count[32]_GND_1_o_add_1_OUT<26>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<27>/Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_BMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<25> ),
    .O(\count[32]_GND_1_o_add_1_OUT<25>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<27>/Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_AMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<24> ),
    .O(\count[32]_GND_1_o_add_1_OUT<24>_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y23" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<27>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[27]),
    .ADR5(1'b1),
    .O(\count<27>_rt_132 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y23" ),
    .INIT ( 32'h00000000 ))
  \N1_29.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_29.D5LUT_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X4Y23" ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<27>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<23>_618 ),
    .CYINIT(1'b0),
    .CO({\Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_627 , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_CO[2]_UNCONNECTED , 
\NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_CO[1]_UNCONNECTED , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({\count[32]_GND_1_o_add_1_OUT<27> , \count[32]_GND_1_o_add_1_OUT<26> , \count[32]_GND_1_o_add_1_OUT<25> , \count[32]_GND_1_o_add_1_OUT<24> }),
    .S({\count<27>_rt_132 , \count<26>_rt_141 , \count<25>_rt_144 , \count<24>_rt_147 })
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y23" ),
    .INIT ( 64'hF0F0F0F0F0F0F0F0 ))
  \count<26>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR4(1'b1),
    .ADR3(1'b1),
    .ADR2(count[26]),
    .ADR5(1'b1),
    .O(\count<26>_rt_141 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y23" ),
    .INIT ( 32'h00000000 ))
  \N1_28.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_28.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y23" ),
    .INIT ( 64'hCCCCCCCCCCCCCCCC ))
  \count<25>_rt  (
    .ADR0(1'b1),
    .ADR4(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR1(count[25]),
    .ADR5(1'b1),
    .O(\count<25>_rt_144 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y23" ),
    .INIT ( 32'h00000000 ))
  \N1_27.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_27.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y23" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \count<24>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR3(count[24]),
    .ADR5(1'b1),
    .O(\count<24>_rt_147 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y23" ),
    .INIT ( 32'h00000000 ))
  \N1_26.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_26.A5LUT_O_UNCONNECTED )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<31>/Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_DMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<31> ),
    .O(\count[32]_GND_1_o_add_1_OUT<31>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<31>/Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_CMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<30> ),
    .O(\count[32]_GND_1_o_add_1_OUT<30>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<31>/Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_BMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<29> ),
    .O(\count[32]_GND_1_o_add_1_OUT<29>_0 )
  );
  X_BUF   \Madd_count[32]_GND_1_o_add_1_OUT_cy<31>/Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_AMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<28> ),
    .O(\count[32]_GND_1_o_add_1_OUT<28>_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y24" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<31>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[31]),
    .ADR5(1'b1),
    .O(\count<31>_rt_154 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y24" ),
    .INIT ( 32'h00000000 ))
  \N1_33.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_33.D5LUT_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X4Y24" ))
  \Madd_count[32]_GND_1_o_add_1_OUT_cy<31>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<27>_627 ),
    .CYINIT(1'b0),
    .CO({\Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_636 , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_CO[2]_UNCONNECTED , 
\NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_CO[1]_UNCONNECTED , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({\count[32]_GND_1_o_add_1_OUT<31> , \count[32]_GND_1_o_add_1_OUT<30> , \count[32]_GND_1_o_add_1_OUT<29> , \count[32]_GND_1_o_add_1_OUT<28> }),
    .S({\count<31>_rt_154 , \count<30>_rt_163 , \count<29>_rt_166 , \count<28>_rt_169 })
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y24" ),
    .INIT ( 64'hF0F0F0F0F0F0F0F0 ))
  \count<30>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR4(1'b1),
    .ADR3(1'b1),
    .ADR2(count[30]),
    .ADR5(1'b1),
    .O(\count<30>_rt_163 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y24" ),
    .INIT ( 32'h00000000 ))
  \N1_32.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_32.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y24" ),
    .INIT ( 64'hCCCCCCCCCCCCCCCC ))
  \count<29>_rt  (
    .ADR0(1'b1),
    .ADR4(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR1(count[29]),
    .ADR5(1'b1),
    .O(\count<29>_rt_166 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y24" ),
    .INIT ( 32'h00000000 ))
  \N1_31.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_31.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y24" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \count<28>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR3(count[28]),
    .ADR5(1'b1),
    .O(\count<28>_rt_169 )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X4Y24" ),
    .INIT ( 32'h00000000 ))
  \N1_30.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_30.A5LUT_O_UNCONNECTED )
  );
  X_BUF   \count[32]_GND_1_o_add_1_OUT<32>/count[32]_GND_1_o_add_1_OUT<32>_AMUX_Delay  (
    .I(\count[32]_GND_1_o_add_1_OUT<32> ),
    .O(\count[32]_GND_1_o_add_1_OUT<32>_0 )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X4Y25" ))
  \Madd_count[32]_GND_1_o_add_1_OUT_xor<32>  (
    .CI(\Madd_count[32]_GND_1_o_add_1_OUT_cy<31>_636 ),
    .CYINIT(1'b0),
    .CO({\NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_CO[3]_UNCONNECTED , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_CO[2]_UNCONNECTED , 
\NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_CO[1]_UNCONNECTED , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_CO[0]_UNCONNECTED }),
    .DI({\NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_DI[3]_UNCONNECTED , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_DI[2]_UNCONNECTED , 
\NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_DI[1]_UNCONNECTED , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_DI[0]_UNCONNECTED }),
    .O({\NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_O[3]_UNCONNECTED , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_O[2]_UNCONNECTED , 
\NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_O[1]_UNCONNECTED , \count[32]_GND_1_o_add_1_OUT<32> }),
    .S({\NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_S[3]_UNCONNECTED , \NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_S[2]_UNCONNECTED , 
\NLW_Madd_count[32]_GND_1_o_add_1_OUT_xor<32>_S[1]_UNCONNECTED , \count<32>_rt_178 })
  );
  X_LUT6 #(
    .LOC ( "SLICE_X4Y25" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \count<32>_rt  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR5(1'b1),
    .ADR4(1'b1),
    .ADR3(count[32]),
    .O(\count<32>_rt_178 )
  );
  X_BUF   \Mcount_count_cy<3>/Mcount_count_cy<3>_DMUX_Delay  (
    .I(Result[3]),
    .O(\Result<3>_0 )
  );
  X_BUF   \Mcount_count_cy<3>/Mcount_count_cy<3>_CMUX_Delay  (
    .I(Result[2]),
    .O(\Result<2>_0 )
  );
  X_BUF   \Mcount_count_cy<3>/Mcount_count_cy<3>_BMUX_Delay  (
    .I(Result[1]),
    .O(\Result<1>_0 )
  );
  X_BUF   \Mcount_count_cy<3>/Mcount_count_cy<3>_AMUX_Delay  (
    .I(Result[0]),
    .O(\Result<0>_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y18" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<3>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[3]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<3>/count<3>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y18" ),
    .INIT ( 32'h00000000 ))
  \N1_38.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_38.D5LUT_O_UNCONNECTED )
  );
  X_ZERO #(
    .LOC ( "SLICE_X6Y18" ))
  \ProtoComp0.CYINITGND.1  (
    .O(\Mcount_count_cy<3>/ProtoComp0.CYINITGND.0 )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X6Y18" ))
  \Mcount_count_cy<3>  (
    .CI(1'b0),
    .CYINIT(\Mcount_count_cy<3>/ProtoComp0.CYINITGND.0 ),
    .CO({\Mcount_count_cy[3] , \NLW_Mcount_count_cy<3>_CO[2]_UNCONNECTED , \NLW_Mcount_count_cy<3>_CO[1]_UNCONNECTED , 
\NLW_Mcount_count_cy<3>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b1}),
    .O({Result[3], Result[2], Result[1], Result[0]}),
    .S({\Mcount_count_cy<3>/count<3>_rt , \Mcount_count_cy<3>/count<2>_rt , \Mcount_count_cy<3>/count<1>_rt , Mcount_count_lut[0]})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y18" ),
    .INIT ( 64'hF0F0F0F0F0F0F0F0 ))
  \count<2>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR4(1'b1),
    .ADR3(1'b1),
    .ADR2(count[2]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<3>/count<2>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y18" ),
    .INIT ( 32'h00000000 ))
  \N1_37.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_37.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y18" ),
    .INIT ( 64'hF0F0F0F0F0F0F0F0 ))
  \count<1>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR4(1'b1),
    .ADR3(1'b1),
    .ADR2(count[1]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<3>/count<1>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y18" ),
    .INIT ( 32'h00000000 ))
  \N1_36.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_36.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y18" ),
    .INIT ( 64'h0000FFFF0000FFFF ))
  \Mcount_count_lut<0>_INV_0  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[0]),
    .ADR5(1'b1),
    .O(Mcount_count_lut[0])
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y18" ),
    .INIT ( 32'hFFFFFFFF ))
  \N0_2.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N0_2.A5LUT_O_UNCONNECTED )
  );
  X_BUF   \Mcount_count_cy<7>/Mcount_count_cy<7>_DMUX_Delay  (
    .I(Result[7]),
    .O(\Result<7>_0 )
  );
  X_BUF   \Mcount_count_cy<7>/Mcount_count_cy<7>_CMUX_Delay  (
    .I(Result[6]),
    .O(\Result<6>_0 )
  );
  X_BUF   \Mcount_count_cy<7>/Mcount_count_cy<7>_BMUX_Delay  (
    .I(Result[5]),
    .O(\Result<5>_0 )
  );
  X_BUF   \Mcount_count_cy<7>/Mcount_count_cy<7>_AMUX_Delay  (
    .I(Result[4]),
    .O(\Result<4>_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y19" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<7>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[7]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<7>/count<7>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y19" ),
    .INIT ( 32'h00000000 ))
  \N1_42.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_42.D5LUT_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X6Y19" ))
  \Mcount_count_cy<7>  (
    .CI(\Mcount_count_cy[3] ),
    .CYINIT(1'b0),
    .CO({\Mcount_count_cy[7] , \NLW_Mcount_count_cy<7>_CO[2]_UNCONNECTED , \NLW_Mcount_count_cy<7>_CO[1]_UNCONNECTED , 
\NLW_Mcount_count_cy<7>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({Result[7], Result[6], Result[5], Result[4]}),
    .S({\Mcount_count_cy<7>/count<7>_rt , \Mcount_count_cy<7>/count<6>_rt , \Mcount_count_cy<7>/count<5>_rt , \Mcount_count_cy<7>/count<4>_rt })
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y19" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<6>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[6]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<7>/count<6>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y19" ),
    .INIT ( 32'h00000000 ))
  \N1_41.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_41.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y19" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \count<5>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR3(count[5]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<7>/count<5>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y19" ),
    .INIT ( 32'h00000000 ))
  \N1_40.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_40.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y19" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<4>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[4]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<7>/count<4>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y19" ),
    .INIT ( 32'h00000000 ))
  \N1_39.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_39.A5LUT_O_UNCONNECTED )
  );
  X_BUF   \Mcount_count_cy<11>/Mcount_count_cy<11>_DMUX_Delay  (
    .I(Result[11]),
    .O(\Result<11>_0 )
  );
  X_BUF   \Mcount_count_cy<11>/Mcount_count_cy<11>_CMUX_Delay  (
    .I(Result[10]),
    .O(\Result<10>_0 )
  );
  X_BUF   \Mcount_count_cy<11>/Mcount_count_cy<11>_BMUX_Delay  (
    .I(Result[9]),
    .O(\Result<9>_0 )
  );
  X_BUF   \Mcount_count_cy<11>/Mcount_count_cy<11>_AMUX_Delay  (
    .I(Result[8]),
    .O(\Result<8>_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y20" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<11>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[11]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<11>/count<11>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y20" ),
    .INIT ( 32'h00000000 ))
  \N1_46.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_46.D5LUT_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X6Y20" ))
  \Mcount_count_cy<11>  (
    .CI(\Mcount_count_cy[7] ),
    .CYINIT(1'b0),
    .CO({\Mcount_count_cy[11] , \NLW_Mcount_count_cy<11>_CO[2]_UNCONNECTED , \NLW_Mcount_count_cy<11>_CO[1]_UNCONNECTED , 
\NLW_Mcount_count_cy<11>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({Result[11], Result[10], Result[9], Result[8]}),
    .S({\Mcount_count_cy<11>/count<11>_rt , \Mcount_count_cy<11>/count<10>_rt , \Mcount_count_cy<11>/count<9>_rt , \Mcount_count_cy<11>/count<8>_rt })
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y20" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<10>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[10]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<11>/count<10>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y20" ),
    .INIT ( 32'h00000000 ))
  \N1_45.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_45.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y20" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \count<9>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR3(count[9]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<11>/count<9>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y20" ),
    .INIT ( 32'h00000000 ))
  \N1_44.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_44.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y20" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<8>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[8]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<11>/count<8>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y20" ),
    .INIT ( 32'h00000000 ))
  \N1_43.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_43.A5LUT_O_UNCONNECTED )
  );
  X_BUF   \Mcount_count_cy<15>/Mcount_count_cy<15>_DMUX_Delay  (
    .I(Result[15]),
    .O(\Result<15>_0 )
  );
  X_BUF   \Mcount_count_cy<15>/Mcount_count_cy<15>_CMUX_Delay  (
    .I(Result[14]),
    .O(\Result<14>_0 )
  );
  X_BUF   \Mcount_count_cy<15>/Mcount_count_cy<15>_BMUX_Delay  (
    .I(Result[13]),
    .O(\Result<13>_0 )
  );
  X_BUF   \Mcount_count_cy<15>/Mcount_count_cy<15>_AMUX_Delay  (
    .I(Result[12]),
    .O(\Result<12>_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y21" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<15>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[15]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<15>/count<15>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y21" ),
    .INIT ( 32'h00000000 ))
  \N1_50.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_50.D5LUT_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X6Y21" ))
  \Mcount_count_cy<15>  (
    .CI(\Mcount_count_cy[11] ),
    .CYINIT(1'b0),
    .CO({\Mcount_count_cy[15] , \NLW_Mcount_count_cy<15>_CO[2]_UNCONNECTED , \NLW_Mcount_count_cy<15>_CO[1]_UNCONNECTED , 
\NLW_Mcount_count_cy<15>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({Result[15], Result[14], Result[13], Result[12]}),
    .S({\Mcount_count_cy<15>/count<15>_rt , \Mcount_count_cy<15>/count<14>_rt , \Mcount_count_cy<15>/count<13>_rt , \Mcount_count_cy<15>/count<12>_rt 
})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y21" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<14>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[14]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<15>/count<14>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y21" ),
    .INIT ( 32'h00000000 ))
  \N1_49.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_49.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y21" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \count<13>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR3(count[13]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<15>/count<13>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y21" ),
    .INIT ( 32'h00000000 ))
  \N1_48.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_48.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y21" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<12>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[12]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<15>/count<12>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y21" ),
    .INIT ( 32'h00000000 ))
  \N1_47.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_47.A5LUT_O_UNCONNECTED )
  );
  X_BUF   \Mcount_count_cy<19>/Mcount_count_cy<19>_DMUX_Delay  (
    .I(Result[19]),
    .O(\Result<19>_0 )
  );
  X_BUF   \Mcount_count_cy<19>/Mcount_count_cy<19>_CMUX_Delay  (
    .I(Result[18]),
    .O(\Result<18>_0 )
  );
  X_BUF   \Mcount_count_cy<19>/Mcount_count_cy<19>_BMUX_Delay  (
    .I(Result[17]),
    .O(\Result<17>_0 )
  );
  X_BUF   \Mcount_count_cy<19>/Mcount_count_cy<19>_AMUX_Delay  (
    .I(Result[16]),
    .O(\Result<16>_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y22" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<19>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[19]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<19>/count<19>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y22" ),
    .INIT ( 32'h00000000 ))
  \N1_54.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_54.D5LUT_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X6Y22" ))
  \Mcount_count_cy<19>  (
    .CI(\Mcount_count_cy[15] ),
    .CYINIT(1'b0),
    .CO({\Mcount_count_cy[19] , \NLW_Mcount_count_cy<19>_CO[2]_UNCONNECTED , \NLW_Mcount_count_cy<19>_CO[1]_UNCONNECTED , 
\NLW_Mcount_count_cy<19>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({Result[19], Result[18], Result[17], Result[16]}),
    .S({\Mcount_count_cy<19>/count<19>_rt , \Mcount_count_cy<19>/count<18>_rt , \Mcount_count_cy<19>/count<17>_rt , \Mcount_count_cy<19>/count<16>_rt 
})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y22" ),
    .INIT ( 64'hF0F0F0F0F0F0F0F0 ))
  \count<18>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR4(1'b1),
    .ADR3(1'b1),
    .ADR2(count[18]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<19>/count<18>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y22" ),
    .INIT ( 32'h00000000 ))
  \N1_53.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_53.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y22" ),
    .INIT ( 64'hAAAAAAAAAAAAAAAA ))
  \count<17>_rt.1  (
    .ADR4(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR0(count[17]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<19>/count<17>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y22" ),
    .INIT ( 32'h00000000 ))
  \N1_52.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_52.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y22" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<16>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[16]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<19>/count<16>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y22" ),
    .INIT ( 32'h00000000 ))
  \N1_51.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_51.A5LUT_O_UNCONNECTED )
  );
  X_BUF   \Mcount_count_cy<23>/Mcount_count_cy<23>_DMUX_Delay  (
    .I(Result[23]),
    .O(\Result<23>_0 )
  );
  X_BUF   \Mcount_count_cy<23>/Mcount_count_cy<23>_CMUX_Delay  (
    .I(Result[22]),
    .O(\Result<22>_0 )
  );
  X_BUF   \Mcount_count_cy<23>/Mcount_count_cy<23>_BMUX_Delay  (
    .I(Result[21]),
    .O(\Result<21>_0 )
  );
  X_BUF   \Mcount_count_cy<23>/Mcount_count_cy<23>_AMUX_Delay  (
    .I(Result[20]),
    .O(\Result<20>_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y23" ),
    .INIT ( 64'hAAAAAAAAAAAAAAAA ))
  \count<23>_rt.1  (
    .ADR4(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR0(count[23]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<23>/count<23>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y23" ),
    .INIT ( 32'h00000000 ))
  \N1_58.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_58.D5LUT_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X6Y23" ))
  \Mcount_count_cy<23>  (
    .CI(\Mcount_count_cy[19] ),
    .CYINIT(1'b0),
    .CO({\Mcount_count_cy[23] , \NLW_Mcount_count_cy<23>_CO[2]_UNCONNECTED , \NLW_Mcount_count_cy<23>_CO[1]_UNCONNECTED , 
\NLW_Mcount_count_cy<23>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({Result[23], Result[22], Result[21], Result[20]}),
    .S({\Mcount_count_cy<23>/count<23>_rt , \Mcount_count_cy<23>/count<22>_rt , \Mcount_count_cy<23>/count<21>_rt , \Mcount_count_cy<23>/count<20>_rt 
})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y23" ),
    .INIT ( 64'hAAAAAAAAAAAAAAAA ))
  \count<22>_rt.1  (
    .ADR4(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR0(count[22]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<23>/count<22>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y23" ),
    .INIT ( 32'h00000000 ))
  \N1_57.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_57.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y23" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<21>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[21]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<23>/count<21>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y23" ),
    .INIT ( 32'h00000000 ))
  \N1_56.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_56.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y23" ),
    .INIT ( 64'hFFFF0000FFFF0000 ))
  \count<20>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(count[20]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<23>/count<20>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y23" ),
    .INIT ( 32'h00000000 ))
  \N1_55.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_55.A5LUT_O_UNCONNECTED )
  );
  X_BUF   \Mcount_count_cy<27>/Mcount_count_cy<27>_DMUX_Delay  (
    .I(Result[27]),
    .O(\Result<27>_0 )
  );
  X_BUF   \Mcount_count_cy<27>/Mcount_count_cy<27>_CMUX_Delay  (
    .I(Result[26]),
    .O(\Result<26>_0 )
  );
  X_BUF   \Mcount_count_cy<27>/Mcount_count_cy<27>_BMUX_Delay  (
    .I(Result[25]),
    .O(\Result<25>_0 )
  );
  X_BUF   \Mcount_count_cy<27>/Mcount_count_cy<27>_AMUX_Delay  (
    .I(Result[24]),
    .O(\Result<24>_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y24" ),
    .INIT ( 64'hAAAAAAAAAAAAAAAA ))
  \count<27>_rt.1  (
    .ADR4(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR0(count[27]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<27>/count<27>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y24" ),
    .INIT ( 32'h00000000 ))
  \N1_62.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_62.D5LUT_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X6Y24" ))
  \Mcount_count_cy<27>  (
    .CI(\Mcount_count_cy[23] ),
    .CYINIT(1'b0),
    .CO({\Mcount_count_cy[27] , \NLW_Mcount_count_cy<27>_CO[2]_UNCONNECTED , \NLW_Mcount_count_cy<27>_CO[1]_UNCONNECTED , 
\NLW_Mcount_count_cy<27>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({Result[27], Result[26], Result[25], Result[24]}),
    .S({\Mcount_count_cy<27>/count<27>_rt , \Mcount_count_cy<27>/count<26>_rt , \Mcount_count_cy<27>/count<25>_rt , \Mcount_count_cy<27>/count<24>_rt 
})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y24" ),
    .INIT ( 64'hAAAAAAAAAAAAAAAA ))
  \count<26>_rt.1  (
    .ADR4(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR0(count[26]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<27>/count<26>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y24" ),
    .INIT ( 32'h00000000 ))
  \N1_61.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_61.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y24" ),
    .INIT ( 64'hF0F0F0F0F0F0F0F0 ))
  \count<25>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR4(1'b1),
    .ADR3(1'b1),
    .ADR2(count[25]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<27>/count<25>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y24" ),
    .INIT ( 32'h00000000 ))
  \N1_60.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_60.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y24" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \count<24>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR3(count[24]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<27>/count<24>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y24" ),
    .INIT ( 32'h00000000 ))
  \N1_59.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_59.A5LUT_O_UNCONNECTED )
  );
  X_BUF   \Mcount_count_cy<31>/Mcount_count_cy<31>_DMUX_Delay  (
    .I(Result[31]),
    .O(\Result<31>_0 )
  );
  X_BUF   \Mcount_count_cy<31>/Mcount_count_cy<31>_CMUX_Delay  (
    .I(Result[30]),
    .O(\Result<30>_0 )
  );
  X_BUF   \Mcount_count_cy<31>/Mcount_count_cy<31>_BMUX_Delay  (
    .I(Result[29]),
    .O(\Result<29>_0 )
  );
  X_BUF   \Mcount_count_cy<31>/Mcount_count_cy<31>_AMUX_Delay  (
    .I(Result[28]),
    .O(\Result<28>_0 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y25" ),
    .INIT ( 64'hAAAAAAAAAAAAAAAA ))
  \count<31>_rt.1  (
    .ADR4(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR0(count[31]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<31>/count<31>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y25" ),
    .INIT ( 32'h00000000 ))
  \N1_66.D5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_66.D5LUT_O_UNCONNECTED )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X6Y25" ))
  \Mcount_count_cy<31>  (
    .CI(\Mcount_count_cy[27] ),
    .CYINIT(1'b0),
    .CO({\Mcount_count_cy[31] , \NLW_Mcount_count_cy<31>_CO[2]_UNCONNECTED , \NLW_Mcount_count_cy<31>_CO[1]_UNCONNECTED , 
\NLW_Mcount_count_cy<31>_CO[0]_UNCONNECTED }),
    .DI({1'b0, 1'b0, 1'b0, 1'b0}),
    .O({Result[31], Result[30], Result[29], Result[28]}),
    .S({\Mcount_count_cy<31>/count<31>_rt , \Mcount_count_cy<31>/count<30>_rt , \Mcount_count_cy<31>/count<29>_rt , \Mcount_count_cy<31>/count<28>_rt 
})
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y25" ),
    .INIT ( 64'hAAAAAAAAAAAAAAAA ))
  \count<30>_rt.1  (
    .ADR4(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR0(count[30]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<31>/count<30>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y25" ),
    .INIT ( 32'h00000000 ))
  \N1_65.C5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_65.C5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y25" ),
    .INIT ( 64'hF0F0F0F0F0F0F0F0 ))
  \count<29>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR4(1'b1),
    .ADR3(1'b1),
    .ADR2(count[29]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<31>/count<29>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y25" ),
    .INIT ( 32'h00000000 ))
  \N1_64.B5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_64.B5LUT_O_UNCONNECTED )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y25" ),
    .INIT ( 64'hCCCCCCCCCCCCCCCC ))
  \count<28>_rt.1  (
    .ADR0(1'b1),
    .ADR4(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR1(count[28]),
    .ADR5(1'b1),
    .O(\Mcount_count_cy<31>/count<28>_rt )
  );
  X_LUT5 #(
    .LOC ( "SLICE_X6Y25" ),
    .INIT ( 32'h00000000 ))
  \N1_63.A5LUT  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(1'b1),
    .O(\NLW_N1_63.A5LUT_O_UNCONNECTED )
  );
  X_BUF   \Result<32>/Result<32>_AMUX_Delay  (
    .I(Result[32]),
    .O(\Result<32>_0 )
  );
  X_CARRY4 #(
    .LOC ( "SLICE_X6Y26" ))
  \Mcount_count_xor<32>  (
    .CI(\Mcount_count_cy[31] ),
    .CYINIT(1'b0),
    .CO({\NLW_Mcount_count_xor<32>_CO[3]_UNCONNECTED , \NLW_Mcount_count_xor<32>_CO[2]_UNCONNECTED , \NLW_Mcount_count_xor<32>_CO[1]_UNCONNECTED , 
\NLW_Mcount_count_xor<32>_CO[0]_UNCONNECTED }),
    .DI({\NLW_Mcount_count_xor<32>_DI[3]_UNCONNECTED , \NLW_Mcount_count_xor<32>_DI[2]_UNCONNECTED , \NLW_Mcount_count_xor<32>_DI[1]_UNCONNECTED , 
\NLW_Mcount_count_xor<32>_DI[0]_UNCONNECTED }),
    .O({\NLW_Mcount_count_xor<32>_O[3]_UNCONNECTED , \NLW_Mcount_count_xor<32>_O[2]_UNCONNECTED , \NLW_Mcount_count_xor<32>_O[1]_UNCONNECTED , 
Result[32]}),
    .S({\NLW_Mcount_count_xor<32>_S[3]_UNCONNECTED , \NLW_Mcount_count_xor<32>_S[2]_UNCONNECTED , \NLW_Mcount_count_xor<32>_S[1]_UNCONNECTED , 
\Result<32>/count<32>_rt })
  );
  X_LUT6 #(
    .LOC ( "SLICE_X6Y26" ),
    .INIT ( 64'hFF00FF00FF00FF00 ))
  \count<32>_rt.1  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR5(1'b1),
    .ADR4(1'b1),
    .ADR3(count[32]),
    .O(\Result<32>/count<32>_rt )
  );
  X_IPAD #(
    .LOC ( "PAD172" ))
  clk_172 (
    .PAD(clk)
  );
  X_BUF #(
    .LOC ( "PAD172" ))
  \clk_BUFGP/IBUFG  (
    .O(\clk_BUFGP/IBUFG_361 ),
    .I(clk)
  );
  X_BUF #(
    .LOC ( "PAD172" ))
  \ProtoComp3.IMUX  (
    .I(\clk_BUFGP/IBUFG_361 ),
    .O(\clk_BUFGP/IBUFG_0 )
  );
  X_OPAD #(
    .LOC ( "PAD124" ))
  \tick.PAD  (
    .PAD(tick)
  );
  X_OBUF #(
    .LOC ( "PAD124" ))
  tick_OBUF (
    .I(\NlwBufferSignal_tick_OBUF/I ),
    .O(tick)
  );
  X_CKBUF #(
    .LOC ( "BUFGMUX_X3Y13" ))
  \clk_BUFGP/BUFG  (
    .I(\NlwBufferSignal_clk_BUFGP/BUFG/IN ),
    .O(clk_BUFGP)
  );
  X_FF #(
    .LOC ( "SLICE_X5Y18" ),
    .INIT ( 1'b0 ))
  count_2 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_2/CLK ),
    .I(count_2_rstpot_381),
    .O(count[2]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X5Y18" ),
    .INIT ( 64'h3300330033003300 ))
  count_2_rstpot (
    .ADR0(1'b1),
    .ADR5(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR3(\Result<2>_0 ),
    .ADR1(\count[32]_GND_1_o_equal_3_o ),
    .O(count_2_rstpot_381)
  );
  X_FF #(
    .LOC ( "SLICE_X5Y18" ),
    .INIT ( 1'b0 ))
  count_1 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_1/CLK ),
    .I(count_1_rstpot_385),
    .O(count[1]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X5Y18" ),
    .INIT ( 64'h00F000F000F000F0 ))
  count_1_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR4(1'b1),
    .ADR5(1'b1),
    .ADR2(\Result<1>_0 ),
    .ADR3(\count[32]_GND_1_o_equal_3_o ),
    .O(count_1_rstpot_385)
  );
  X_FF #(
    .LOC ( "SLICE_X5Y18" ),
    .INIT ( 1'b0 ))
  tick_182 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_tick/CLK ),
    .I(\count[32]_GND_1_o_equal_3_o ),
    .O(tick_OBUF_683),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X5Y18" ),
    .INIT ( 64'h8000000000000000 ))
  \count[32]_GND_1_o_equal_3_o<32>8  (
    .ADR1(\count[32]_GND_1_o_equal_3_o<32>6_686 ),
    .ADR2(\count[32]_GND_1_o_equal_3_o<32>5_687 ),
    .ADR5(\count[32]_GND_1_o_equal_3_o<32>4_688 ),
    .ADR0(\count[32]_GND_1_o_equal_3_o<32>3_689 ),
    .ADR3(\count[32]_GND_1_o_equal_3_o<32>2_690 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o<32>1_691 ),
    .O(\count[32]_GND_1_o_equal_3_o )
  );
  X_FF #(
    .LOC ( "SLICE_X5Y18" ),
    .INIT ( 1'b0 ))
  count_0 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_0/CLK ),
    .I(count_0_rstpot_370),
    .O(count[0]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X5Y18" ),
    .INIT ( 64'h0000F0F00000F0F0 ))
  count_0_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR5(1'b1),
    .ADR3(1'b1),
    .ADR2(\Result<0>_0 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o ),
    .O(count_0_rstpot_370)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X5Y19" ),
    .INIT ( 64'h0010000000000000 ))
  \count[32]_GND_1_o_equal_3_o<32>7  (
    .ADR1(\count[32]_GND_1_o_add_1_OUT<0>_0 ),
    .ADR4(\count[32]_GND_1_o_add_1_OUT<7>_0 ),
    .ADR3(\count[32]_GND_1_o_add_1_OUT<10>_0 ),
    .ADR0(\count[32]_GND_1_o_add_1_OUT<11>_0 ),
    .ADR5(\count[32]_GND_1_o_add_1_OUT<12>_0 ),
    .ADR2(\count[32]_GND_1_o_add_1_OUT<13>_0 ),
    .O(\count[32]_GND_1_o_equal_3_o<32>6_686 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X5Y20" ),
    .INIT ( 64'h0000000000000005 ))
  \count[32]_GND_1_o_equal_3_o<32>1  (
    .ADR1(1'b1),
    .ADR4(\count[32]_GND_1_o_add_1_OUT<3>_0 ),
    .ADR2(\count[32]_GND_1_o_add_1_OUT<4>_0 ),
    .ADR3(\count[32]_GND_1_o_add_1_OUT<5>_0 ),
    .ADR0(\count[32]_GND_1_o_add_1_OUT<6>_0 ),
    .ADR5(\count[32]_GND_1_o_add_1_OUT<8>_0 ),
    .O(\count[32]_GND_1_o_equal_3_o<32> )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X5Y20" ),
    .INIT ( 64'h0000004000000000 ))
  \count[32]_GND_1_o_equal_3_o<32>2  (
    .ADR0(\count[32]_GND_1_o_add_1_OUT<9>_0 ),
    .ADR1(\count[32]_GND_1_o_add_1_OUT<20>_0 ),
    .ADR2(\count[32]_GND_1_o_add_1_OUT<21>_0 ),
    .ADR4(\count[32]_GND_1_o_add_1_OUT<31>_0 ),
    .ADR3(\count[32]_GND_1_o_add_1_OUT<32>_0 ),
    .ADR5(\count[32]_GND_1_o_equal_3_o<32> ),
    .O(\count[32]_GND_1_o_equal_3_o<32>1_691 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X5Y21" ),
    .INIT ( 64'h0000000000000010 ))
  \count[32]_GND_1_o_equal_3_o<32>3  (
    .ADR1(\count[32]_GND_1_o_add_1_OUT<1>_0 ),
    .ADR0(\count[32]_GND_1_o_add_1_OUT<2>_0 ),
    .ADR2(\count[32]_GND_1_o_add_1_OUT<25>_0 ),
    .ADR3(\count[32]_GND_1_o_add_1_OUT<26>_0 ),
    .ADR4(\count[32]_GND_1_o_add_1_OUT<27>_0 ),
    .ADR5(\count[32]_GND_1_o_add_1_OUT<28>_0 ),
    .O(\count[32]_GND_1_o_equal_3_o<32>2_690 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X5Y21" ),
    .INIT ( 64'h0008000000000000 ))
  \count[32]_GND_1_o_equal_3_o<32>4  (
    .ADR1(\count[32]_GND_1_o_add_1_OUT<14>_0 ),
    .ADR4(\count[32]_GND_1_o_add_1_OUT<15>_0 ),
    .ADR2(\count[32]_GND_1_o_add_1_OUT<16>_0 ),
    .ADR5(\count[32]_GND_1_o_add_1_OUT<17>_0 ),
    .ADR3(\count[32]_GND_1_o_add_1_OUT<18>_0 ),
    .ADR0(\count[32]_GND_1_o_add_1_OUT<19>_0 ),
    .O(\count[32]_GND_1_o_equal_3_o<32>3_689 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X5Y22" ),
    .INIT ( 64'h00000000AAAA0000 ))
  \count[32]_GND_1_o_equal_3_o<32>6  (
    .ADR3(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR0(\count[32]_GND_1_o_add_1_OUT<22>_0 ),
    .ADR4(\count[32]_GND_1_o_add_1_OUT<23>_0 ),
    .ADR5(\count[32]_GND_1_o_add_1_OUT<24>_0 ),
    .O(\count[32]_GND_1_o_equal_3_o<32>5_687 )
  );
  X_LUT6 #(
    .LOC ( "SLICE_X5Y22" ),
    .INIT ( 64'h000000000F0F0F0F ))
  \count[32]_GND_1_o_equal_3_o<32>5  (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR4(1'b1),
    .ADR3(1'b1),
    .ADR2(\count[32]_GND_1_o_add_1_OUT<29>_0 ),
    .ADR5(\count[32]_GND_1_o_add_1_OUT<30>_0 ),
    .O(\count[32]_GND_1_o_equal_3_o<32>4_688 )
  );
  X_FF #(
    .LOC ( "SLICE_X7Y19" ),
    .INIT ( 1'b0 ))
  count_6 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_6/CLK ),
    .I(count_6_rstpot_430),
    .O(count[6]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y19" ),
    .INIT ( 64'h00CC00CC00CC00CC ))
  count_6_rstpot (
    .ADR0(1'b1),
    .ADR4(1'b1),
    .ADR2(1'b1),
    .ADR5(1'b1),
    .ADR1(\Result<6>_0 ),
    .ADR3(\count[32]_GND_1_o_equal_3_o ),
    .O(count_6_rstpot_430)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y19" ),
    .INIT ( 1'b0 ))
  count_5 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_5/CLK ),
    .I(count_5_rstpot_437),
    .O(count[5]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y19" ),
    .INIT ( 64'h00AA00AA00AA00AA ))
  count_5_rstpot (
    .ADR4(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR5(1'b1),
    .ADR0(\Result<5>_0 ),
    .ADR3(\count[32]_GND_1_o_equal_3_o ),
    .O(count_5_rstpot_437)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y19" ),
    .INIT ( 1'b0 ))
  count_4 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_4/CLK ),
    .I(count_4_rstpot_438),
    .O(count[4]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y19" ),
    .INIT ( 64'h00000000AAAAAAAA ))
  count_4_rstpot (
    .ADR4(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR0(\Result<4>_0 ),
    .ADR5(\count[32]_GND_1_o_equal_3_o ),
    .O(count_4_rstpot_438)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y19" ),
    .INIT ( 1'b0 ))
  count_3 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_3/CLK ),
    .I(count_3_rstpot_445),
    .O(count[3]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y19" ),
    .INIT ( 64'h0000AAAA0000AAAA ))
  count_3_rstpot (
    .ADR5(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR0(\Result<3>_0 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o ),
    .O(count_3_rstpot_445)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y20" ),
    .INIT ( 1'b0 ))
  count_10 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_10/CLK ),
    .I(count_10_rstpot_447),
    .O(count[10]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y20" ),
    .INIT ( 64'h0000FFFF00000000 ))
  count_10_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR5(\Result<10>_0 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o ),
    .O(count_10_rstpot_447)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y20" ),
    .INIT ( 1'b0 ))
  count_9 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_9/CLK ),
    .I(count_9_rstpot_454),
    .O(count[9]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y20" ),
    .INIT ( 64'h0000AAAA0000AAAA ))
  count_9_rstpot (
    .ADR5(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR0(\Result<9>_0 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o ),
    .O(count_9_rstpot_454)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y20" ),
    .INIT ( 1'b0 ))
  count_8 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_8/CLK ),
    .I(count_8_rstpot_455),
    .O(count[8]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y20" ),
    .INIT ( 64'h0000AAAA0000AAAA ))
  count_8_rstpot (
    .ADR5(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR0(\Result<8>_0 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o ),
    .O(count_8_rstpot_455)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y20" ),
    .INIT ( 1'b0 ))
  count_7 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_7/CLK ),
    .I(count_7_rstpot_462),
    .O(count[7]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y20" ),
    .INIT ( 64'h0000FFFF00000000 ))
  count_7_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR5(\Result<7>_0 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o ),
    .O(count_7_rstpot_462)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y21" ),
    .INIT ( 1'b0 ))
  count_14 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_14/CLK ),
    .I(count_14_rstpot_464),
    .O(count[14]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y21" ),
    .INIT ( 64'h00FF00FF00000000 ))
  count_14_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR5(\Result<14>_0 ),
    .ADR3(\count[32]_GND_1_o_equal_3_o ),
    .O(count_14_rstpot_464)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y21" ),
    .INIT ( 1'b0 ))
  count_13 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_13/CLK ),
    .I(count_13_rstpot_471),
    .O(count[13]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y21" ),
    .INIT ( 64'h00000000AAAAAAAA ))
  count_13_rstpot (
    .ADR4(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR0(\Result<13>_0 ),
    .ADR5(\count[32]_GND_1_o_equal_3_o ),
    .O(count_13_rstpot_471)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y21" ),
    .INIT ( 1'b0 ))
  count_12 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_12/CLK ),
    .I(count_12_rstpot_472),
    .O(count[12]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y21" ),
    .INIT ( 64'h00000000AAAAAAAA ))
  count_12_rstpot (
    .ADR4(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR0(\Result<12>_0 ),
    .ADR5(\count[32]_GND_1_o_equal_3_o ),
    .O(count_12_rstpot_472)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y21" ),
    .INIT ( 1'b0 ))
  count_11 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_11/CLK ),
    .I(count_11_rstpot_479),
    .O(count[11]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y21" ),
    .INIT ( 64'h0000FFFF00000000 ))
  count_11_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR5(\Result<11>_0 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o ),
    .O(count_11_rstpot_479)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y22" ),
    .INIT ( 1'b0 ))
  count_17 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_17/CLK ),
    .I(count_17_rstpot_480),
    .O(count[17]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y22" ),
    .INIT ( 64'h0000FFFF00000000 ))
  count_17_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR5(\Result<17>_0 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o<32>8_692 ),
    .O(count_17_rstpot_480)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y22" ),
    .INIT ( 64'h8000000000000000 ))
  \count[32]_GND_1_o_equal_3_o<32>8_1  (
    .ADR2(\count[32]_GND_1_o_equal_3_o<32>6_686 ),
    .ADR0(\count[32]_GND_1_o_equal_3_o<32>5_687 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o<32>4_688 ),
    .ADR1(\count[32]_GND_1_o_equal_3_o<32>3_689 ),
    .ADR3(\count[32]_GND_1_o_equal_3_o<32>2_690 ),
    .ADR5(\count[32]_GND_1_o_equal_3_o<32>1_691 ),
    .O(\count[32]_GND_1_o_equal_3_o<32>8_692 )
  );
  X_FF #(
    .LOC ( "SLICE_X7Y22" ),
    .INIT ( 1'b0 ))
  count_16 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_16/CLK ),
    .I(count_16_rstpot_492),
    .O(count[16]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y22" ),
    .INIT ( 64'h00000000FFFF0000 ))
  count_16_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR4(\Result<16>_0 ),
    .ADR5(\count[32]_GND_1_o_equal_3_o ),
    .O(count_16_rstpot_492)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y22" ),
    .INIT ( 1'b0 ))
  count_15 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_15/CLK ),
    .I(count_15_rstpot_498),
    .O(count[15]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y22" ),
    .INIT ( 64'h0000FFFF00000000 ))
  count_15_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR5(\Result<15>_0 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o ),
    .O(count_15_rstpot_498)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y23" ),
    .INIT ( 1'b0 ))
  count_25 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_25/CLK ),
    .I(count_25_rstpot_501),
    .O(count[25]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y23" ),
    .INIT ( 64'h0000F0F00000F0F0 ))
  count_25_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR5(1'b1),
    .ADR3(1'b1),
    .ADR2(\Result<25>_0 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o<32>8_692 ),
    .O(count_25_rstpot_501)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y23" ),
    .INIT ( 1'b0 ))
  count_24 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_24/CLK ),
    .I(count_24_rstpot_508),
    .O(count[24]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y23" ),
    .INIT ( 64'h0000AAAA0000AAAA ))
  count_24_rstpot (
    .ADR5(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR0(\Result<24>_0 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o<32>8_692 ),
    .O(count_24_rstpot_508)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y23" ),
    .INIT ( 1'b0 ))
  count_23 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_23/CLK ),
    .I(count_23_rstpot_509),
    .O(count[23]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y23" ),
    .INIT ( 64'h00FF000000FF0000 ))
  count_23_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR5(1'b1),
    .ADR4(\Result<23>_0 ),
    .ADR3(\count[32]_GND_1_o_equal_3_o<32>8_692 ),
    .O(count_23_rstpot_509)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y23" ),
    .INIT ( 1'b0 ))
  count_22 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_22/CLK ),
    .I(count_22_rstpot_516),
    .O(count[22]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y23" ),
    .INIT ( 64'h00FF00FF00000000 ))
  count_22_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR5(\Result<22>_0 ),
    .ADR3(\count[32]_GND_1_o_equal_3_o<32>8_692 ),
    .O(count_22_rstpot_516)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y24" ),
    .INIT ( 1'b0 ))
  count_29 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_29/CLK ),
    .I(count_29_rstpot_518),
    .O(count[29]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y24" ),
    .INIT ( 64'h0000F0F00000F0F0 ))
  count_29_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR5(1'b1),
    .ADR3(1'b1),
    .ADR2(\Result<29>_0 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o<32>8_692 ),
    .O(count_29_rstpot_518)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y24" ),
    .INIT ( 1'b0 ))
  count_28 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_28/CLK ),
    .I(count_28_rstpot_525),
    .O(count[28]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y24" ),
    .INIT ( 64'h0000AAAA0000AAAA ))
  count_28_rstpot (
    .ADR5(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR0(\Result<28>_0 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o<32>8_692 ),
    .O(count_28_rstpot_525)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y24" ),
    .INIT ( 1'b0 ))
  count_27 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_27/CLK ),
    .I(count_27_rstpot_526),
    .O(count[27]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y24" ),
    .INIT ( 64'h0000FF000000FF00 ))
  count_27_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR5(1'b1),
    .ADR3(\Result<27>_0 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o<32>8_692 ),
    .O(count_27_rstpot_526)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y24" ),
    .INIT ( 1'b0 ))
  count_26 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_26/CLK ),
    .I(count_26_rstpot_533),
    .O(count[26]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y24" ),
    .INIT ( 64'h00FF00FF00000000 ))
  count_26_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR5(\Result<26>_0 ),
    .ADR3(\count[32]_GND_1_o_equal_3_o<32>8_692 ),
    .O(count_26_rstpot_533)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y25" ),
    .INIT ( 1'b0 ))
  count_32 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_32/CLK ),
    .I(count_32_rstpot_536),
    .O(count[32]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y25" ),
    .INIT ( 64'h0000FFFF00000000 ))
  count_32_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR3(1'b1),
    .ADR5(\Result<32>_0 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o<32>8_692 ),
    .O(count_32_rstpot_536)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y25" ),
    .INIT ( 1'b0 ))
  count_31 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_31/CLK ),
    .I(count_31_rstpot_540),
    .O(count[31]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y25" ),
    .INIT ( 64'h00FF000000FF0000 ))
  count_31_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR5(1'b1),
    .ADR4(\Result<31>_0 ),
    .ADR3(\count[32]_GND_1_o_equal_3_o<32>8_692 ),
    .O(count_31_rstpot_540)
  );
  X_FF #(
    .LOC ( "SLICE_X7Y25" ),
    .INIT ( 1'b0 ))
  count_30 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_30/CLK ),
    .I(count_30_rstpot_544),
    .O(count[30]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X7Y25" ),
    .INIT ( 64'h00FF00FF00000000 ))
  count_30_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR5(\Result<30>_0 ),
    .ADR3(\count[32]_GND_1_o_equal_3_o<32>8_692 ),
    .O(count_30_rstpot_544)
  );
  X_FF #(
    .LOC ( "SLICE_X8Y22" ),
    .INIT ( 1'b0 ))
  count_21 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_21/CLK ),
    .I(count_21_rstpot_548),
    .O(count[21]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X8Y22" ),
    .INIT ( 64'h0000F0F00000F0F0 ))
  count_21_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR5(1'b1),
    .ADR3(1'b1),
    .ADR2(\Result<21>_0 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o<32>8_692 ),
    .O(count_21_rstpot_548)
  );
  X_FF #(
    .LOC ( "SLICE_X8Y22" ),
    .INIT ( 1'b0 ))
  count_20 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_20/CLK ),
    .I(count_20_rstpot_555),
    .O(count[20]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X8Y22" ),
    .INIT ( 64'h0000FF000000FF00 ))
  count_20_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR5(1'b1),
    .ADR3(\Result<20>_0 ),
    .ADR4(\count[32]_GND_1_o_equal_3_o<32>8_692 ),
    .O(count_20_rstpot_555)
  );
  X_FF #(
    .LOC ( "SLICE_X8Y22" ),
    .INIT ( 1'b0 ))
  count_19 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_19/CLK ),
    .I(count_19_rstpot_556),
    .O(count[19]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X8Y22" ),
    .INIT ( 64'h00FF000000FF0000 ))
  count_19_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR5(1'b1),
    .ADR4(\Result<19>_0 ),
    .ADR3(\count[32]_GND_1_o_equal_3_o<32>8_692 ),
    .O(count_19_rstpot_556)
  );
  X_FF #(
    .LOC ( "SLICE_X8Y22" ),
    .INIT ( 1'b0 ))
  count_18 (
    .CE(VCC),
    .CLK(\NlwBufferSignal_count_18/CLK ),
    .I(count_18_rstpot_563),
    .O(count[18]),
    .RST(GND),
    .SET(GND)
  );
  X_LUT6 #(
    .LOC ( "SLICE_X8Y22" ),
    .INIT ( 64'h00FF00FF00000000 ))
  count_18_rstpot (
    .ADR0(1'b1),
    .ADR1(1'b1),
    .ADR2(1'b1),
    .ADR4(1'b1),
    .ADR5(\Result<18>_0 ),
    .ADR3(\count[32]_GND_1_o_equal_3_o<32>8_692 ),
    .O(count_18_rstpot_563)
  );
  X_BUF   \NlwBufferBlock_tick_OBUF/I  (
    .I(tick_OBUF_683),
    .O(\NlwBufferSignal_tick_OBUF/I )
  );
  X_BUF   \NlwBufferBlock_clk_BUFGP/BUFG/IN  (
    .I(\clk_BUFGP/IBUFG_0 ),
    .O(\NlwBufferSignal_clk_BUFGP/BUFG/IN )
  );
  X_BUF   \NlwBufferBlock_count_2/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_2/CLK )
  );
  X_BUF   \NlwBufferBlock_count_1/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_1/CLK )
  );
  X_BUF   \NlwBufferBlock_tick/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_tick/CLK )
  );
  X_BUF   \NlwBufferBlock_count_0/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_0/CLK )
  );
  X_BUF   \NlwBufferBlock_count_6/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_6/CLK )
  );
  X_BUF   \NlwBufferBlock_count_5/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_5/CLK )
  );
  X_BUF   \NlwBufferBlock_count_4/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_4/CLK )
  );
  X_BUF   \NlwBufferBlock_count_3/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_3/CLK )
  );
  X_BUF   \NlwBufferBlock_count_10/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_10/CLK )
  );
  X_BUF   \NlwBufferBlock_count_9/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_9/CLK )
  );
  X_BUF   \NlwBufferBlock_count_8/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_8/CLK )
  );
  X_BUF   \NlwBufferBlock_count_7/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_7/CLK )
  );
  X_BUF   \NlwBufferBlock_count_14/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_14/CLK )
  );
  X_BUF   \NlwBufferBlock_count_13/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_13/CLK )
  );
  X_BUF   \NlwBufferBlock_count_12/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_12/CLK )
  );
  X_BUF   \NlwBufferBlock_count_11/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_11/CLK )
  );
  X_BUF   \NlwBufferBlock_count_17/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_17/CLK )
  );
  X_BUF   \NlwBufferBlock_count_16/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_16/CLK )
  );
  X_BUF   \NlwBufferBlock_count_15/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_15/CLK )
  );
  X_BUF   \NlwBufferBlock_count_25/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_25/CLK )
  );
  X_BUF   \NlwBufferBlock_count_24/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_24/CLK )
  );
  X_BUF   \NlwBufferBlock_count_23/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_23/CLK )
  );
  X_BUF   \NlwBufferBlock_count_22/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_22/CLK )
  );
  X_BUF   \NlwBufferBlock_count_29/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_29/CLK )
  );
  X_BUF   \NlwBufferBlock_count_28/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_28/CLK )
  );
  X_BUF   \NlwBufferBlock_count_27/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_27/CLK )
  );
  X_BUF   \NlwBufferBlock_count_26/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_26/CLK )
  );
  X_BUF   \NlwBufferBlock_count_32/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_32/CLK )
  );
  X_BUF   \NlwBufferBlock_count_31/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_31/CLK )
  );
  X_BUF   \NlwBufferBlock_count_30/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_30/CLK )
  );
  X_BUF   \NlwBufferBlock_count_21/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_21/CLK )
  );
  X_BUF   \NlwBufferBlock_count_20/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_20/CLK )
  );
  X_BUF   \NlwBufferBlock_count_19/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_19/CLK )
  );
  X_BUF   \NlwBufferBlock_count_18/CLK  (
    .I(clk_BUFGP),
    .O(\NlwBufferSignal_count_18/CLK )
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

