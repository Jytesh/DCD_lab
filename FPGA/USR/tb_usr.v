`timescale 1ns / 1ps

module tb_usr;
    reg CLK, RST, CLR, PARALLEL_MODE, SI, SR;
    reg [0:3] PARALLEL_INPUT;
    
    wire SERIAL_OUT;
    wire [0:3] PARALLEL_OUT;
    
    usr uut( CLK, RST, CLR, PARALLEL_MODE, SI, SR, PARALLEL_INPUT, SERIAL_OUT, PARALLEL_OUT);
    always #5 CLK=~CLK;
    initial begin
        CLK=1; RST=1; CLR=1; PARALLEL_MODE=1; SI=0; PARALLEL_INPUT=4'b1010; SR=0;
        #10 PARALLEL_MODE=0; SI=1;
        #40 SI=0;
        #40 SI=1; SR=1;
        #40 $finish;
    end
endmodule
