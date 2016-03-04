`timescale 1ns / 1ps
module ThreeInputOrGate(
    input i1,
    input i2,
    input i3,
    output gateOutput
    );

or(gateOutput, i1 , i2 , i3);
endmodule
