`timescale 1ns / 1ps

module tb_array_mult;
    reg RST;
    reg [0:3] A, B;
    wire [0:7] Y;
    
    array_mult uut(RST, A, B, Y);
    initial begin
        RST=0; A=0; B=0;
        #10 RST=1; A=4'b1111; B=4'b1111;
        #10 RST=0;
        #10 RST=1; A=4'b0001; B=4'b0010;
        #10 RST=0;
        #10 RST=1; A=4'b1010; B=4'b0101;
        #10 $finish;
     end
endmodule
