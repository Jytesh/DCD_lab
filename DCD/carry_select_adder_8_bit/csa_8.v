`timescale 1ns / 1ps

module csa_8(
    input [7:0] A, B,
    input CIN,
    output [7:0] SUM,
    output COUT
    );
    
    wire CARRY_SELECT;
    wire [4:0] T1, T2;
    rca_4 INST1 (A[3:0], B[3:0], CIN, SUM[3:0], CARRY_SELECT);
    rca_4 INST2 (A[7:4], B[7:4], 1'b0, T1[3:0], T1[4]);
    rca_4 INST3 (A[7:4], B[7:4], 1'b1, T2[3:0], T2[4]);
    
    wire [4:0] OP;
    
    mux_2_1 INST4(T2, T1, CARRY_SELECT, OP);
    assign SUM[7:4] = OP[3:0];
    assign COUT = OP[4];
endmodule
