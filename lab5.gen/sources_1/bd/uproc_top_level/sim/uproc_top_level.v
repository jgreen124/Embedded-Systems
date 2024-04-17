//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
//Date        : Tue Apr 16 21:59:36 2024
//Host        : ece46 running 64-bit Ubuntu 20.04.2 LTS
//Command     : generate_target uproc_top_level.bd
//Design      : uproc_top_level
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "uproc_top_level,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=uproc_top_level,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=12,numReposBlks=12,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=10,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "uproc_top_level.hwdef" *) 
module uproc_top_level
   (RXD,
    TXD,
    btn_0,
    clk,
    vga_b,
    vga_g,
    vga_hs,
    vga_r,
    vga_vs);
  output RXD;
  input TXD;
  input btn_0;
  input clk;
  output [4:0]vga_b;
  output [5:0]vga_g;
  output vga_hs;
  output [4:0]vga_r;
  output vga_vs;

  wire TXD_1;
  wire btn_0_1;
  wire clk_1;
  wire clock_div_image_top_0_en;
  wire clock_div_uart_0_en;
  wire [15:0]controls_0_aluA;
  wire [15:0]controls_0_aluB;
  wire [3:0]controls_0_aluOp;
  wire [7:0]controls_0_charSend;
  wire [14:0]controls_0_dAddr;
  wire [15:0]controls_0_dOut;
  wire controls_0_d_wr_en;
  wire [11:0]controls_0_fbAddr1;
  wire [15:0]controls_0_fbDout1;
  wire controls_0_fbRST;
  wire controls_0_fbWr_en;
  wire [13:0]controls_0_irAddr;
  wire [4:0]controls_0_rID1;
  wire [4:0]controls_0_rID2;
  wire [15:0]controls_0_regwD1;
  wire [15:0]controls_0_regwD2;
  wire controls_0_send;
  wire controls_0_wr_enR1;
  wire controls_0_wr_enR2;
  wire debouncer_0_out0;
  wire [15:0]dmem_douta;
  wire [15:0]framebuffer_0_dout1;
  wire [15:0]framebuffer_0_dout2;
  wire [31:0]irMem_douta;
  wire [15:0]my_alu_0_output;
  wire [4:0]pixel_pusher_0_B;
  wire [5:0]pixel_pusher_0_G;
  wire [4:0]pixel_pusher_0_R;
  wire [11:0]pixel_pusher_0_addr;
  wire [15:0]regs_0_dout1;
  wire [15:0]regs_0_dout2;
  wire [7:0]uart_0_charRec;
  wire uart_0_newChar;
  wire uart_0_ready;
  wire uart_0_tx;
  wire [6:0]vga_ctrl_0_hcount;
  wire vga_ctrl_0_hs;
  wire vga_ctrl_0_vid;
  wire vga_ctrl_0_vs;

  assign RXD = uart_0_tx;
  assign TXD_1 = TXD;
  assign btn_0_1 = btn_0;
  assign clk_1 = clk;
  assign vga_b[4:0] = pixel_pusher_0_B;
  assign vga_g[5:0] = pixel_pusher_0_G;
  assign vga_hs = vga_ctrl_0_hs;
  assign vga_r[4:0] = pixel_pusher_0_R;
  assign vga_vs = vga_ctrl_0_vs;
  uproc_top_level_clock_div_image_top_0_0 clock_div_image_top_0
       (.clk(clk_1),
        .en(clock_div_image_top_0_en));
  uproc_top_level_clock_div_uart_0_0 clock_div_uart_0
       (.clk(clk_1),
        .en(clock_div_uart_0_en));
  uproc_top_level_controls_0_0 controls_0
       (.aluA(controls_0_aluA),
        .aluB(controls_0_aluB),
        .aluOp(controls_0_aluOp),
        .aluResult(my_alu_0_output),
        .charRec(uart_0_charRec),
        .charSend(controls_0_charSend),
        .clk(clk_1),
        .dAddr(controls_0_dAddr),
        .dIn(dmem_douta),
        .dOut(controls_0_dOut),
        .d_wr_en(controls_0_d_wr_en),
        .en(clock_div_image_top_0_en),
        .fbAddr1(controls_0_fbAddr1),
        .fbDin1(framebuffer_0_dout1),
        .fbDout1(controls_0_fbDout1),
        .fbRST(controls_0_fbRST),
        .fbWr_en(controls_0_fbWr_en),
        .irAddr(controls_0_irAddr),
        .irWord(irMem_douta),
        .newChar(uart_0_newChar),
        .rID1(controls_0_rID1),
        .rID2(controls_0_rID2),
        .ready(uart_0_ready),
        .regrD1(regs_0_dout1),
        .regrD2(regs_0_dout2),
        .regwD1(controls_0_regwD1),
        .regwD2(controls_0_regwD2),
        .rst(debouncer_0_out0),
        .send(controls_0_send),
        .wr_enR1(controls_0_wr_enR1),
        .wr_enR2(controls_0_wr_enR2));
  uproc_top_level_debouncer_0_0 debouncer_0
       (.clk(clk_1),
        .in0(btn_0_1),
        .out0(debouncer_0_out0));
  uproc_top_level_blk_mem_gen_0_2 dmem
       (.addra(controls_0_dAddr),
        .clka(clk_1),
        .dina(controls_0_dOut),
        .douta(dmem_douta),
        .wea(controls_0_d_wr_en));
  uproc_top_level_framebuffer_0_0 framebuffer_0
       (.addr1(controls_0_fbAddr1),
        .addr2(pixel_pusher_0_addr),
        .clk1(clk_1),
        .din1(controls_0_fbDout1),
        .dout1(framebuffer_0_dout1),
        .dout2(framebuffer_0_dout2),
        .en1(clock_div_uart_0_en),
        .en2(clock_div_image_top_0_en),
        .ld(controls_0_fbRST),
        .wr_en1(controls_0_fbWr_en));
  uproc_top_level_blk_mem_gen_0_1 irMem
       (.addra(controls_0_irAddr),
        .clka(clk_1),
        .douta(irMem_douta));
  uproc_top_level_my_alu_0_0 my_alu_0
       (.A(controls_0_aluA),
        .B(controls_0_aluB),
        .OPCODE(controls_0_aluOp),
        .aluOut(my_alu_0_output),
        .clk(clk_1));
  uproc_top_level_pixel_pusher_0_0 pixel_pusher_0
       (.B(pixel_pusher_0_B),
        .G(pixel_pusher_0_G),
        .R(pixel_pusher_0_R),
        .VS(vga_ctrl_0_vs),
        .addr(pixel_pusher_0_addr),
        .clk(clk_1),
        .clk_en(clock_div_image_top_0_en),
        .hcount(vga_ctrl_0_hcount),
        .pixel(framebuffer_0_dout2),
        .vid(vga_ctrl_0_vid));
  uproc_top_level_regs_0_0 regs_0
       (.clk(clk_1),
        .din1(controls_0_regwD1),
        .din2(controls_0_regwD2),
        .dout1(regs_0_dout1),
        .dout2(regs_0_dout2),
        .en(clock_div_image_top_0_en),
        .id1(controls_0_rID1),
        .id2(controls_0_rID2),
        .rst(debouncer_0_out0),
        .wr_en1(controls_0_wr_enR1),
        .wr_en2(controls_0_wr_enR2));
  uproc_top_level_uart_0_0 uart_0
       (.charRec(uart_0_charRec),
        .charSend(controls_0_charSend),
        .clk(clk_1),
        .en(clock_div_uart_0_en),
        .newChar(uart_0_newChar),
        .ready(uart_0_ready),
        .rst(debouncer_0_out0),
        .rx(TXD_1),
        .send(controls_0_send),
        .tx(uart_0_tx));
  uproc_top_level_vga_ctrl_0_0 vga_ctrl_0
       (.clk(clk_1),
        .clk_en(clock_div_image_top_0_en),
        .hcount(vga_ctrl_0_hcount),
        .hs(vga_ctrl_0_hs),
        .vid(vga_ctrl_0_vid),
        .vs(vga_ctrl_0_vs));
endmodule
