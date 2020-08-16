
/**
 * Transceiver to enable writing to the bus.
 * NB: only the function need for this project is implemented.
 * So it just enables and disables writing to the bus.
 */
module chip_74ls245 (
  input clk,
  input [7:0] in,
  input oe, // Active low

  output [7:0] out
);

  reg [7:0] data_out = 0;
  assign out = data_out;

  always @(posedge clk) begin
    if (oe == 1'b0) begin
      data_out <= in;
    end
  end

endmodule
