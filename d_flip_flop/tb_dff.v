`timescale 1ns / 1ps

module tb_d_flip_flop;
  reg D;
  reg CLK;
  reg RST;

  wire Q;

  d_flip_flop dff (
    D,
    CLK,
    RST,
    Q
  );

  reg clk = 0;

  always begin
    #5 clk = ~clk;
  end
  initial begin
    D = 0;
    RST = 0;
    // Apply D = 1 with rising clock edge
    #5 D = 1;
    CLK = 0;
    #5 CLK = 1;
    #5 CLK = 0;
    // Apply D = 0 with rising clock edge
    #5 D = 0;
    CLK = 0;
    #5 CLK = 1;
    #5 CLK = 0;
    // Apply reset (RST = 1) with rising clock edge
    #5 RST = 1;
    CLK = 0;
    #5 CLK = 1;
    #5 CLK = 0;
    // Release reset (RST = 0) with rising clock edge
    #5 RST = 0;
    CLK = 0;
    #5 CLK = 1;
    #5 CLK = 0;
    $finish;
  end

endmodule