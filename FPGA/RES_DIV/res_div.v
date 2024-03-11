`timescale 1ns / 1ps

module restoring_division(
        input signed [3:0] Q, M,
        output reg signed [3:0] QUO, REM
    );
        integer i;
        always @(M, Q) begin
           REM = 0;
           QUO = Q;
           for ( i = 0; i < 4; i = i + 1 ) begin
                {REM, QUO} = {REM, QUO} << 1;
                REM = REM - M;
                if (REM[3]) REM = REM + M;
                else QUO[0] = 1;
           end
        end
endmodule
