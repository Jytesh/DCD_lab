`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2023 12:10:09
// Design Name: 
// Module Name: mux4_to_1gate
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


module mux4to1_gate(out,in,sel);

  input [0:3] in; 

  input [0:1] sel; 

  output out;

  wire a,b,c,d,n1,n2,a1,a2,a3,a4;

  not n(n1,sel[1]); 

  not nn(n2,sel[0]);

  and (a1,in[0],n1,n2);

  and (a2,in[1],n2,sel[1]);

  and (a3,in[2],sel[0],n1); 

  and (a4,in[3],sel[0],sel[1]);

  or or1(out,a1,a2,a3,a4);

 endmodule
