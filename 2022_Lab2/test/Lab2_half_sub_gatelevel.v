module Lab2_half_sub_gatelevel(input a, b, output diff, bout);
    wire    w1;

    not      G1(w1, a);
    and  G2(bout, w1, b);
    xor  G3(diff, a, b);
endmodule