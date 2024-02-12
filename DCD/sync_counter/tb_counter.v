module tb_counter;
    reg CLK, LD, CLR, MODE;
    wire [15:0] count;
    sync_counter uut(CLK, LD, CLR, MODE, count);
    
    always #10 CLK=~CLK;
    initial begin
        CLK = 0; CLR=0; MODE=1; LD=1;
        #10 CLR=1;
        #40 LD=0; MODE=0;
        #10 LD=1;
        #40 $finish;
    end
endmodule