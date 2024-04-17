onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+uproc_top_level -L xil_defaultlib -L secureip -O5 xil_defaultlib.uproc_top_level

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {uproc_top_level.udo}

run -all

endsim

quit -force
