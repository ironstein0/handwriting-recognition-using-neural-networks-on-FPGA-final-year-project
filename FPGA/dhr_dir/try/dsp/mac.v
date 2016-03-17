`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:52:58 03/08/2016 
// Design Name: 
// Module Name:    mac 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

/*
 * Multiplier - computes a*b
 */
module dsp_mult #
(
    parameter WIDTH = 8
)
(
    input  wire                  clk,
    input  wire                  rst,

    /*
     * AXI stream inputs
     */
    input  wire [WIDTH-1:0]      input_a_tdata,
    input  wire                  input_a_tvalid,
    output wire                  input_a_tready,

    input  wire [WIDTH-1:0]      input_b_tdata,
    input  wire                  input_b_tvalid,
    output wire                  input_b_tready,

    /*
     * AXI stream output
     */
    output wire [(WIDTH*2)-1:0]  output_tdata,
    output wire                  output_tvalid,
    input  wire                  output_tready
);

reg [WIDTH-1:0] input_a_reg_0 = 0;
reg [WIDTH-1:0] input_a_reg_1 = 0;

reg [WIDTH-1:0] input_b_reg_0 = 0;
reg [WIDTH-1:0] input_b_reg_1 = 0;

reg [(WIDTH*2)-1:0] output_reg_0 = 0;
reg [(WIDTH*2)-1:0] output_reg_1 = 0;

wire transfer = input_a_tvalid & input_b_tvalid & output_tready;

assign input_a_tready = input_b_tvalid & output_tready;
assign input_b_tready = input_a_tvalid & output_tready;

assign output_tdata = output_reg_1;
assign output_tvalid = input_a_tvalid & input_b_tvalid;

always @(posedge clk) begin
    if (rst) begin
        input_a_reg_0 <= 0;
        input_a_reg_1 <= 0;

        input_b_reg_0 <= 0;
        input_b_reg_1 <= 0;

        output_reg_0 <= 0;
        output_reg_1 <= 0;
    end else begin
        if (transfer) begin
            // pipeline for Xilinx DSP slice

            // register
            input_a_reg_0 <= input_a_tdata;
            input_b_reg_0 <= input_b_tdata;

            // pipeline
            input_a_reg_1 <= input_a_reg_0;
            input_b_reg_1 <= input_b_reg_0;

            // multiply
            output_reg_0 <= $signed(input_a_reg_1) * $signed(input_b_reg_1);

            // pipeline
            output_reg_1 <= output_reg_0;
        end
    end
end

endmodule
