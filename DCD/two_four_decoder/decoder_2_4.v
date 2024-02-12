`timescale 1ns / 1ps

module decoder_2_4(
    input A1,
    input A2,
    input ENABLE,
    output X1,
     X2,
     X3,
     X4
    );
    
    assign X1 = (ENABLE & (!A1 & !A2));
    assign X2 = (ENABLE & (!A1 & A2));
    assign X3 = (ENABLE & (A1 & !A2));
    assign X4 = (ENABLE & (A1 & A2));
    
endmodule
