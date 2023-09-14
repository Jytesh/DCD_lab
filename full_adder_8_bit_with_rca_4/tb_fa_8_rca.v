`timescale 1ns / 1ps

module tb_fa_8_rca;
    reg [7:0] A;
    reg [7:0] B;
    wire [7:0] SUM;
    wire CARRY;
    
    fa_rca_8 UUT (A, B, SUM, CARRY);
    
    initial begin
        A = 8'b00000000;
        B = 8'b00000001;
        #10 
        
        A = 8'b01110111;
        B = 8'b01010101;
        
        #10
        
        A = 8'b10001100;
        B = 8'b01110100;
        
        #10 $finish;
    end
endmodule
