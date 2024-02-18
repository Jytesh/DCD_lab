`timescale 1ns / 1ps

module tb_booth_mult;
    reg [3:0] A, B;
    wire [7:0] PROD;
    booth_mult uut(A, B, PROD);

    initial begin
       A = 0; B = 0;
       #100; A=4; B=8;
       #100 A=7; B=2;
       #100 $finish;
    end
      
endmodule
