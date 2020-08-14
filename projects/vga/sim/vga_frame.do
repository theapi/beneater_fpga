vlog -reportprogress 300 -work work ../../../bench/verilog/vga_frame_tb.v
vlog -reportprogress 300 -work work ../../../rtl/verilog/vga_frame.v
vsim work.vga_frame_tb
do ../../../sim/vga_frame_wave.do
run 1500
