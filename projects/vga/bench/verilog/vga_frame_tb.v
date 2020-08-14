`timescale 10ns/10ns
module vga_frame_tb();
   
	// Declare inputs as regs and outputs as wires
	reg clk;
    reg [10:0] vga_h;
    reg [10:0] vga_v;
    wire [23:0] pixel_out;
    wire [15:0] read_address;
wire [15:0] pixel_number;

    vga_frame U0(
        .clk(clk),
        .vga_h(vga_h),
        .vga_v(vga_v),
        .pixel_out(pixel_out),
        .read_address(read_address),
        .pixel_number(pixel_number)
    );


	// Initialize all variables
	initial begin        


        clk = 1;

        
        #4
        vga_h = 10'd5;
        vga_v = 10'd0;

	#4
        vga_h = 10'd16;
        vga_v = 10'd0;

	#4
        vga_h = 10'd800;
        vga_v = 10'd1;

	#4
        vga_h = 10'd800;
        vga_v = 10'd2;

	#4
        vga_h = 10'd800;
        vga_v = 10'd3;
        
	#4
        vga_h = 10'd5;
        vga_v = 10'd10;

	#4
        vga_h = 10'd6;
        vga_v = 10'd10;

	#4
        vga_h = 10'd7;
        vga_v = 10'd10;

	#4
        vga_h = 10'd8;
        vga_v = 10'd10;

	#4
        vga_h = 10'd9;
        vga_v = 10'd10;

	#4
        vga_h = 10'd10;
        vga_v = 10'd10;

	#4
        vga_h = 10'd11;
        vga_v = 10'd10;

	#4
        vga_h = 10'd12;
        vga_v = 10'd10;

	#4
        vga_h = 10'd13;
        vga_v = 10'd10;

	#4
        vga_h = 10'd14;
        vga_v = 10'd10;

	#4
        vga_h = 10'd15;
        vga_v = 10'd10;

	#4
        vga_h = 10'd16;
        vga_v = 10'd10;

	#4
        vga_h = 10'd17;
        vga_v = 10'd10;

	#4
        vga_h = 10'd18;
        vga_v = 10'd10;

	#4
        vga_h = 10'd800;
        vga_v = 10'd480;




        //#110
        //$stop;      // Terminate simulation

	end

    always begin
        #1 clk = !clk;
    end
	
endmodule

