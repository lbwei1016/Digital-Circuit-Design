module  t_Lab2_full_sub;
    wire    diff, bout;
    reg     a, b, bin;
    integer i;

    Lab2_full_sub M(a, b, bin, diff, bout);

    initial begin
        for (i=0; i<8; i=i+1) begin
            {a, b, bin} = i;
            #10;
        end
    end
    initial #90 $finish;

    initial begin
        $dumpfile("Lab2_full_sub.vcd");
        $dumpvars;
    end
endmodule