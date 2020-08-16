 /**
  * Displays the binary content of a 8 bit register on the screen.
  */

 module vga_display_register(
    input clk,               // the system clock
    input [7:0] data_in,     // the value of the register to show
    input [10:0] vga_h,      // the current vertical pixel count being displayed
    input [10:0] vga_v,      // the current horizontal pixel count being displayed
    output [23:0] pixel_out, // The requested  pixel value at vga_h x vga_v
    output display_on        // whether the screen should be displaying this
 );

    parameter START_H = 10; // horizontal pixel where this should appear on the screen
    parameter START_V = 10; // vertical pixel where this should appear on the screen
    parameter COLOUR_BG  = 24'h777777;
    parameter COLOUR_ON  = 24'hFF0000;
    parameter COLOUR_OFF = 24'h444444;
    parameter W = 11'd16; // Width of each "led"
    parameter H = 11'd16; // Height of each "led"
    parameter WG = 11'd4; // Gap between each "led"

    reg [23:0] out = 0;
    assign pixel_out = out;
    reg on = 0;
    assign display_on = on;

   	always @ (posedge clk) begin
        if (vga_v >= START_V && vga_v < START_V + H
        && vga_h >= START_H && vga_h < START_H + (WG + (W + WG) * 8)) begin
            on <= 1'b1;
            if (vga_h - START_H < WG) begin
              out <= COLOUR_BG;
            end
            else if (vga_h - START_H < WG + W) begin
              out <= data_in[7] ? COLOUR_ON : COLOUR_OFF;
            end
            else if (vga_h - START_H < WG + W + WG) begin
              out <= COLOUR_BG;
            end
            else if (vga_h - START_H < WG + W + WG + W) begin
              out <= data_in[6] ? COLOUR_ON : COLOUR_OFF;
            end
            else if (vga_h - START_H < WG + (W + WG) * 2 ) begin
              out <= COLOUR_BG;
            end
            else if (vga_h - START_H < WG + (W + WG) * 2 + W) begin
              out <= data_in[5] ? COLOUR_ON : COLOUR_OFF;
            end
            else if (vga_h - START_H < WG + (W + WG) * 3) begin
              out <= COLOUR_BG;
            end
            else if (vga_h - START_H < WG + (W + WG) * 3 + W) begin
              out <= data_in[4] ? COLOUR_ON : COLOUR_OFF;
            end
            else if (vga_h - START_H < WG + (W + WG) * 4) begin
              out <= COLOUR_BG;
            end
            else if (vga_h - START_H < WG + (W + WG) * 4 + W) begin
              out <= data_in[3] ? COLOUR_ON : COLOUR_OFF;
            end
            else if (vga_h - START_H < WG + (W + WG) * 5) begin
              out <= COLOUR_BG;
            end
            else if (vga_h - START_H < WG + (W + WG) * 5 + W) begin
              out <= data_in[2] ? COLOUR_ON : COLOUR_OFF;
            end
            else if (vga_h - START_H < WG + (W + WG) * 6) begin
              out <= COLOUR_BG;
            end
            else if (vga_h - START_H < WG + (W + WG) * 6 + W) begin
              out <= data_in[1] ? COLOUR_ON : COLOUR_OFF;
            end
            else if (vga_h - START_H < WG + (W + WG) * 7) begin
              out <= COLOUR_BG;
            end
            else if (vga_h - START_H < WG + (W + WG) * 7 + W) begin
              out <= data_in[0] ? COLOUR_ON : COLOUR_OFF;
            end
            else begin
              out <= COLOUR_BG;
            end
        end else begin
            out <= COLOUR_BG;
            on <= 1'b0;
        end
    end

 endmodule
