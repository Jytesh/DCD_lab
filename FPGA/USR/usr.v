`timescale 1ns / 1ps

module usr(
        input CLK, RST, CLR, PARALLEL_MODE, SERIAL_INPUT, SHIFT_RIGHT,
        [0:3] PARALLEL_INPUT,
        output reg SERIAL_OUT, reg [0:3] PARALLEL_OUT
    );
    reg [0:3] SHIFT_REG;
    always @(posedge CLK) begin
        if (~RST) SHIFT_REG = 4'b0;
        if (~CLR) SHIFT_REG = 4'b1;
        else begin
            if (~PARALLEL_MODE) begin
                if ( SHIFT_RIGHT ) begin
                    SERIAL_OUT = SHIFT_REG[3];
                    SHIFT_REG = { SERIAL_INPUT, SHIFT_REG[0:2] };
                end else begin
                    SERIAL_OUT = SHIFT_REG[0];
                    SHIFT_REG = { SHIFT_REG[1:3], SERIAL_INPUT };
                end
            end else SHIFT_REG = PARALLEL_INPUT;
            PARALLEL_OUT = SHIFT_REG;
        end
    end     
endmodule
