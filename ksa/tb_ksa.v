`timescale 1ns / 1ps


module tb_ksa;
    reg [7:0] A;
    reg [7:0] B;
    reg CIN;
    wire [7:0] SUM;
    wire CARRY;
    
    ksa_8 UUT (A, B, CIN, SUM, CARRY);
    
    initial begin
        CIN = 0;
        A = 8'b00000000;
        B = 8'b00000001;
        #10 
        
        A = 8'b01110111;
        B = 8'b01010101;
        
        #10
        
        A = 8'b00001100;
        B = 8'b00010100;
        
        #10
        
        A = 8'b01010110;
        B = 8'b01100001;
        #10 
        
        A = 8'b11101010;
        B = 8'b11010101;
        
        #10
        
        A = 8'b10000101;
        B = 8'b11111111;
        
        #10 $finish;
    end
endmodule
