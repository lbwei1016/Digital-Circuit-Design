module t_Lab3_NE_Dff_gatelevel;
    wire Q, Qb;
    reg D, clock;

    Lab3_NE_Dff_gatelevel M(D, clock, Q, Qb);

    always #20 clock = ~clock;

    initial fork
        clock = 0;
             D = 0;
        #55  D = 1;
        #97  D = 0;
        #137 D = 1;
        #165 D = 0;
        #195 D = 1;
        #255 D = 0;
    join

    initial #260 $finish;
    
    initial begin
        $dumpfile("Lab3_NE_Dff_gatelevel.vcd");
        $dumpvars;
    end
endmodule