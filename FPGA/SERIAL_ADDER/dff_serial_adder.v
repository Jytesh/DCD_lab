`timescale 1ns / 1ps

module dff_serial_adder(
		input SWITCH, 
		input CLK, RST,
		input A, B,
		output wire SUM, COUT,
		output NEW_CLK
);
		dff u2(SWITCH, CLK, NEW_CLK);
		serial_adder u1(
				NEW_CLK, RST,
				A, B,
				SUM, COUT
		);
endmodule
    
module dff(input D, CLK, output reg Q);
    always @(posedge CLK) begin
        Q <= D;
    end
endmodule
