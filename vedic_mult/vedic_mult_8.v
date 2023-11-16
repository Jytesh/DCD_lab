`timescale 1ns / 1ps

module vedic_mult_2(A, B, OUT);
    input [1:0] A;
    input [1:0] B;
    output [3:0] OUT;
    wire [3:0] I;
    
    assign OUT[0] = A[0] & B[0]; 
    assign I[0] = A[1] & B[0];
    assign I[1] = A[0] & B[1];
    assign I[2] = A[1] & B[1];
    
    assign OUT[1] = I[0] ^ I[1];
    assign OUT[2] = (I[0] & I[1]) ^ I[2];
    assign OUT[3] = (I[0] & I[1]) & I[2];
endmodule

module fa (
    input A,
    input B,
    input Cin, 
    output Sum,
    output Cout
);
    
    assign Sum = A ^ B ^ Cin; 
    assign Cout = (A & B) | (B & Cin) | (Cin & A);

endmodule


module rca_4 (
    input [3:0] A, 
    input [3:0] B, 
    output [3:0] Sum, 
    output Cout 
);
    
    wire [3:0] Sum_int;
    wire [3:0] Cout_int;
    
    fa FA0(A[0], B[0], 1'b0, Sum_int[0], Cout_int[0]);
    fa FA1(A[1], B[1], Cout_int[0], Sum_int[1], Cout_int[1]);
    fa FA2(A[2], B[2], Cout_int[1], Sum_int[2], Cout_int[2]);
    fa FA3(A[3], B[3], Cout_int[2], Sum_int[3], Cout_int[3]);
    
    
    assign Sum = Sum_int;      
    assign Cout = Cout_int[3]; 

endmodule

module rca_6 (
    input [5:0] A,
    input [5:0] B,
    output [5:0] Sum, 
    output Cout 
);
    
    
    wire [5:0] Sum_int;
    wire [5:0] Cout_int;
    
    
    fa FA0(A[0], B[0], 1'b0, Sum_int[0], Cout_int[0]);
    fa FA1(A[1], B[1], Cout_int[0], Sum_int[1], Cout_int[1]);
    fa FA2(A[2], B[2], Cout_int[1], Sum_int[2], Cout_int[2]);
    fa FA3(A[3], B[3], Cout_int[2], Sum_int[3], Cout_int[3]);
    fa FA4(A[4], B[4], Cout_int[3], Sum_int[4], Cout_int[4]);
    fa FA5(A[5], B[5], Cout_int[4], Sum_int[5], Cout_int[5]);
    
    
    assign Sum = Sum_int;
    assign Cout = Cout_int[5]; 

endmodule

module rca_8 (
    input [7:0] A,  
    input [7:0] B,  
    output [7:0] Sum,  
    output Cout 
);


wire [7:0] Sum_int;
wire [8:0] Cout_int; 


fa FA0(A[0], B[0], 1'b0, Sum_int[0], Cout_int[0]);
fa FA1(A[1], B[1], Cout_int[0], Sum_int[1], Cout_int[1]);
fa FA2(A[2], B[2], Cout_int[1], Sum_int[2], Cout_int[2]);
fa FA3(A[3], B[3], Cout_int[2], Sum_int[3], Cout_int[3]);
fa FA4(A[4], B[4], Cout_int[3], Sum_int[4], Cout_int[4]);
fa FA5(A[5], B[5], Cout_int[4], Sum_int[5], Cout_int[5]);
fa FA6(A[6], B[6], Cout_int[5], Sum_int[6], Cout_int[6]);
fa FA7(A[7], B[7], Cout_int[6], Sum_int[7], Cout_int[7]);


assign Sum = Sum_int;
assign Cout = Cout_int[7]; 

endmodule

module rca_12 (
    input [11:0] A,
    input [11:0] B,
    output [11:0] Sum, 
    output Cout 
);


wire [11:0] Sum_int;
wire [12:0] Cout_int; 


fa FA0(A[0], B[0], 1'b0, Sum_int[0], Cout_int[0]);
fa FA1(A[1], B[1], Cout_int[0], Sum_int[1], Cout_int[1]);
fa FA2(A[2], B[2], Cout_int[1], Sum_int[2], Cout_int[2]);
fa FA3(A[3], B[3], Cout_int[2], Sum_int[3], Cout_int[3]);
fa FA4(A[4], B[4], Cout_int[3], Sum_int[4], Cout_int[4]);
fa FA5(A[5], B[5], Cout_int[4], Sum_int[5], Cout_int[5]);
fa FA6(A[6], B[6], Cout_int[5], Sum_int[6], Cout_int[6]);
fa FA7(A[7], B[7], Cout_int[6], Sum_int[7], Cout_int[7]);
fa FA8(A[8], B[8], Cout_int[7], Sum_int[8], Cout_int[8]);
fa FA9(A[9], B[9], Cout_int[8], Sum_int[9], Cout_int[9]);
fa FA10(A[10], B[10], Cout_int[9], Sum_int[10], Cout_int[10]);
fa FA11(A[11], B[11], Cout_int[10], Sum_int[11], Cout_int[11]);


assign Sum = Sum_int;
assign Cout = Cout_int[11]; 

endmodule


module vedic_mult_4(A, B, OUT);
    input [3:0] A;
    input [3:0] B;
    output [7:0] OUT;
    
    
    wire [3:0] Q0;	
    wire [3:0] Q1;	
    wire [3:0] Q2;
    wire [3:0] Q3;	
    wire [3:0] I1;
    wire [5:0] I2;
    wire [5:0] I3;
    wire [5:0] I4;
    wire [3:0] Q4;
    wire [5:0] Q5;
    wire [5:0] Q6;
    wire X;
    
    vedic_mult_2 INST1(A[1:0], B[1:0], Q0[3:0]);
    vedic_mult_2 INST2(A[3:2], B[1:0], Q1[3:0]);
    vedic_mult_2 INST3(A[1:0], B[3:2], Q2[3:0]);
    vedic_mult_2 INST4(A[3:2], B[3:2], Q3[3:0]);
    
    assign I1 ={2'b0, Q0[3:2]};
    rca_4 INST5(Q1[3:0], I1, Q4, X);
    assign I2 ={2'b0, Q2[3:0]};
    assign I3 ={Q3[3:0], 2'b0};
    rca_6 INST6(I2, I3, Q5, X);
    
    assign I4={2'b0,Q4[3:0]};
    rca_6 INST7(I4, Q5, Q6, X);
    assign OUT[1:0]=Q0[1:0];
    assign OUT[7:2]=Q6[5:0];
endmodule

module vedic_mult_8(A, B, OUT);
    input [7:0] A;
    input [7:0] B;
    output [15:0] OUT;
    
    
    wire [15:0] Q0;	
    wire [15:0] Q1;	
    wire [15:0] Q2;
    wire [15:0] Q3;	
    wire [7:0] I1;
    wire [11:0] I2;
    wire [11:0] I3;
    wire [11:0] I4;
    wire [7:0] Q4;
    wire [11:0] Q5;
    wire [11:0] Q6;
    wire X;
    
    vedic_mult_4 INST1(A[3:0], B[3:0], Q0[7:0]);
    vedic_mult_4 INST2(A[7:4], B[3:0], Q1[7:0]);
    vedic_mult_4 INST3(A[3:0], B[7:4], Q2[7:0]);
    vedic_mult_4 INST4(A[7:4], B[7:4], Q3[7:0]);
    
    assign I1 ={4'b0, Q0[7:4]};
    rca_8 INST5(Q1[7:0], I1, Q4, X); 
    
    assign I2 ={4'b0, Q2[7:0]};
    assign I3 ={Q3[7:0], 4'b0};
    rca_12 INST6(I2, I3, Q5, X);
    
    assign I4={4'b0,Q4[7:0]};
    rca_12 INST7(I4, Q5, Q6, X);
    
    
    assign OUT[3:0]=Q0[3:0];
    assign OUT[15:4]=Q6[11:0];
endmodule

module rca_16 (
    input [15:0] A, 
    input [15:0] B, 
    output [15:0] Sum, 
    output Cout 
);


wire [15:0] Sum_int;
wire [16:0] Cout_int; 


fa FA0(A[0], B[0], 1'b0, Sum_int[0], Cout_int[0]);
fa FA1(A[1], B[1], Cout_int[0], Sum_int[1], Cout_int[1]);
fa FA2(A[2], B[2], Cout_int[1], Sum_int[2], Cout_int[2]);
fa FA3(A[3], B[3], Cout_int[2], Sum_int[3], Cout_int[3]);
fa FA4(A[4], B[4], Cout_int[3], Sum_int[4], Cout_int[4]);
fa FA5(A[5], B[5], Cout_int[4], Sum_int[5], Cout_int[5]);
fa FA6(A[6], B[6], Cout_int[5], Sum_int[6], Cout_int[6]);
fa FA7(A[7], B[7], Cout_int[6], Sum_int[7], Cout_int[7]);
fa FA8(A[8], B[8], Cout_int[7], Sum_int[8], Cout_int[8]);
fa FA9(A[9], B[9], Cout_int[8], Sum_int[9], Cout_int[9]);
fa FA10(A[10], B[10], Cout_int[9], Sum_int[10], Cout_int[10]);
fa FA11(A[11], B[11], Cout_int[10], Sum_int[11], Cout_int[11]);
fa FA12(A[12], B[12], Cout_int[11], Sum_int[12], Cout_int[12]);
fa FA13(A[13], B[13], Cout_int[12], Sum_int[13], Cout_int[13]);
fa FA14(A[14], B[14], Cout_int[13], Sum_int[14], Cout_int[14]);
fa FA15(A[15], B[15], Cout_int[14], Sum_int[15], Cout_int[15]);


assign Sum = Sum_int;
assign Cout = Cout_int[15];

endmodule
    
module rca_24 (
    input [23:0] A,
    input [23:0] B,
    output [23:0] Sum, 
    output Cout 
);


wire [23:0] Sum_int;
wire [24:0] Cout_int; 


fa FA0(A[0], B[0], 1'b0, Sum_int[0], Cout_int[0]);
fa FA1(A[1], B[1], Cout_int[0], Sum_int[1], Cout_int[1]);
fa FA2(A[2], B[2], Cout_int[1], Sum_int[2], Cout_int[2]);
fa FA3(A[3], B[3], Cout_int[2], Sum_int[3], Cout_int[3]);
fa FA4(A[4], B[4], Cout_int[3], Sum_int[4], Cout_int[4]);
fa FA5(A[5], B[5], Cout_int[4], Sum_int[5], Cout_int[5]);
fa FA6(A[6], B[6], Cout_int[5], Sum_int[6], Cout_int[6]);
fa FA7(A[7], B[7], Cout_int[6], Sum_int[7], Cout_int[7]);
fa FA8(A[8], B[8], Cout_int[7], Sum_int[8], Cout_int[8]);
fa FA9(A[9], B[9], Cout_int[8], Sum_int[9], Cout_int[9]);
fa FA10(A[10], B[10], Cout_int[9], Sum_int[10], Cout_int[10]);
fa FA11(A[11], B[11], Cout_int[10], Sum_int[11], Cout_int[11]);
fa FA12(A[12], B[12], Cout_int[11], Sum_int[12], Cout_int[12]);
fa FA13(A[13], B[13], Cout_int[12], Sum_int[13], Cout_int[13]);
fa FA14(A[14], B[14], Cout_int[13], Sum_int[14], Cout_int[14]);
fa FA15(A[15], B[15], Cout_int[14], Sum_int[15], Cout_int[15]);
fa FA16(A[16], B[16], Cout_int[15], Sum_int[16], Cout_int[16]);
fa FA17(A[17], B[17], Cout_int[16], Sum_int[17], Cout_int[17]);
fa FA18(A[18], B[18], Cout_int[17], Sum_int[18], Cout_int[18]);
fa FA19(A[19], B[19], Cout_int[18], Sum_int[19], Cout_int[19]);
fa FA20(A[20], B[20], Cout_int[19], Sum_int[20], Cout_int[20]);
fa FA21(A[21], B[21], Cout_int[20], Sum_int[21], Cout_int[21]);
fa FA22(A[22], B[22], Cout_int[21], Sum_int[22], Cout_int[22]);
fa FA23(A[23], B[23], Cout_int[22], Sum_int[23], Cout_int[23]);


assign Sum = Sum_int;
assign Cout = Cout_int[23]; 

endmodule


