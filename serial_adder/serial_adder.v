`timescale 1ns / 1ps

module serial_adder 
    (   input CLK,RST, 
        input A,B,CIN,  
        output reg SUM,COUT
        );

reg CARRY,FLAG;

always@(posedge CLK or posedge RST)
begin
    if(RST == 1) begin 
        SUM = 0;
        COUT = CARRY;
        FLAG = 0;
    end else begin
        if(FLAG == 0) begin
            CARRY = CIN;  
            FLAG = 1;
        end 
        COUT = 0;
        SUM = A ^ B ^ CARRY;  
        COUT = (A & B) | (CARRY & B) | (A & CARRY);  
    end 
end

endmodule 