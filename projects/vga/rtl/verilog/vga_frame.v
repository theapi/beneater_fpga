/**
 * Frame buffer
 * 800x480*3
 *
 * Translate pixel positions to ram addresses then uses ram.

  16 bit ram holding 3 bit RGB pixel data:
  RGB, RGB, RGB, RGB, RGB, X
  So 5 pixels per memory address.
 */
  
module vga_frame(
	input clk, // the system clock
	input [10:0] vga_h, // the current vertical pixel count being displayed
	input [10:0] vga_v, // the current horizontal pixel count being displayed

	output [23:0] pixel_out // The requested RGB pixel value at vga_h x vga_v
); 

   // assign pixel_out = 24'hF0F0F0;
	
	wire [15:0] write_address;
	wire [15:0] read_address;
	wire [15:0] data_in;
	wire load;
	wire [15:0] ram_value; // Value read from the ram.
	
	wire [4:0] pixel_ram_val_loc;
	wire [31:0] pixel_base;
	
//	wire red;
//	wire green;
//	wire blue;


	assign write_address = 16'd0; // not really used,just needed for the ram interface.
	assign data_in = 16'd0; // junk for the ram input interface.
	assign load = 1'b0; // never write to the ram.

	assign pixel_base = vga_h + (vga_v * 3 * 800);
	//assign read_address = pixel_base / 15; // divide by 15 as the last bit of each address is wasted
	assign read_address = 16'd42; //@TODO getthe RAM addressing right
	
	//assign pixel_ram_val_loc = pixel_number % 15;
//	assign red = 2'd0;
//	assign green = 2'd1;
//	assign blue = 2'd2; 
	//assign pixel_out = ram_value[pixel_out[4:0]];
	
	assign pixel_out[23:16] = {8{ ram_value[15] }}; // translate the single bit to 8 bits
   assign pixel_out[15:8]  = {8{ ram_value[14] }}; // translate the single bit to 8 bits
   assign pixel_out[7:0]   = {8{ ram_value[13] }}; // translate the single bit to 8 bits

	vga_ram vgaram(
		.q(ram_value), // from ram
		.d(data_in), // to ram
		.write_address(write_address), // where to write in ram
		.read_address(read_address), // where to read from
		.we(load), // write enable, always off
		.clk(clk)
	);

 
endmodule
