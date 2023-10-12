`timescale 1ns / 1ps

module half_adder(
    input A,
    input B,
    output SUM,
    output CARRY
    );
    assign SUM = A^B;
    assign CARRY = A&B;
endmodule
