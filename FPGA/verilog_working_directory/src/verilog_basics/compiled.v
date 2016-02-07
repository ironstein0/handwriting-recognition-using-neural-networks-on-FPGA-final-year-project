#! /usr/local/bin/vvp
:ivl_version "11.0 (devel)" "(s20150603-207-g3e52b2b)";
:ivl_delay_selection "TYPICAL";
:vpi_time_precision + 0;
:vpi_module "system";
:vpi_module "vhdl_sys";
:vpi_module "vhdl_textio";
:vpi_module "v2005_math";
:vpi_module "va_math";
S_0x7fbcc05108b0 .scope module, "stimulus" "stimulus" 2 28;
 .timescale 0 0;
v0x7fbcc0525f10_0 .var "A", 3 0;
v0x7fbcc0525fa0_0 .var "B", 3 0;
v0x7fbcc0526030_0 .var "C_IN", 0 0;
v0x7fbcc0526120_0 .net "C_OUT", 0 0, L_0x7fbcc0527920;  1 drivers
v0x7fbcc05261f0_0 .var "DUMMY", 0 0;
v0x7fbcc05262c0_0 .net "SUM", 3 0, L_0x7fbcc0527be0;  1 drivers
S_0x7fbcc0512970 .scope module, "a4_1" "ripple_carry_adder_4_bit" 2 35, 2 14 0, S_0x7fbcc05108b0;
 .timescale 0 0;
    .port_info 0 /INPUT 4 "a"
    .port_info 1 /INPUT 4 "b"
    .port_info 2 /OUTPUT 4 "sum"
    .port_info 3 /INPUT 1 "c_in"
    .port_info 4 /OUTPUT 1 "c_out"
v0x7fbcc05258e0_0 .net "a", 3 0, v0x7fbcc0525f10_0;  1 drivers
v0x7fbcc05259a0_0 .net "b", 3 0, v0x7fbcc0525fa0_0;  1 drivers
v0x7fbcc0525a40_0 .net "c_in", 0 0, v0x7fbcc0526030_0;  1 drivers
v0x7fbcc0525af0_0 .net "c_out", 0 0, L_0x7fbcc0527920;  alias, 1 drivers
v0x7fbcc0525ba0_0 .net "c_out_1", 0 0, L_0x7fbcc0526710;  1 drivers
v0x7fbcc0525cb0_0 .net "c_out_2", 0 0, L_0x7fbcc0526cf0;  1 drivers
v0x7fbcc0525d80_0 .net "c_out_3", 0 0, L_0x7fbcc05272d0;  1 drivers
v0x7fbcc0525e50_0 .net "sum", 3 0, L_0x7fbcc0527be0;  alias, 1 drivers
L_0x7fbcc0526810 .part v0x7fbcc0525f10_0, 0, 1;
L_0x7fbcc05268f0 .part v0x7fbcc0525fa0_0, 0, 1;
L_0x7fbcc0526e30 .part v0x7fbcc0525f10_0, 1, 1;
L_0x7fbcc0526ed0 .part v0x7fbcc0525fa0_0, 1, 1;
L_0x7fbcc0527410 .part v0x7fbcc0525f10_0, 2, 1;
L_0x7fbcc0527560 .part v0x7fbcc0525fa0_0, 2, 1;
L_0x7fbcc0527a60 .part v0x7fbcc0525f10_0, 3, 1;
L_0x7fbcc0527b40 .part v0x7fbcc0525fa0_0, 3, 1;
L_0x7fbcc0527be0 .concat8 [ 1 1 1 1], L_0x7fbcc0526400, L_0x7fbcc0526a40, L_0x7fbcc0527020, L_0x7fbcc05276f0;
S_0x7fbcc0511910 .scope module, "a1" "adder_1_bit" 2 21, 2 1 0, S_0x7fbcc0512970;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "a"
    .port_info 1 /INPUT 1 "b"
    .port_info 2 /OUTPUT 1 "sum"
    .port_info 3 /INPUT 1 "c_in"
    .port_info 4 /OUTPUT 1 "c_out"
