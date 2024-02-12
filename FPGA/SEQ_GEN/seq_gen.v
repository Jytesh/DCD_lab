`timescale 1ns / 1ps

module seq_gen(
        input CLK, RST,
        output reg [0:2] Q
    );
        always @(posedge CLK) begin
            if (~RST) 
                Q <= 3'b000;
            else begin
                Q[0] <= ~Q[0];
                Q[1] <= Q[2];
                Q[2] <= (~Q[2] & Q[1]) ^ ~Q[0];
            end
        end
endmodule
