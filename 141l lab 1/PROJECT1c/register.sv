`timescale 1ns / 1ps

module register#(parameter W = 64, parameter R = 32)
(
  input clk,
  input wen_i,
  input [W-1:0] wa_i,
  input [W-1:0] wd_i, 
  input [W-1:0] ra0_i,
  input [W-1:0] ra1_i,
  output [W-1:0] rd0_o,
  output [W-1:0] rd1_o
);

  logic [W-1:0] rf[R-1:0];

  assign rd0_o = rf[ra0_i];
  assign rd1_o = rf[ra1_i];

  always_ff @(posedge clk) 
    begin
      if(wen_i)
        rf[wa_i] <= wd_i;
    end

endmodule