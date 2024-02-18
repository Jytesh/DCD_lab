`timescale 1ns / 1ps

module serial_adder(
        input CLK, RST,
        input A, B,
        output reg SUM, COUT
    );
        always @(posedge CLK or negedge RST) begin
            if (~RST) begin
                SUM = 0;
                COUT = 0;
            end else begin
                SUM = A ^ B ^ COUT;
                COUT = ( A & B ) + ( B & COUT ) + ( B & COUT );
                 
            end
        end 
endmodule
