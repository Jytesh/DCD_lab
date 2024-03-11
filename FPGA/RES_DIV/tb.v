`timescale 1ns / 1ps

module tb;
    reg [3:0] A, B;
    wire [3:0] QUO, REM;
    
    restoring_division uut(A, B, QUO, REM);
    initial begin
        A = 0; B = 0;
        #10 A = 6; B = 2;
        #10 B = 3;
        #10 B = 6;
        #10 $finish;
    end
endmodule
