/**
 * Frame buffer
 * 800x480
 * Black & white one pixel per bit
 *
 * Translate pixel positions to ram addresses then uses ram.
 */
  
module vga_frame(
	input clk, // the system clock
	input [10:0] vga_h, // the vertical pixel count being displayed
	input [10:0] vga_v, // the horizontal pixel count being displayed

	output [23:0] pixel_out, // The requested RGB pixel value at vga_h x vga_v
	output [19:0] read_address
); 

	wire ram_value; // Value read from the ram.

	// Each pixel has it's own address which is the same as the pixel number.
	assign read_address = (vga_v * 16'd800) + vga_h;
	
	assign pixel_out[23:16] = 8'd0; //= {8{ ram_value }}; // translate the single bit to 8 bits
   assign pixel_out[15:8]  = {8{ ram_value }}; // translate the single bit to 8 bits
   assign pixel_out[7:0]   = 8'd0; //{8{ ram_value }}; // translate the single bit to 8 bits

	vga_ram vgaram(
		.q(ram_value), // from ram
		.d(1'd0), // to ram
		.write_address(19'd0), // where to write in ram
		.read_address(read_address), // where to read from
		.we(1'b0), // write enable, always off
		.clk(clk)
	);

 
endmodule
