`timescale 1ns / 1ps
// Sequence is 10101

module seq_det(
        input CLK, code,
        output reg detected
    );
        reg [0:2] state;
        initial begin
            detected = 0;
            state = 3'b000;
        end
        always @(posedge CLK) begin
            if (detected) detected = 0;
            case ({state,code})
                4'b0001,
                4'b1011: state = 3'b001;
                4'b0010: state = 3'b010;
                4'b0101: state = 3'b011;
                4'b0100,
                4'b1000: state = 3'b000;
                4'b0111: state = 3'b001;
                4'b0110,
                4'b1000,
                4'b1010: state = 3'b100;
                4'b1001: begin
                state = 3'b101; detected = 1;
                    end                
            endcase
        end
endmodule
