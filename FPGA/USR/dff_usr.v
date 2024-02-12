`timescale 1ns / 1ps

module dff_usr(
        input SWITCH, CLK, RST, CLR, PARALLEL_MODE, SERIAL_INPUT, SHIFT_RIGHT,
        [0:3] PARALLEL_INPUT,
        output wire SERIAL_OUT, wire [0:3] PARALLEL_OUT,
        output wire NEW_CLK
    );
        dff u2(SWITCH, CLK, NEW_CLK);
        usr u1(
        NEW_CLK, RST, CLR, PARALLEL_MODE, SERIAL_INPUT, SHIFT_RIGHT,
        PARALLEL_INPUT,
        SERIAL_OUT, PARALLEL_OUT);
endmodule
    
module dff(input D, CLK, output reg Q);
    always @(posedge CLK) begin
        Q <= D;
    end
endmodule
