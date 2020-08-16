 /**
  * Displays the binary content of a 8 bit register on the screen.
  */

 module vga_display_register(
    input clk,               // the system clock
    input [7:0] data_in,     // the value of the register to show
    input [10:0] vga_h,      // the current vertical pixel count being displayed
    input [10:0] vga_v,      // the current horizontal pixel count being displayed
    input [2:0] bg,          // the colour of the background pixel
    output [2:0] pixel_out,  // The requested  pixel value at vga_h x vga_v
    output display_on        // whether the screen should be displaying this
 );

    parameter START_H = 10;  // horizontal pixel where this should appear on the screen
    parameter START_V = 380; // vertical pixel where this should appear on the screen

    reg [2:0] out = 0;
    assign pixel_out = out;
    reg on = 0;
    assign display_on = on;

   	always @ (posedge clk) begin
        if (vga_v >= START_V && vga_v < START_V + 11'd6
        && vga_h >= START_H - 11'd5 && vga_h < START_H + 11'd80) begin
            on <= 1'b1;
            // 5 x 5 squares that light if the corresponding bit in the data is set.
            case (vga_h - START_H)
                 11'd0,  11'd1,  11'd2,  11'd3,  11'd4: out <= data_in[7] ? 3'b100 : 3'b000;
                11'd10, 11'd11, 11'd12, 11'd13, 11'd14: out <= data_in[6] ? 3'b100 : 3'b000;
                11'd20, 11'd21, 11'd22, 11'd23, 11'd24: out <= data_in[5] ? 3'b100 : 3'b000;
                11'd30, 11'd31, 11'd32, 11'd33, 11'd34: out <= data_in[4] ? 3'b100 : 3'b000;
                11'd40, 11'd41, 11'd42, 11'd43, 11'd44: out <= data_in[3] ? 3'b100 : 3'b000;
                11'd50, 11'd51, 11'd52, 11'd53, 11'd54: out <= data_in[2] ? 3'b100 : 3'b000;
                11'd60, 11'd61, 11'd62, 11'd63, 11'd64: out <= data_in[1] ? 3'b100 : 3'b000;
                11'd70, 11'd71, 11'd72, 11'd73, 11'd74: out <= data_in[0] ? 3'b100 : 3'b000;
                default: out <= bg;
            endcase
        end else begin
            out <= bg;
            on <= 1'b0;
        end
    end

 endmodule
