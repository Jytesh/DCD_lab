module rca_4(
    input [3:0] A, B,
    input CIN,        
    output reg [3:0] SUM, 
    output reg COUT       
);
    always @(*) begin
        SUM[0] = A[0] ^ B[0] ^ CIN;
        SUM[1] = A[1] ^ B[1] ^ ((A[0] & B[0]) | (A[0] & CIN) | (B[0] & CIN));
        SUM[2] = A[2] ^ B[2] ^ ((A[1] & B[1]) | (A[1] & SUM[0]) | (B[1] & SUM[0]));
        SUM[3] = A[3] ^ B[3] ^ ((A[2] & B[2]) | (A[2] & SUM[1]) | (B[2] & SUM[1]));
        COUT = ((A[3] & B[3]) | (A[3] & SUM[2]) | (B[3] & SUM[2]));
    end
endmodule