L_0x7fbcc0526350 .functor XOR 1, L_0x7fbcc0526810, L_0x7fbcc05268f0, C4<0>, C4<0>;
L_0x7fbcc0526400 .functor XOR 1, L_0x7fbcc0526350, v0x7fbcc0526030_0, C4<0>, C4<0>;
L_0x7fbcc05264f0 .functor AND 1, L_0x7fbcc0526810, L_0x7fbcc05268f0, C4<1>, C4<1>;
L_0x7fbcc0526600 .functor AND 1, L_0x7fbcc0526350, v0x7fbcc0526030_0, C4<1>, C4<1>;
L_0x7fbcc0526710 .functor OR 1, L_0x7fbcc05264f0, L_0x7fbcc0526600, C4<0>, C4<0>;
v0x7fbcc05105e0_0 .net "a", 0 0, L_0x7fbcc0526810;  1 drivers
v0x7fbcc0523b80_0 .net "b", 0 0, L_0x7fbcc05268f0;  1 drivers
v0x7fbcc0523c20_0 .net "c1", 0 0, L_0x7fbcc05264f0;  1 drivers
v0x7fbcc0523cb0_0 .net "c2", 0 0, L_0x7fbcc0526600;  1 drivers
v0x7fbcc0523d50_0 .net "c_in", 0 0, v0x7fbcc0526030_0;  alias, 1 drivers
v0x7fbcc0523e30_0 .net "c_out", 0 0, L_0x7fbcc0526710;  alias, 1 drivers
v0x7fbcc0523ed0_0 .net "s1", 0 0, L_0x7fbcc0526350;  1 drivers
v0x7fbcc0523f70_0 .net "sum", 0 0, L_0x7fbcc0526400;  1 drivers
S_0x7fbcc0524090 .scope module, "a2" "adder_1_bit" 2 22, 2 1 0, S_0x7fbcc0512970;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "a"
    .port_info 1 /INPUT 1 "b"
    .port_info 2 /OUTPUT 1 "sum"
    .port_info 3 /INPUT 1 "c_in"
    .port_info 4 /OUTPUT 1 "c_out"
L_0x7fbcc05269d0 .functor XOR 1, L_0x7fbcc0526e30, L_0x7fbcc0526ed0, C4<0>, C4<0>;
L_0x7fbcc0526a40 .functor XOR 1, L_0x7fbcc05269d0, L_0x7fbcc0526710, C4<0>, C4<0>;
L_0x7fbcc0526b90 .functor AND 1, L_0x7fbcc0526e30, L_0x7fbcc0526ed0, C4<1>, C4<1>;
L_0x7fbcc0526c60 .functor AND 1, L_0x7fbcc05269d0, L_0x7fbcc0526710, C4<1>, C4<1>;
L_0x7fbcc0526cf0 .functor OR 1, L_0x7fbcc0526b90, L_0x7fbcc0526c60, C4<0>, C4<0>;
v0x7fbcc05242f0_0 .net "a", 0 0, L_0x7fbcc0526e30;  1 drivers
v0x7fbcc0524380_0 .net "b", 0 0, L_0x7fbcc0526ed0;  1 drivers
v0x7fbcc0524420_0 .net "c1", 0 0, L_0x7fbcc0526b90;  1 drivers
v0x7fbcc05244d0_0 .net "c2", 0 0, L_0x7fbcc0526c60;  1 drivers
v0x7fbcc0524570_0 .net "c_in", 0 0, L_0x7fbcc0526710;  alias, 1 drivers
v0x7fbcc0524640_0 .net "c_out", 0 0, L_0x7fbcc0526cf0;  alias, 1 drivers
v0x7fbcc05246d0_0 .net "s1", 0 0, L_0x7fbcc05269d0;  1 drivers
v0x7fbcc0524770_0 .net "sum", 0 0, L_0x7fbcc0526a40;  1 drivers
S_0x7fbcc0524890 .scope module, "a3" "adder_1_bit" 2 23, 2 1 0, S_0x7fbcc0512970;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "a"
    .port_info 1 /INPUT 1 "b"
    .port_info 2 /OUTPUT 1 "sum"
    .port_info 3 /INPUT 1 "c_in"
    .port_info 4 /OUTPUT 1 "c_out"
