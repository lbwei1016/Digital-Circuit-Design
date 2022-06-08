module Lab1_gatelevel(F, A, B, C, D);
    output  F;
    input   A, B, C, D;
    wire    w1, w2, w3, w4, w5, w6, w7;

    not     G1(w1, B);
    or      G2(w2, w1, A);
    and     G3(w3, B, C);
    not     G4(w4, D);
    and     G5(w5, C, w2);
    or      G6(w6, w3, w4);
    and     G7(w7, w6, A);
    or      G8(F, w5, w7);
endmodule