`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2023 12:45:43
// Design Name: 
// Module Name: tb_rsa_4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_rca_4;
    reg [7:0] A;
    reg [7:0] B;
    wire [7:0] SUM;
    wire CARRY;
    reg CIN;
    
    csa_8 UUT (A, B, CIN, SUM, CARRY);
    
    initial begin
        CIN = 0;
        A = 8'b00000000;
        B = 8'b00000001;
        #10 
        
        A = 8'b01110111;
        B = 8'b01010101;
        
        #10
        
        A = 8'b10001100;
        B = 8'b01110100;
        
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
