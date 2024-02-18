`timescale 1ns / 1ps

module array_mult(
        input RST,
        input [3:0] A, B,
        output reg [7:0] Y
    );
    integer i;
    always @(*) begin
        if (~RST) Y = 8'b0;
        else begin
            for (i=0; i < 4; i=i+1) begin
                if (B[i] == 1'b1) begin
                     Y =  Y + ( A << i );
                 end
            end
        end
    end
endmodule

module full_adder(
        input A, B, Cin,
        output SUM, CARRY);
        assign SUM = A ^ B ^ Cin;
        assign CARRY = (A & B) + (B & Cin) + (A & Cin); 
endmodule
