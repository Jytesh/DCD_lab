`timescale 1ns / 1ps

module tb_alu;
    reg [2:0] opcode;
    reg signed [3:0] A, B;
    wire signed [7:0] X;
    alu uut(opcode, A, B, X);
    initial begin
        opcode = 0; A=0; B=0;
        #10 A=3; B=5;
        repeat(7) begin
            #10 opcode = opcode + 1;
        end
        #10 $finish;
    end
endmodule
