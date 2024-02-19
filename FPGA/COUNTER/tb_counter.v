`timescale 1ns / 1ps

module tb_counter;
    reg CLK, RST, REV;
    wire [0:3] COUNT;
    counter uut ( CLK, RST, REV, COUNT);
    always #5 CLK=~CLK;
    initial begin
        CLK=1;
        RST=1; 
        REV=0;
        #200 REV=1;
        #200 $finish;
    end
endmodule