L_0x7fbcc0526f70 .functor XOR 1, L_0x7fbcc0527410, L_0x7fbcc0527560, C4<0>, C4<0>;
L_0x7fbcc0527020 .functor XOR 1, L_0x7fbcc0526f70, L_0x7fbcc0526cf0, C4<0>, C4<0>;
L_0x7fbcc0527190 .functor AND 1, L_0x7fbcc0527410, L_0x7fbcc0527560, C4<1>, C4<1>;
L_0x7fbcc0527260 .functor AND 1, L_0x7fbcc0526f70, L_0x7fbcc0526cf0, C4<1>, C4<1>;
L_0x7fbcc05272d0 .functor OR 1, L_0x7fbcc0527190, L_0x7fbcc0527260, C4<0>, C4<0>;
v0x7fbcc0524b10_0 .net "a", 0 0, L_0x7fbcc0527410;  1 drivers
v0x7fbcc0524bb0_0 .net "b", 0 0, L_0x7fbcc0527560;  1 drivers
v0x7fbcc0524c50_0 .net "c1", 0 0, L_0x7fbcc0527190;  1 drivers
v0x7fbcc0524d00_0 .net "c2", 0 0, L_0x7fbcc0527260;  1 drivers
v0x7fbcc0524da0_0 .net "c_in", 0 0, L_0x7fbcc0526cf0;  alias, 1 drivers
v0x7fbcc0524e70_0 .net "c_out", 0 0, L_0x7fbcc05272d0;  alias, 1 drivers
v0x7fbcc0524f00_0 .net "s1", 0 0, L_0x7fbcc0526f70;  1 drivers
v0x7fbcc0524fa0_0 .net "sum", 0 0, L_0x7fbcc0527020;  1 drivers
S_0x7fbcc05250c0 .scope module, "a4" "adder_1_bit" 2 24, 2 1 0, S_0x7fbcc0512970;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "a"
    .port_info 1 /INPUT 1 "b"
    .port_info 2 /OUTPUT 1 "sum"
    .port_info 3 /INPUT 1 "c_in"
    .port_info 4 /OUTPUT 1 "c_out"
L_0x7fbcc0527680 .functor XOR 1, L_0x7fbcc0527a60, L_0x7fbcc0527b40, C4<0>, C4<0>;
L_0x7fbcc05276f0 .functor XOR 1, L_0x7fbcc0527680, L_0x7fbcc05272d0, C4<0>, C4<0>;
L_0x7fbcc05277e0 .functor AND 1, L_0x7fbcc0527a60, L_0x7fbcc0527b40, C4<1>, C4<1>;
L_0x7fbcc05278b0 .functor AND 1, L_0x7fbcc0527680, L_0x7fbcc05272d0, C4<1>, C4<1>;
L_0x7fbcc0527920 .functor OR 1, L_0x7fbcc05277e0, L_0x7fbcc05278b0, C4<0>, C4<0>;
v0x7fbcc0525320_0 .net "a", 0 0, L_0x7fbcc0527a60;  1 drivers
v0x7fbcc05253d0_0 .net "b", 0 0, L_0x7fbcc0527b40;  1 drivers
v0x7fbcc0525470_0 .net "c1", 0 0, L_0x7fbcc05277e0;  1 drivers
v0x7fbcc0525520_0 .net "c2", 0 0, L_0x7fbcc05278b0;  1 drivers
v0x7fbcc05255c0_0 .net "c_in", 0 0, L_0x7fbcc05272d0;  alias, 1 drivers
v0x7fbcc0525690_0 .net "c_out", 0 0, L_0x7fbcc0527920;  alias, 1 drivers
v0x7fbcc0525720_0 .net "s1", 0 0, L_0x7fbcc0527680;  1 drivers
v0x7fbcc05257c0_0 .net "sum", 0 0, L_0x7fbcc05276f0;  1 drivers
    .scope S_0x7fbcc05108b0;
T_0 ;
    %vpi_call 2 39 "$dumpfile", "simulation.vcd" {0 0 0};
    %vpi_call 2 40 "$dumpvars", v0x7fbcc05261f0_0, v0x7fbcc0525f10_0, v0x7fbcc0525fa0_0, v0x7fbcc0526030_0, v0x7fbcc0526120_0, v0x7fbcc05262c0_0 {0 0 0};
    %end;
    .thread T_0;
    .scope S_0x7fbcc05108b0;
