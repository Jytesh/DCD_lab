`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2023 10:49:57
// Design Name: 
// Module Name: four_one_mux_tb
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


module four_one_mux_tb;
    reg x1, x2, x3, x4, s0, s1;
    wire op;
    
    four_one_mux uut(x1,x2,x3,x4,s0,s1,op);
    initial
        begin
            x1 = 0; x2 = 0; x3 = 0; x4= 0; s0 = 0; s1 = 0;
            #320 $finish;
        end
    
    always #80 s0 = ~s0;
    always #160 s1 = ~s1;
    always #40 x1 = ~x1;
    always #20 x2 = ~x2;
    always #10 x3 = ~x3;
    always #5 x4 = ~x4;
   
    
endmodule
