

module switches_bus(
	input sw0,
  input sw1,
  input sw2,
  input sw3,
  input sw4,
  input sw5,
  input sw6,
  input sw7,

	output [7:0] bus
);

  assign bus[0] = sw0;
  assign bus[1] = sw1;
  assign bus[2] = sw2;
  assign bus[3] = sw3;
  assign bus[4] = sw4;
  assign bus[5] = sw5;
  assign bus[6] = sw6;
  assign bus[7] = sw7;

endmodule