T_1 ;
    %pushi/vec4 0, 0, 4;
    %store/vec4 v0x7fbcc0525f10_0, 0, 4;
    %pushi/vec4 0, 0, 4;
    %store/vec4 v0x7fbcc0525fa0_0, 0, 4;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x7fbcc0526030_0, 0, 1;
    %end;
    .thread T_1;
    .scope S_0x7fbcc05108b0;
T_2 ;
    %delay 1, 0;
    %load/vec4 v0x7fbcc0525f10_0;
    %parti/s 1, 0, 2;
    %inv;
    %ix/load 4, 0, 0;
    %flag_set/imm 4, 0;
    %store/vec4 v0x7fbcc0525f10_0, 4, 1;
    %jmp T_2;
    .thread T_2;
    .scope S_0x7fbcc05108b0;
T_3 ;
    %delay 2, 0;
    %load/vec4 v0x7fbcc0525f10_0;
    %parti/s 1, 1, 2;
    %inv;
    %ix/load 4, 1, 0;
    %flag_set/imm 4, 0;
    %store/vec4 v0x7fbcc0525f10_0, 4, 1;
    %jmp T_3;
    .thread T_3;
    .scope S_0x7fbcc05108b0;
T_4 ;
    %delay 4, 0;
    %load/vec4 v0x7fbcc0525f10_0;
    %parti/s 1, 2, 3;
    %inv;
    %ix/load 4, 2, 0;
    %flag_set/imm 4, 0;
    %store/vec4 v0x7fbcc0525f10_0, 4, 1;
    %jmp T_4;
    .thread T_4;
    .scope S_0x7fbcc05108b0;
T_5 ;
    %delay 8, 0;
    %load/vec4 v0x7fbcc0525f10_0;
    %parti/s 1, 3, 3;
    %inv;
    %ix/load 4, 3, 0;
    %flag_set/imm 4, 0;
    %store/vec4 v0x7fbcc0525f10_0, 4, 1;
    %jmp T_5;
    .thread T_5;
    .scope S_0x7fbcc05108b0;
T_6 ;
    %delay 1, 0;
    %load/vec4 v0x7fbcc0525fa0_0;
    %parti/s 1, 0, 2;
    %inv;
    %ix/load 4, 0, 0;
    %flag_set/imm 4, 0;
    %store/vec4 v0x7fbcc0525fa0_0, 4, 1;
    %jmp T_6;
    .thread T_6;
    .scope S_0x7fbcc05108b0;
T_7 ;
    %delay 2, 0;
    %load/vec4 v0x7fbcc0525fa0_0;
    %parti/s 1, 1, 2;
    %inv;
    %ix/load 4, 1, 0;
    %flag_set/imm 4, 0;
    %store/vec4 v0x7fbcc0525fa0_0, 4, 1;
    %jmp T_7;
    .thread T_7;
    .scope S_0x7fbcc05108b0;
T_8 ;
    %delay 4, 0;
    %load/vec4 v0x7fbcc0525fa0_0;
    %parti/s 1, 2, 3;
    %inv;
    %ix/load 4, 2, 0;
    %flag_set/imm 4, 0;
    %store/vec4 v0x7fbcc0525fa0_0, 4, 1;
    %jmp T_8;
    .thread T_8;
    .scope S_0x7fbcc05108b0;
T_9 ;
    %delay 8, 0;
    %load/vec4 v0x7fbcc0525fa0_0;
    %parti/s 1, 3, 3;
    %inv;
    %ix/load 4, 3, 0;
    %flag_set/imm 4, 0;
    %store/vec4 v0x7fbcc0525fa0_0, 4, 1;
    %jmp T_9;
    .thread T_9;
    .scope S_0x7fbcc05108b0;
T_10 ;
    %delay 16, 0;
    %load/vec4 v0x7fbcc0526030_0;
    %inv;
    %store/vec4 v0x7fbcc0526030_0, 0, 1;
    %jmp T_10;
    .thread T_10;
    .scope S_0x7fbcc05108b0;
T_11 ;
    %delay 32, 0;
    %vpi_call 2 72 "$finish" {0 0 0};
    %end;
    .thread T_11;
# The file index is used to find the file name in the following table.
:file_names 3;
    "N/A";
    "<interactive>";
    "07_ripple_carry_adder_4_bit.v";
