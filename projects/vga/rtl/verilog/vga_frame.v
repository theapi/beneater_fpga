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
	output [15:0] read_address,
	output [31:0] pixel_number,
	output [4:0] pixel_bit
); 

	
	//wire [15:0] read_address;
	wire [15:0] write_address;
	wire [15:0] data_in;
	wire load;
	wire [15:0] ram_value; // Value read from the ram.
	
	//wire [4:0] pixel_bit;
	//wire [15:0] pixel_number;
	
	assign write_address = 16'd0; // not really used,just needed for the ram interface.
	assign data_in = 16'd0; // junk for the ram input interface.
	assign load = 1'b0; // never write to the ram.

	assign pixel_number = (vga_v * 16'd800) + vga_h;
	assign read_address = pixel_number >> 4; // divide by 16
	assign pixel_bit = pixel_number % 16'd16;
	
	assign pixel_out[23:16] = {8{ ram_value[pixel_bit] }}; // translate the single bit to 8 bits
   assign pixel_out[15:8]  = {8{ ram_value[pixel_bit] }}; // translate the single bit to 8 bits
   assign pixel_out[7:0]   = {8{ ram_value[pixel_bit] }}; // translate the single bit to 8 bits

	vga_ram vgaram(
		.q(ram_value), // from ram
		.d(data_in), // to ram
		.write_address(write_address), // where to write in ram
		.read_address(read_address), // where to read from
		.we(load), // write enable, always off
		.clk(clk)
	);

 
endmodule
