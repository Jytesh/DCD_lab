`timescale 1ns / 1ps


module pgc(
    input [0:7] x,
    input P,
    output EPG,
    output OPG,
    output EPC,
    output OPC
    );
    assign EPG = x[0] ^ x[1] ^ x[2] ^ x[3] ^ x[4] ^ x[5] ^ x[6] ^ x[7];
    assign OPG = ~EPG;
    assign EPC = EPG ^P;
    assign OPC = ~EPC;
endmodule
