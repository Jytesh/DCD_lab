`timescale 1ns / 1ps

module tb_seq_gen;
    reg CLK, RST;
    wire [0:2] Q;
    always #5 CLK=~CLK;
    seq_gen uut(CLK, RST, Q);
    initial begin
        CLK=1; RST=0;
        #20 RST=1;
        #100 $finish;
    end
endmodule
