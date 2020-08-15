/*
 * Example 12-14: Single-Clock Synchronous RAM with Old Data Read‐During‐Write Behavior
 *
 * Quartus II handbook
 * https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/hb/qts/quartusii_handbook.pdf
 *
 */
 
module vga_ram(
    output reg [2:0] q,
    input d,
    input [19:0] write_address, read_address,
    input we, clk
);
    // 1 pixel per address :) 
    reg [2:0] mem [383999:0] /* synthesis ram_init_file = "../mif/vga.mif" */;
    
    always @ (posedge clk) begin
        if (we)
            mem[write_address] <= d;
        q <= mem[read_address]; // q doesn't get d in this clock cycle
    end
   
endmodule
