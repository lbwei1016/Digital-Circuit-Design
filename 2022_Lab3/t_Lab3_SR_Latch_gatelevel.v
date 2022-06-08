module t_Lab3_SR_Latch_gatelevel;
    wire    Q, Qb;
    reg     S, R;

    Lab3_SR_Latch_gatelevel M(S, R, Q, Qb);

    initial begin
                S = 1'b0; R = 1'b1;
        #30     S = 1'b1; R = 1'b0;
        #30     S = 1'b0; R = 1'b0;
        #30     S = 1'b1; R = 1'b0;
        #30     S = 1'b1; R = 1'b1;
        #50     S = 1'b0; R = 1'b0;
        #30     S = 1'b0; R = 1'b1;
    end
    initial #250 $finish;

    initial begin
        $dumpfile("Lab3_SR_Latch_gatelevel.vcd");
        $dumpvars;
    end
endmodule