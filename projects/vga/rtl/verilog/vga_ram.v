/*
 * Example 12-14: Single-Clock Synchronous RAM with Old Data Read‐During‐Write Behavior
 *
 * Quartus II handbook
 * https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/hb/qts/quartusii_handbook.pdf
 *
   16 bit ram holding 3 bit RGB pixel data:
   RGB, RGB, RGB, RGB, RGB, X
   So 5 pixels per memory address.
 */
 
module vga_ram(
    output reg [15:0] q,
    input [15:0] d,
    input [12:0] write_address, read_address,
    input we, clk
);
    // Divide by 15 because we waste the last bit of every address.
    // (800 x 480 * 3) 3 bit colour (/15 = 76800)
    (* ramstyle = "M9K" *)
    reg [15:0] mem [76800:0] /* synthesis ram_init_file = "../mif/vga.mif" */; // 3bits per pixel 16-bit RAM
    
    always @ (posedge clk) begin
        if (we)
            mem[write_address] <= d;
        q <= mem[read_address]; // q doesn't get d in this clock cycle
    end
   
endmodule
