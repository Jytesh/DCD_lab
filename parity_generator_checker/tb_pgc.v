`timescale 1ns / 1ps


module tb_pgc;
    reg [0:7] X;
    reg P;
    wire EPG, OPG, EPC, OPC;
    
    pgc uut (X, P, EPG, OPG, EPC, OPC);
    initial begin
        X = 8'b00000001; P=0;
        #10 X = 8'b11111111; P=0;
        #10 X = 8'b10101000; P=1;
        #10 X = 8'b11110000; P=1;
        #10 $finish;
    end
        
endmodule
