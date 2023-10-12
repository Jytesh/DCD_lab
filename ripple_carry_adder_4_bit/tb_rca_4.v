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
    reg [3:0] A;
    reg [3:0] B;
    wire [3:0] SUM;
    wire CARRY;
    
    rca_4 UUT (A, B, SUM, CARRY);
    
    initial begin
        A = 4'b0000;
        B = 4'b0001;
        #10 
        
        A = 4'b0111;
        B = 4'b0101;
        
        #10
        
        A = 4'b1010;
        B = 4'b0110;
        
        #10 $finish;
    end
endmodule
