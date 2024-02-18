`timescale 1ns / 1ps

module booth_mult(A, B, PROD);
       // MAX INPUT IS ONLY 3 BITS, 1 BIT IS FOR SIGNING!!
       input signed [3:0] A, B;
       output reg signed [7:0] PROD;
       reg [1:0] TMP;
       integer i;
       reg E1;
       always @ (A, B) begin
           PROD = 8'd0;
           E1 = 1'd0;
           for (i = 0; i < 4; i = i + 1) begin
               TMP = {A[i], E1};
               case (TMP)
                   2'd2 : PROD[7 : 4] = PROD[7 : 4] - B;
                   2'd1 : PROD[7 : 4] = PROD[7 : 4] + B;
                   default : begin end
               endcase
               PROD = PROD >> 1;
               PROD[7] = PROD[6];
               E1 = A[i];
           end
       end
endmodule
