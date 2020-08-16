/**
 * Frame display
 * 800x480
 *
 */

module vga_frame(
	input clk, // the system clock
  input cpu_clock,
	input [7:0] bus, // The value of the bus.
  input [7:0] switches,
  input [7:0] a_reg,
  input [7:0] b_reg,
  input [7:0] instruction_reg,
  input [7:0] sum,

	input [10:0] vga_h, // the vertical pixel count being displayed
	input [10:0] vga_v, // the horizontal pixel count being displayed

	output [23:0] pixel_out // The requested RGB pixel value at vga_h x vga_v
);

  reg [2:0] out;

	assign pixel_out[23:16] = {8{ out[2] }}; // RED translate the single bit to 8 bits
  assign pixel_out[15:8]  = {8{ out[1] }}; // GREEN translate the single bit to 8 bits
  assign pixel_out[7:0]   = {8{ out[0] }}; // BLUE translate the single bit to 8 bits

  // Show the cpu clock value
  wire [2:0] cpu_clock_display_out;
  wire cpu_clock_display_on;
  vga_display_register #(.START_H(11'd50), .START_V(11'd10)) cpu_clock_display (
    .clk(clk),
    .data_in({8{ cpu_clock }}),
    .vga_h(vga_h),
    .vga_v(vga_v),
    .bg(3'b010),
    .pixel_out(cpu_clock_display_out),
    .display_on(cpu_clock_display_on)
  );

  // Show the data bus value
  wire [2:0] bus_display_out;
  wire bus_display_on;
  vga_display_register #(.START_H(11'd50), .START_V(11'd20)) bus_display (
    .clk(clk),
    .data_in(bus),
    .vga_h(vga_h),
    .vga_v(vga_v),
    .bg(3'b010),
    .pixel_out(bus_display_out),
    .display_on(bus_display_on)
  );

  wire [2:0] switches_display_out;
  wire switches_display_on;
  vga_display_register #(.START_H(11'd50), .START_V(11'd30)) switches_display (
    .clk(clk),
    .data_in(switches),
    .vga_h(vga_h),
    .vga_v(vga_v),
    .bg(3'b010),
    .pixel_out(switches_display_out),
    .display_on(switches_display_on)
  );

  wire [2:0] a_reg_display_out;
  wire a_reg_display_on;
  vga_display_register #(.START_H(11'd50), .START_V(11'd40)) a_reg_display (
    .clk(clk),
    .data_in(a_reg),
    .vga_h(vga_h),
    .vga_v(vga_v),
    .bg(3'b010),
    .pixel_out(a_reg_display_out),
    .display_on(a_reg_display_on)
  );

  wire [2:0] b_reg_display_out;
  wire b_reg_display_on;
  vga_display_register #(.START_H(11'd50), .START_V(11'd50)) b_reg_display (
    .clk(clk),
    .data_in(b_reg),
    .vga_h(vga_h),
    .vga_v(vga_v),
    .bg(3'b010),
    .pixel_out(b_reg_display_out),
    .display_on(b_reg_display_on)
  );

  wire [2:0] instruction_reg_display_out;
  wire instruction_reg_display_on;
  vga_display_register #(.START_H(11'd50), .START_V(11'd60)) instruction_reg_display (
    .clk(clk),
    .data_in(instruction_reg),
    .vga_h(vga_h),
    .vga_v(vga_v),
    .bg(3'b010),
    .pixel_out(instruction_reg_display_out),
    .display_on(instruction_reg_display_on)
  );

  wire [2:0] sum_display_out;
  wire sum_display_on;
  vga_display_register #(.START_H(11'd50), .START_V(11'd70)) sum_display (
    .clk(clk),
    .data_in(sum),
    .vga_h(vga_h),
    .vga_v(vga_v),
    .bg(3'b010),
    .pixel_out(sum_display_out),
    .display_on(sum_display_on)
  );

  // Display the registers or the background.
  always @ (posedge clk) begin
    if (bus_display_on) begin
      out <= bus_display_out;
    end
    else if (cpu_clock_display_on) begin
      out <= cpu_clock_display_out;
    end
    else if (switches_display_on) begin
      out <= switches_display_out;
    end
    else if (a_reg_display_on) begin
      out <= a_reg_display_out;
    end
    else if (b_reg_display_on) begin
      out <= b_reg_display_out;
    end
    else if (instruction_reg_display_on) begin
      out <= instruction_reg_display_out;
    end
    else if (sum_display_on) begin
      out <= sum_display_out;
    end
    else begin
      out <= 3'b000;
    end
  end

endmodule
