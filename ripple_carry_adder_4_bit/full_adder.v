`timescale 1ns / 1ps

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