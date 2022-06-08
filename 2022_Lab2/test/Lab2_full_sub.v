module Lab2_full_sub(input a, b, bin, output diff, bout);
    wire w1, w2, w3;

    Lab2_half_sub_gatelevel M1(a, b, w1, w2);
    Lab2_half_sub_gatelevel M2(w1, bin, diff, w3);
    or                  G1(bout, w2, w3);
endmodule