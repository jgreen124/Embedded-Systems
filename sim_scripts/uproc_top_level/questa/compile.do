vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vcom -work xil_defaultlib -64 -93 \
"../../../bd/uproc_top_level/ip/uproc_top_level_clock_div_image_top_0_0/sim/uproc_top_level_clock_div_image_top_0_0.vhd" \
"../../../bd/uproc_top_level/ip/uproc_top_level_vga_ctrl_0_0/sim/uproc_top_level_vga_ctrl_0_0.vhd" \
"../../../bd/uproc_top_level/ip/uproc_top_level_regs_0_0/sim/uproc_top_level_regs_0_0.vhd" \
"../../../bd/uproc_top_level/ip/uproc_top_level_framebuffer_0_0/sim/uproc_top_level_framebuffer_0_0.vhd" \
"../../../bd/uproc_top_level/ip/uproc_top_level_debouncer_0_0/sim/uproc_top_level_debouncer_0_0.vhd" \
"../../../bd/uproc_top_level/ip/uproc_top_level_pixel_pusher_0_0/sim/uproc_top_level_pixel_pusher_0_0.vhd" \
"../../../bd/uproc_top_level/ip/uproc_top_level_uart_0_0/sim/uproc_top_level_uart_0_0.vhd" \
"../../../bd/uproc_top_level/ip/uproc_top_level_clock_div_uart_0_0/sim/uproc_top_level_clock_div_uart_0_0.vhd" \
"../../../bd/uproc_top_level/ip/uproc_top_level_my_alu_0_0/sim/uproc_top_level_my_alu_0_0.vhd" \
"../../../bd/uproc_top_level/ip/uproc_top_level_controls_0_0/sim/uproc_top_level_controls_0_0.vhd" \
"../../../bd/uproc_top_level/sim/uproc_top_level.vhd" \


