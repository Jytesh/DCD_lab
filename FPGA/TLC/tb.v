`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 16:23:54
// Design Name: 
// Module Name: tb
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


module tb;
    reg CLK, RST, SENSOR;
    wire H, L;
    controller uut(H, L, SENSOR, RST, CLK);
    always #5 CLK=~CLK;
    initial begin
        CLK=0; RST=0; SENSOR=0;
        #100 SENSOR=1;
        #100 SENSOR=0;
        #100 SENSOR=1;
        #60 SENSOR=0;
        #100 $finish;
    end
endmodule
