module bram_tdp_wrapper(
	input wire clk,
	input wire reset,
	// data signals
	input wire [31:0] data_input_A,
	input wire [31:0] data_input_B,
	output wire [31:0] data_output_A,
	output wire [31:0] data_output_B,
	// address signals
	input wire [8:0] address_A,
	input wire [8:0] address_B,
	// control signals
	input wire enable_A,
	input wire enable_B,
	input wire enable_output_reg_A,
	input wire enable_output_reg_B,
	input wire [3:0] write_enable_A,
	input wire [3:0] write_enable_B
	);
	
	 BRAM_TDP_MACRO #(
      .BRAM_SIZE("18Kb"),
      .DEVICE("SPARTAN6"), 
      .DOA_REG(0),
      .DOB_REG(0),
      .INIT_A(36'd0),
      .INIT_B(36'd0),
      .INIT_FILE ("NONE"),
      .READ_WIDTH_A (32),
      .READ_WIDTH_B (32),
      .SIM_COLLISION_CHECK ("ALL"),
	.SRVAL_A(36'h00000000),
      .SRVAL_B(36'h00000000),
      // .WRITE_MODE_A("NO_CHANGE"), 
      // .WRITE_MODE_B("NO_CHANGE"),
	.WRITE_MODE_A("WRITE_FIRST"),
	.WRITE_MODE_B("WRITE_FIRST"),
      .WRITE_WIDTH_A(32),
      .WRITE_WIDTH_B(32),
      .INIT_00(256'd0)
      .INIT_01(256'd0)
      .INIT_02(256'd0)
      .INIT_03(256'd0)
      .INIT_04(256'd0)
      .INIT_05(256'd0)
      .INIT_06(256'd0)
      .INIT_07(256'd0)
      .INIT_08(256'd3618558003479403764845350253151739558087670088224205752529883690475563515904)
      .INIT_09(256'd12855700513501198710035733197864969924904149532714346431381504)
      .INIT_0A(256'd45672623064878170278314204092150625175343202304)
      .INIT_0B(256'd2475880078570769346025488384)
      .INIT_0C(256'd8796227239936)
      .INIT_0D(256'd55214813285513363111043552446773369721796723758303920784452570960625664)
      .INIT_0E(256'd55213970774324706461900433085940660951963575527514534460183444436549632)
      .INIT_0F(256'd45672623075511994242117688776318653613345865728)
      .INIT_10(256'd2475917857502623506959958016)
      .INIT_11(256'd0)
      .INIT_12(256'd0)
      .INIT_13(256'd0)
      .INIT_14(256'd0)
      .INIT_15(256'd0)
      .INIT_16(256'd0)
      .INIT_17(256'd0)
      .INIT_18(256'd0)
      .INIT_19(256'd0),
      .INIT_1A(256'd0),
      .INIT_1B(256'd0),
      .INIT_1C(256'd0),
      .INIT_1D(256'd0),
      .INIT_1E(256'd0),
      .INIT_1F(256'd0),
            
      // The next set of INIT_xx are for "18Kb" configuration only
      .INIT_20(256'd0),
      .INIT_21(256'd0),
      .INIT_22(256'd0),
      .INIT_23(256'd0),
      .INIT_24(256'd0),
      .INIT_25(256'd0),
      .INIT_26(256'd0),
      .INIT_27(256'd0),
      .INIT_28(256'd0),
      .INIT_29(256'd0),
      .INIT_2A(256'd0),
      .INIT_2B(256'd0),
      .INIT_2C(256'd0),
      .INIT_2D(256'd0),
      .INIT_2E(256'd0),
      .INIT_2F(256'd0),
      .INIT_30(256'd0),
      .INIT_31(256'd0),
      .INIT_32(256'd0),
      .INIT_33(256'd0),
      .INIT_34(256'd0),
      .INIT_35(256'd0),
      .INIT_36(256'd0),
      .INIT_37(256'd0),
      .INIT_38(256'd0),
      .INIT_39(256'd0),
      .INIT_3A(256'd0),
      .INIT_3B(256'd0),
      .INIT_3C(256'd0),
      .INIT_3D(256'd0),
      .INIT_3E(256'd0),
      .INIT_3F(256'd0),
     
      // The next set of INITP_xx are for the parity bits
      // .INIT_FF(256'd0),
      .INITP_00(256'd0),
      .INITP_01(256'd0),
      .INITP_02(256'd0),
      .INITP_03(256'd0),
            
      // The next set of INITP_xx are for "18Kb" configuration only
      .INITP_04(256'd0),
      .INITP_05(256'd0),
      .INITP_06(256'd0),
      .INITP_07(256'd0)
   ) BRAM_TDP_MACRO_inst (
	.DIA(data_input_A),
      .DIB(data_input_B),
      .DOA(data_output_A),
      .DOB(data_output_B),
      .ADDRA(address_A),
      .ADDRB(address_B),
      .CLKA(clk),
      .CLKB(clk),
      .ENA(enable_A),
      .ENB(enable_B),
      .REGCEA(enable_output_reg_A),
      .REGCEB(enable_output_reg_B),
      .RSTA(reset),
      .RSTB(reset),
      .WEA(write_enable_A),
      .WEB(write_enable_B)
   );
	
endmodule
