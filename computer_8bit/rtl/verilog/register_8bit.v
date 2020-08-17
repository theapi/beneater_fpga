
module register_8bit (
  input clk,
  input load, // Active low
  input [7:0] bus,

  output [7:0] out
);

  reg [7:0] data_out;
  assign out = data_out;

  always @(posedge clk) begin
    if (load == 1'b0) begin
      data_out <= bus;
    end
  end

endmodule
