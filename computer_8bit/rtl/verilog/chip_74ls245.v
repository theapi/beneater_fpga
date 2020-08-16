
/**
 * Transceiver to enable writing to the bus.
 * NB: only the function need for this project is implemented.
 * So it just enables and disables writing to the bus.
 *
 * As there is no internal tri state, the bus needs to feed in too
 * so it can be output when this chip is not enabled.
 */
module chip_74ls245 (
  input clk,
  input [7:0] in,
  input [7:0] bus,
  input oe, // Active low

  output [7:0] out
);

  reg [7:0] data_out;
  assign out = data_out;

  always @(posedge clk) begin
    if (oe == 1'b0) begin
      data_out <= in;
    end
    else begin
      data_out <= bus;
    end
  end

endmodule
