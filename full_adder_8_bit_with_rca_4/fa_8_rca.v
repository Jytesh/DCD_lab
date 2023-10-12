`timescale 1ns / 1ps

module fa_rca_8(
    input [7:0] A, B,
    output [7:0] SUM,
    output CARRY
    );
        
    wire I_CARRY;
    rca_4 INST1 (A[3:0], B[3:0], 0,  SUM[3:0] , I_CARRY);
    rca_4 INST2 (A[7:4], B[7:4], I_CARRY, SUM[7:4], CARRY);
endmodule