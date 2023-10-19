`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2023 10:26:29
// Design Name: 
// Module Name: sa_tb
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


module sa_tb;

    // Inputs
    reg clk;
    reg reset;
    reg a;
    reg b;
    reg cin;

    // Outputs
    wire s;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    sa uut (
        .clk(clk), 
        .reset(reset), 
        .a(a), 
        .b(b), 
        .cin(cin), 
        .s(s), 
        .cout(cout)
    );

//generate clock with 10 ns clock period.
    always
        #5 clk = ~clk;
        
    initial begin
        // Initialize Inputs
        clk = 1;
        reset = 0;
        a = 0;
        b = 0;
        cin = 0;
        reset = 1;  
        #20;
        reset = 0;
        //add two 4 bit numbers, 1111 + 1101 = 11101
        a = 1; b = 1; cin = 1;    #10;
        a = 1; b = 0; cin = 0;  #10;
        a = 1; b = 1; cin = 0;  #10;
        a = 1; b = 1; cin = 0;  #10;
        reset = 1;
        #10;
        reset = 0;
        //add two 5 bit numbers, 11011 + 10001 = 101101
        a = 1; b = 1; cin = 1;    #10;
        a = 1; b = 0; cin = 0;  #10;
        a = 0; b = 0; cin = 0;  #10;
        a = 1; b = 0; cin = 0;  #10;
        a = 1; b = 1; cin = 0;  #10;
        reset = 1;
        #10;

    end
      
endmodule
