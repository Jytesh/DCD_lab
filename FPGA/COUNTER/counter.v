`timescale 1ns / 1ps

module counter(
    input CLK,
    input RST,
    input REV,
    output reg [0:3] COUNT
    );
        initial COUNT=0;
        always @(posedge CLK) begin
            if ( RST & !REV) begin
                if ( COUNT == 4'b1111) COUNT=0;
                else COUNT = COUNT + 1'b1;
            end
            else if (RST & REV) begin
                if ( COUNT == 0 ) COUNT = 4'b1111;
                else COUNT = COUNT - 1'b1;
            end
        end
endmodule
