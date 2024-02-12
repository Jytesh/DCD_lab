`timescale 1ns / 1ps

module mult(
        input CLK, RST,
        input [7:0] A, B,
        output reg [15:0] product
    );
        integer i;
        reg [15:0] A1, B1;
        always @(posedge CLK) begin
            if (~RST)
                product=0;
            else begin
                product = 0;
                A1[7:0] = 0;
                A1[15:8] = 0;
                B1 = B;
                for (i=0; i<8; i = i+1) begin
                    if (B1[i] == 1'b1) begin
                        product = product + ( A << i );
                    end
                end
           end
      end
endmodule
