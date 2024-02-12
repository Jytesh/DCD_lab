`timescale 1ns / 1ps

module vedic_mult_16(A, B, OUT);
    input [15:0] A;
    input [15:0] B;
    output [31:0] OUT;
    
    wire [15:0] Q0;	
    wire [15:0] Q1;	
    wire [15:0] Q2;
    wire [15:0] Q3;	
    wire [15:0] I1;
    wire [23:0] I2;
    wire [23:0] I3;
    wire [23:0] I4;
    wire [15:0] Q4;
    wire [23:0] Q5;
    wire [23:0] Q6;
    wire X;
    
    vedic_mult_8 INST1(A[7:0], B[7:0], Q0[15:0]);
    vedic_mult_8 INST2(A[15:8], B[7:0], Q1[15:0]);
    vedic_mult_8 INST3(A[7:0], B[15:8], Q2[15:0]);
    vedic_mult_8 INST4(A[15:8], B[15:8], Q3[15:0]);
    
    assign I1 ={8'b0, Q0[15:8]};
    rca_16 INST5(Q1[15:0], I1, Q4, X); 
    
    assign I2 ={8'b0, Q2[15:0]};
    assign I3 ={Q3[15:0], 8'b0};
    rca_24 INST6(I2, I3, Q5, X);
    
    assign I4={8'b0,Q4[15:0]};
    rca_24 INST7(I4, Q5, Q6, X);
    
    
    assign OUT[7:0]=Q0[7:0];
    assign OUT[31:8]=Q6[23:0];
endmodule
