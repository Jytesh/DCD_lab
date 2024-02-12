`timescale 1ns / 1ps

module tb_full_subtractor;
    reg A, B, BIN;
    wire DIFF, BOUT;
    
    full_subtractor inst(A, B, BIN, DIFF, BOUT);
    initial
    begin
        A=0; B=0; BIN=0;
        #80 $finish;  
    end
    always #40 A=~A;
    always #20 B=~B;
    always #10 BIN=~BIN;
    
endmodule
