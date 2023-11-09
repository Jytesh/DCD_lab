module sync_counter(input CLK, LD, CLR, MODE, output reg [15:0] count);
    initial count = 16'b0000000000000000;
    always @(posedge CLK) begin
        if (~LD) count <= 16'b1111111111111111;
        else if (~CLR) count <= 16'b0000000000000000;
        else if (~MODE) begin
            if ( count == 16'b0000000000000000 ) count <= 16'b1111111111111111;
            else count <= count - 1;
        end
        else if (MODE) begin
            if ( count == 16'b1111111111111111 ) count <= 16'b0000000000000000;
            else count <= count + 1;
        end
    end
endmodule