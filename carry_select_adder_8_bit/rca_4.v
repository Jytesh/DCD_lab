`timescale 1ns / 1ps

module rca_4( input [3:0] A, B, input CIN, output [3:0] SUM, output CARRY);
    wire [3:0] I_CARRY;
    
    full_adder A1 (A[0], B[0], CIN, SUM[0], I_CARRY[0]);
    full_adder A2 (A[1], B[1], I_CARRY[0], SUM[1], I_CARRY[1]);
    full_adder A3 (A[2], B[2], I_CARRY[1], SUM[2], I_CARRY[2]);
    full_adder A4 (A[3], B[3], I_CARRY[2], SUM[3], I_CARRY[3]);
    
    assign CARRY = I_CARRY[3];

endmodule


module full_adder(
    input A,
    input B,
    input CIN,
    output SUM,
    output COUT
    );
    wire SUM1, CARRY1, CARRY2;
    half_adder INST1(A, B, SUM1, CARRY1);
    half_adder INST2(CIN, SUM1, SUM, CARRY2);
    assign COUT = CARRY1 | CARRY2;
      
endmodule

module half_adder(
    input A,
    input B,
    output SUM,
    output CARRY
    );
    assign SUM = A^B;
    assign CARRY = A&B;
endmodule

module mux_2_1( input [4:0] A, input [4:0] B, input S, output [4:0] Y);
    assign Y = S ? A : B;
endmodule