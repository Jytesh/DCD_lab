`timescale 1ns / 1ps

module tb_serial_adder;
    reg CLK, RST;
    reg A, B;
    wire SUM,  COUT;
    
    serial_adder uut(CLK, RST, A, B, SUM, COUT);
    always #5 CLK=~CLK;
    initial begin
        CLK=0; RST=0;
        #10 RST=1; A=1; B=1;
        #10 A=1; B=1;
        #10 A=0; B=0;
        #20 A=1;
        #10 RST=0;
        #10 RST=1;
        #10 $finish;
    end
endmodule
