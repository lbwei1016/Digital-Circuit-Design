module Lab2_half_sub_gatelevel(input a, b, output diff, bout);
    wire    w1;

    not      G1(w1, a);
    and #(2) G2(bout, w1, b);
    xor #(4) G3(diff, a, b);
endmodule