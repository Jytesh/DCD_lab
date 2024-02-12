`timescale 1ns / 1ps

module tb_mult;
    reg [15:0] A, B;
    wire [31:0] OUT;
    
    vedic_mult_16 dut(A, B, OUT);
    initial begin
        A = 16'd0; B = 16'd0;
        #10 A = 16'd256; B = 16'd255;
        #10 A = 16'd254; B = 16'd254;
        #10 A = 16'd13; B = 16'd14;
        #10 A = 16'd143; B = 16'd143;

        #10 $finish;
     end
endmodule
