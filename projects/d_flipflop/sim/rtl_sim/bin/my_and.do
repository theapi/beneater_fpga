vlog -reportprogress 300 -work work ../../bench/verilog/my_and_tb.v
vlog -reportprogress 300 -work work ../../rtl/verilog/my_and.v
vsim work.my_and_tb
do ../../sim/rtl_sim/bin/my_and_wave.do
run 100
