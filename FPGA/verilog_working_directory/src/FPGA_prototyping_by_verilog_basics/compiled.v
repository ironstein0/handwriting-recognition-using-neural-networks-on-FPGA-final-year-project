#! /usr/local/bin/vvp
:ivl_version "11.0 (devel)" "(s20150603-207-g3e52b2b)";
:ivl_delay_selection "TYPICAL";
:vpi_time_precision + 0;
:vpi_module "system";
:vpi_module "vhdl_sys";
:vpi_module "vhdl_textio";
:vpi_module "v2005_math";
:vpi_module "va_math";
S_0x7fe10a403520 .scope module, "stimulus" "stimulus" 2 20;
 .timescale 0 0;
v0x7fe10a502af0_0 .var "DUMMY", 0 0;
v0x7fe10a502b80_0 .net "EQ", 0 0, L_0x7fe10a502d90;  1 drivers
v0x7fe10a502c10_0 .var "I0", 0 0;
v0x7fe10a502ce0_0 .var "I1", 0 0;
S_0x7fe10a4036b0 .scope module, "E" "eq1" 2 25, 2 1 0, S_0x7fe10a403520;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "i0"
    .port_info 1 /INPUT 1 "i1"
    .port_info 2 /OUTPUT 1 "eq"
L_0x7fe10a502d90 .functor OR 1, L_0x7fe10a502fe0, L_0x7fe10a503130, C4<0>, C4<0>;
L_0x7fe10a502e80 .functor NOT 1, v0x7fe10a502c10_0, C4<0>, C4<0>, C4<0>;
L_0x7fe10a502f30 .functor NOT 1, v0x7fe10a502ce0_0, C4<0>, C4<0>, C4<0>;
L_0x7fe10a502fe0 .functor AND 1, L_0x7fe10a502e80, L_0x7fe10a502f30, C4<1>, C4<1>;
L_0x7fe10a503130 .functor AND 1, v0x7fe10a502c10_0, v0x7fe10a502ce0_0, C4<1>, C4<1>;
v0x7fe10a406100_0 .net *"_s2", 0 0, L_0x7fe10a502e80;  1 drivers
v0x7fe10a502750_0 .net *"_s4", 0 0, L_0x7fe10a502f30;  1 drivers
v0x7fe10a5027e0_0 .net "eq", 0 0, L_0x7fe10a502d90;  alias, 1 drivers
v0x7fe10a502870_0 .net "i0", 0 0, v0x7fe10a502c10_0;  1 drivers
v0x7fe10a502900_0 .net "i1", 0 0, v0x7fe10a502ce0_0;  1 drivers
v0x7fe10a5029d0_0 .net "p0", 0 0, L_0x7fe10a502fe0;  1 drivers
v0x7fe10a502a60_0 .net "p1", 0 0, L_0x7fe10a503130;  1 drivers
    .scope S_0x7fe10a403520;
T_0 ;
    %vpi_call 2 29 "$dumpfile", "simulation.vcd" {0 0 0};
    %vpi_call 2 30 "$dumpvars", v0x7fe10a502af0_0, v0x7fe10a502c10_0, v0x7fe10a502ce0_0, v0x7fe10a502b80_0 {0 0 0};
    %end;
    .thread T_0;
    .scope S_0x7fe10a403520;
T_1 ;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x7fe10a502c10_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x7fe10a502ce0_0, 0, 1;
    %end;
    .thread T_1;
    .scope S_0x7fe10a403520;
T_2 ;
    %delay 1, 0;
    %load/vec4 v0x7fe10a502c10_0;
    %inv;
    %store/vec4 v0x7fe10a502c10_0, 0, 1;
    %jmp T_2;
    .thread T_2;
    .scope S_0x7fe10a403520;
T_3 ;
    %delay 2, 0;
    %load/vec4 v0x7fe10a502ce0_0;
    %inv;
    %store/vec4 v0x7fe10a502ce0_0, 0, 1;
    %jmp T_3;
    .thread T_3;
    .scope S_0x7fe10a403520;
T_4 ;
    %delay 4, 0;
    %vpi_call 2 46 "$finish" {0 0 0};
    %end;
    .thread T_4;
# The file index is used to find the file name in the following table.
:file_names 3;
    "N/A";
    "<interactive>";
    "verilog_general_description.v";
