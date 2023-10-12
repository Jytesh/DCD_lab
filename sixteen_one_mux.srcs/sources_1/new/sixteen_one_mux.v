`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2023 12:05:47
// Design Name: 
// Module Name: sixteen_one_mux
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


module sizteen_one_mux(out,in,sel); 

 input [0:15] in; 

 input [0:3] sel;

 output out;

 wire [0:3] ma;

 mux4to1_gate mux1(ma[0],in[0:3],sel[2:3]);

 mux4to1_gate mux2(ma[1],in[4:7],sel[2:3]);

 mux4to1_gate mux3(ma[2],in[8:11],sel[2:3]);

 mux4to1_gate mux4(ma[3],in[12:15],sel[2:3]);

 mux4to1_gate mux5(out,ma,sel[0:1]);

endmodule
