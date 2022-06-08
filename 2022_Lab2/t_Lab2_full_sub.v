module  t_Lab2_full_sub;
    wire    diff, bout;
    reg     a, b, bin;
    integer i;

    Lab2_full_sub M(a, b, bin, diff, bout);

    initial begin
        /* 
            雖然 a, b, bin 在同一時間點變動，但 bin 到 diff 間只有一 XOR (delay 4)，而 b 到
            diff 間有兩個 XOR (delay 8)，所以 wave form 上在 b, bin 同時改變後，再 4 time unit
            之後會有一持續 4 time unit 的擾動。
            也就是說，每 8 tiem unit 才能得到正確的 diff。
        */
        for (i=0; i<8; i=i+1) begin
            {a, b, bin} = i;
            #10;
        end
    end
    initial #80 $finish;

    initial begin
        $dumpfile("Lab2_full_sub.vcd");
        $dumpvars;
    end
endmodule