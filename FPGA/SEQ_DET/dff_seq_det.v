`timescale 1ns / 1ps

module clock_dff(
        input SWITCH, CLK, CODE,
        output DETECTED,
        output NEW_CLK
    );
        dff u2(SWITCH, CLK, NEW_CLK);
        seq_det u1(NEW_CLK, CODE, DETECTED);
    
endmodule
    
module dff(input D, CLK, output reg Q);
    always @(posedge CLK) begin
        Q <= D;
    end
endmodule
