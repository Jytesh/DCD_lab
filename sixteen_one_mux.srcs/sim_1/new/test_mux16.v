`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2023 12:12:11
// Design Name: 
// Module Name: test_mux16
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


module testmux_16; 

reg [0:15] in; 

reg [0:3] sel; 

wire out;

sizteen_one_mux mux(out,in,sel);

initial

begin

$monitor("in=%b | sel=%b | out=%b",

             in,sel,out);

end

initial

begin

in=16'b1000000000000000; sel=4'b0000; 

#30 in=16'b0100000000000000; sel=4'b0001; 

#30 in=16'b0010000000000000; sel=4'b0010;

#30 in=16'b0001000000000000; sel=4'b0011;

#30 in=16'b0000100000000000; sel=4'b0100; 

#30 in=16'b0000010000000000; sel=4'b0101; 

#30 in=16'b0000001000000000; sel=4'b0110;

#30 in=16'b0000000100000000; sel=4'b0111;

#30 in=16'b0000000010000000; sel=4'b1000;

#30 in=16'b0000000001000000; sel=4'b1001;

#30 in=16'b0000000000100000; sel=4'b1010; 

#30 in=16'b0000000000010000; sel=4'b1011;

#30 in=16'b0000000000001000; sel=4'b1100; 

#30 in=16'b0000000000000100; sel=4'b1101; 

#30 in=16'b0000000000000010; sel=4'b1110; 

#30 in=16'b0000000000000001; sel=4'b1111;

end 

endmodule
