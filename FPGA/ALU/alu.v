`timescale 1ns / 1ps

module alu(
        input [2:0] opcode,
        input signed [3:0] A, B,
        output reg signed [7:0] X
    );
        always @(opcode, A, B) begin
            case (opcode)
                3'b000: X = A+B;
                3'b001: X = A-B;
                3'b010: X = A&B;
                3'b011: X = A|B;
                3'b100: X = ~(A&B);
                3'b101: X = ~(A|B);
                3'b111: X = ~(A^B);
             endcase
         end
endmodule
