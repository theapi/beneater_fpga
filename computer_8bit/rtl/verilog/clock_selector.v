
module clock_selector (
    input clock_cpu,
    input clock_manual,
	 input sel,
	 output clk
);

	assign clk = sel ? clock_manual : clock_cpu;
 
    
endmodule

