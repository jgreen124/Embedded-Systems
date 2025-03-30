// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
// Date        : Wed Apr  3 22:56:06 2024
// Host        : ece28 running 64-bit Ubuntu 20.04.2 LTS
// Command     : write_verilog -force -mode synth_stub /home/user/lab4/lab4.gen/sources_1/ip/picture/picture_stub.v
// Design      : picture
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1" *)
module picture(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[17:0],douta[7:0]" */;
  input clka;
  input [17:0]addra;
  output [7:0]douta;
endmodule
