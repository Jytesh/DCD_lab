module tb_tff;
    reg CLK, RESET, T; 
    wire Q;
    t_flip_flop dut(T, CLK, RESET, Q);
    always #5 CLK=~CLK;
    initial begin
    CLK = 0; RESET = 1; T = 0; #10;
    RESET=0; #10;
    T=1; #10;
    T=0; #10;
    T=1; #10;
    RESET=1; #10;
    $finish;
end
endmodule