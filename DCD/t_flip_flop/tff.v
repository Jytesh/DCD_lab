module t_flip_flop(
    input T,     // T input for the flip-flop
    input CLK,   // Clock input
    input RST,   // Reset input
    output reg Q  // Output Q
);

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        Q <= 1'b0; // Reset the flip-flop to 0
    end else begin
        if (T) begin
            Q <= ~Q; // Toggle Q when T is 1
        end
    end
end

endmodule