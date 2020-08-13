/**
 * clock for the cpu
 */
module clock_cpu (
    input clk,
    output clk_cpu
);

    reg r_clk = 0;
    reg [31:0] counter = 32'd0; 
    
    assign clk_cpu = r_clk;

    always @(posedge clk) begin
	     // d5000000 is 5 Hz with the CLOCK_50 input.
		  // d25000000 is 1 Hz with CLOCK_50 input.
        if (counter == 32'd25000000) begin
            r_clk <= ~r_clk;
            counter <= 32'd0; 
        end else begin
            counter <= counter + 32'd1; 
        end
        
    end
 
    
endmodule
