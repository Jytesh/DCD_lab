`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2023 10:47:43
// Design Name: 
// Module Name: four_one_mux
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


module four_one_mux(
    input x1,x2,x3,x4,s0,s1,
    output y
    );
    assign y = s1 ? (s0 ? x4 : x3) : (s0 ? x2 : x1);
endmodule
