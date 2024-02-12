`timescale 1ns / 1ps

module two_four_decoder(
    input A0, A1, ENABLE,
    output reg X1, X2, X3, X4
    );
    
    always @(*)
        begin 
            X1 = 0; X2 = 0; X3 = 0; X4 = 0;
            if (ENABLE) begin
                case ({A0, A1})
                2'b00 : X1 = 1;
                2'b01 : X2 = 1;
                2'b10 : X3 = 1;
                2'b11 : X4 = 1;
                endcase
            end
        end
endmodule
