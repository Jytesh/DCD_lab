`timescale 1ns / 1ps

module full_subtractor(
    input A,
    input B,
    input BIN,
    output DIFF,
    output BOUT
    );
    assign DIFF = A ^ B ^ BIN;
    assign BOUT = ~A & (B^BIN) | B & BIN;
endmodule
