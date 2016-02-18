#! /usr/local/bin/vvp
:ivl_version "11.0 (devel)" "(s20150603-207-g3e52b2b)";
:ivl_delay_selection "TYPICAL";
:vpi_time_precision + 0;
:vpi_module "system";
:vpi_module "vhdl_sys";
:vpi_module "vhdl_textio";
:vpi_module "v2005_math";
:vpi_module "va_math";
S_0x7ff101c07590 .scope module, "stimulus" "stimulus" 2 48;
 .timescale 0 0;
v0x7ff101c1e910_0 .net "a2", 0 0, v0x7ff101c1e300_0;  1 drivers
v0x7ff101c1e9e0_0 .net "b2", 0 0, v0x7ff101c1e3a0_0;  1 drivers
v0x7ff101c1eab0_0 .net "b3", 0 0, v0x7ff101c1e440_0;  1 drivers
v0x7ff101c1eb80_0 .var "clk", 0 0;
v0x7ff101c1ec50_0 .var "dummy", 0 0;
v0x7ff101c1ed20_0 .net "led", 0 0, v0x7ff101c1dfe0_0;  1 drivers
S_0x7ff101c07720 .scope module, "b" "blinky" 2 51, 2 1 0, S_0x7ff101c07590;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "CLK"
    .port_info 1 /OUTPUT 1 "LED"
    .port_info 2 /OUTPUT 1 "A2"
    .port_info 3 /OUTPUT 1 "B2"
    .port_info 4 /OUTPUT 1 "B3"
v0x7ff101c1e540_0 .net "A2", 0 0, v0x7ff101c1e300_0;  alias, 1 drivers
v0x7ff101c1e5e0_0 .net "B2", 0 0, v0x7ff101c1e3a0_0;  alias, 1 drivers
v0x7ff101c1e690_0 .net "B3", 0 0, v0x7ff101c1e440_0;  alias, 1 drivers
v0x7ff101c1e760_0 .net "CLK", 0 0, v0x7ff101c1eb80_0;  1 drivers
v0x7ff101c1e810_0 .net "LED", 0 0, v0x7ff101c1dfe0_0;  alias, 1 drivers
S_0x7ff101c04260 .scope module, "b" "blink" 2 12, 2 15 0, S_0x7ff101c07720;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "clk"
    .port_info 1 /OUTPUT 1 "led"
P_0x7ff101c06390 .param/l "seconds" 0 2 18, C4<10>;
v0x7ff101c078b0_0 .net "clk", 0 0, v0x7ff101c1eb80_0;  alias, 1 drivers
v0x7ff101c1de70_0 .var "count", 32 0;
v0x7ff101c1df20_0 .var "expected_count", 32 0;
v0x7ff101c1dfe0_0 .var "led", 0 0;
E_0x7ff101c089d0 .event posedge, v0x7ff101c078b0_0;
S_0x7ff101c1e0b0 .scope module, "i" "initialize_all" 2 6, 2 36 0, S_0x7ff101c07720;
 .timescale 0 0;
    .port_info 0 /OUTPUT 1 "a2"
    .port_info 1 /OUTPUT 1 "b2"
    .port_info 2 /OUTPUT 1 "b3"
v0x7ff101c1e300_0 .var "a2", 0 0;
v0x7ff101c1e3a0_0 .var "b2", 0 0;
v0x7ff101c1e440_0 .var "b3", 0 0;
    .scope S_0x7ff101c1e0b0;
T_0 ;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x7ff101c1e300_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x7ff101c1e3a0_0, 0, 1;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x7ff101c1e440_0, 0, 1;
    %end;
    .thread T_0;
    .scope S_0x7ff101c04260;
T_1 ;
    %pushi/vec4 0, 0, 33;
    %store/vec4 v0x7ff101c1de70_0, 0, 33;
    %end;
    .thread T_1;
    .scope S_0x7ff101c04260;
T_2 ;
    %pushi/vec4 20, 0, 33;
    %store/vec4 v0x7ff101c1df20_0, 0, 33;
    %end;
    .thread T_2;
    .scope S_0x7ff101c04260;
T_3 ;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x7ff101c1dfe0_0, 0, 1;
    %end;
    .thread T_3;
    .scope S_0x7ff101c04260;
T_4 ;
    %wait E_0x7ff101c089d0;
    %load/vec4 v0x7ff101c1de70_0;
    %addi 1, 0, 33;
    %store/vec4 v0x7ff101c1de70_0, 0, 33;
    %load/vec4 v0x7ff101c1de70_0;
    %load/vec4 v0x7ff101c1df20_0;
    %cmp/e;
    %jmp/0xz  T_4.0, 4;
    %load/vec4 v0x7ff101c1dfe0_0;
    %inv;
    %store/vec4 v0x7ff101c1dfe0_0, 0, 1;
    %pushi/vec4 0, 0, 33;
    %store/vec4 v0x7ff101c1de70_0, 0, 33;
T_4.0 ;
    %jmp T_4;
    .thread T_4;
    .scope S_0x7ff101c07590;
T_5 ;
    %vpi_call 2 54 "$dumpfile", "simulation.vcd" {0 0 0};
    %vpi_call 2 55 "$dumpvars", v0x7ff101c1ec50_0, v0x7ff101c1eb80_0, v0x7ff101c1ed20_0 {0 0 0};
    %end;
    .thread T_5;
    .scope S_0x7ff101c07590;
T_6 ;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x7ff101c1eb80_0, 0, 1;
    %end;
    .thread T_6;
    .scope S_0x7ff101c07590;
T_7 ;
    %delay 1, 0;
    %load/vec4 v0x7ff101c1eb80_0;
    %inv;
    %store/vec4 v0x7ff101c1eb80_0, 0, 1;
    %jmp T_7;
    .thread T_7;
    .scope S_0x7ff101c07590;
T_8 ;
    %delay 1000, 0;
    %vpi_call 2 65 "$finish" {0 0 0};
    %end;
    .thread T_8;
# The file index is used to find the file name in the following table.
:file_names 3;
    "N/A";
    "<interactive>";
    "02_blinky.v";
