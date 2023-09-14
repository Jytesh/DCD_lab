`timescale 1ns / 1ps

module rca_4( input [3:0] A, B, output [3:0] SUM, output CARRY);
    wire [3:0] I_CARRY;
    
    full_adder A1 (A[0], B[0], 0, SUM[0], I_CARRY[0]);
    full_adder A2 (A[1], B[1], I_CARRY[0], SUM[1], I_CARRY[1]);
    full_adder A3 (A[2], B[2], I_CARRY[1], SUM[2], I_CARRY[2]);
    full_adder A4 (A[3], B[3], I_CARRY[2], SUM[3], I_CARRY[3]);
    
    assign CARRY = I_CARRY[3];

endmodule
