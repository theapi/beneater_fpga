/*
 * Example 12-14: Single-Clock Synchronous RAM with Old Data Read‐During‐Write Behavior
 *
 * Quartus II handbook
 * https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/hb/qts/quartusii_handbook.pdf
 *
 */
 
module vga_ram(
    output reg [15:0] q,
    input [15:0] d,
    input [12:0] write_address, read_address,
    input we, clk
);
    // 800 x 480 black and white ( / 16 = 24000)
    (* ramstyle = "M9K" *)
    reg [15:0] mem [24000:0] /* synthesis ram_init_file = "../mif/screen.mif" */; // ~24K 16-bit RAM
    
    always @ (posedge clk) begin
        if (we)
            mem[write_address] <= d;
        q <= mem[read_address]; // q doesn't get d in this clock cycle
    end
   
endmodule
