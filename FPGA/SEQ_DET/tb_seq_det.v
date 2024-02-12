`timescale 1ns / 1ps

module tb_seq_det;
    reg CLK, code, SWITCH;
    wire detected, NEW_CLK;
    clock_dff uut(SWITCH, CLK, code, detected, NEW_CLK);
    
    always #2 CLK=~CLK;
    always #5 SWITCH=~SWITCH;
    initial begin
        CLK = 1;
        SWITCH=1;
        code = 1;
        #10 code = 0;
        #10 code = 1;
        #10 code = 0;
        #10 code = 1;
        #10 code = 0;
        #10 code = 1;
        #10 code = 1;
        #10 code = 1;
        #10 code = 0;
        #10 code = 0;
        #10 code = 0; 
        #10 code = 1;
        #10 code = 1;
        #10 code = 0;
        #10 code = 1;
        #10 code = 0;
        #10 code = 1;
        #10 $finish;
    end
endmodule
