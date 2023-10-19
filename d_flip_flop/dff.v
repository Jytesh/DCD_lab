module d_flip_flop(
    input D,     // Data input
    input CLK,   // Clock input
    input RST,   // Reset input
    output reg Q  // Output Q
);

always @(posedge CLK or posedge RST) begin
    if (RST) begin
        Q <= 1'b0; // Reset the flip-flop to 0
    end else begin
        Q <= D; // Store the D input on the rising edge of the clock
    end
end

endmodule