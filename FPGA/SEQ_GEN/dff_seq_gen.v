`timescale 1ns / 1ps

module dff_seq_gen(
        input SWITCH,
        input CLK, RST,
        output wire [0:2] Q,
        output NEW_CLK
    );
        dff u2(SWITCH, CLK, NEW_CLK);
        seq_gen u1(NEW_CLK, RST, Q);
    
endmodule
    
module dff(input D, CLK, output reg Q);
    always @(posedge CLK) begin
        Q <= D;
    end
endmodule