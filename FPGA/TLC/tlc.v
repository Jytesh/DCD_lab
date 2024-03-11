module controller(H, L, LTV, RST, CLK);
    output reg [2:0] H, L; // H[2] = R, H[1] = Y, H[0] = G;
    input LTV, CLK, RST;
    reg [2:0] TMY, TMR, TMG;
    initial begin
        H = 3'b001; L = 3'b100; TMR = 7; TMY = 7; TMG = 7;
    end
    always@(posedge CLK) begin
        if (RST) begin
            H = 3'b001; L = 3'b100;
            TMR = 7; TMY = 7; TMG = 7;
        end
        if ((H == 3'b001) && TMG != 5)
            TMG = TMG + 1;
        if (LTV && (TMG == 5)) begin
            TMG = 7;
            H = 3'b010; L = 3'b100;
        end
        if (H == 3'b010)
            TMY = TMY + 1;
        if ((TMY == 2) && H == 3'b010) begin
            TMY = 7;
            H = 3'b100; L = 3'b001;
        end
        if (L == 3'b001) begin
            TMR = TMR + 1;
        end
        if (((TMR == 5) || ~LTV) && H == 3'b100 && L == 3'b001) begin
            TMR = 7;
            H = 3'b100; L = 3'b010;
        end
        if (L == 3'b010)
            TMY = TMY + 1;
        if ((TMY == 2) && L == 3'b010) begin
            TMY = 7;
            H = 3'b001; L = 3'b100;
        end
        $display("TMR: %d, TMG: %d, TMY: %d", TMR, TMG, TMY);
    end
endmodule

module DEVICE (H, L, LTV, RST, CLK_SLOW, CLK); 
    reg [26:0] count;
    wire clk_slow;
    output reg CLK_SLOW;
    input CLK;
    output [2:0] H, L;
    input LTV, RST;
    controller D0(H, L, LTV, RST, clk_slow);
//--------------------------------
    assign clk_slow = CLK_SLOW;
    initial begin
        count = 0; CLK_SLOW = 0;
    end
    always@(posedge CLK) begin
        if (count == 100000000) count = 0; // TP_CLK_SLOW = count * TP_CLK * 2
        if (count == 0) begin
            CLK_SLOW = ~CLK_SLOW;
        end
        count = count + 1;
    end
endmodule