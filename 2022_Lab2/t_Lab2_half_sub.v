module t_Lab2_half_sub;
    wire    diff, bout;
    reg     a, b;
    integer i;

    Lab2_half_sub_gatelevel M1(a, b, diff, bout);

    initial begin
        for (i=0; i<4; i=i+1) begin
            {a, b} = i;
            #10;
        end
    end
    initial #50 $finish;

    initial begin   
        $dumpfile("Lab2_half_sub_gatelevel.vcd");
        $dumpvars;
    end
endmodule