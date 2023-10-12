`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2023 11:09:51
// Design Name: 
// Module Name: CSA_tb
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


module tb_cla;
  reg [3:0]A, B; 
  reg Cin;
  wire [3:0] S;
  wire Cout;
  wire[4:0] add;
  
  CarryLookAheadAdder cla(A, B, Cin, S, Cout);
  
  assign add = {Cout, S};
  initial begin
    A = 1; B = 0; Cin = 0; #10;
    A = 2; B = 4; Cin = 1; #10;
    A = 4'hb; B = 4'h6; Cin = 0; #10;
    A = 5; B = 3; Cin = 1; #10
    $finish;
  end
endmodule


