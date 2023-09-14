`timescale 1ns / 1ps

module tb_full_adder;
    reg A,B,C;
    wire SUM, COUT;
    full_adder uut(A, B, C, SUM, COUT);
    initial
    begin
        A=0; B=0; C=0;
        #10 A=0; B=0; C=1;
        #10 A=0; B=1; C=0;
        #10 A=0; B=1; C=1;
        #10 A=1; B=0; C=0;
        #10 A=1; B=0; C=1;
        #10 A=1; B=1; C=0;
        #10 A=1; B=1; C=1;
        #10 $finish;
     end
endmodule
