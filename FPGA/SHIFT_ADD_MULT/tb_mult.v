`timescale 1ns / 1ps

module tb_mult;
    reg CLK, RST;
    reg [7:0] A,B;
    wire [15:0] product;
    
    mult uut(CLK, RST, A, B, product);
    always #5 CLK=~CLK;
    initial begin
        CLK=1; RST=0; A=8'b0; B=8'b0;
        #10 RST = 1; A=8'b00001111; B=8'b00001111;
        #10 RST = 0;
        #10 RST = 1; A=8'b00000011; B=8'b00000010;
        #20 $finish;
    end
endmodule
