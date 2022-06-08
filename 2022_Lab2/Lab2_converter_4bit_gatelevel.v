module Lab2_converter_4bit_gatelevel(input [3:0] E, output [3:0] B, output v);
    wire w1, w2, w3, w4, w5, w6, w7, n0, n1, n2, n3;

    not     N0(n0, E[0]);
    not     N1(n1, E[1]);
    not     N2(n2, E[2]);
    not     N3(n3, E[3]);

    // B3
    and     G1(w1, E[3], E[2]);
    and     G2(w2, E[3], E[1], E[0]);
    or      G3(B[3], w1, w2);

    // B2
    and     G4(w3, n2, n0);
    and     G5(w4, n2, n1);
    and     Gx(wx, E[2], E[1], E[0]);
    or      G6(B[2], w3, w4, wx);

    // B1
    xor     G7(B[1], E[1], E[0]);

    // B0
    not     G9(B[0], E[0]);

    // v
    xor     G10(w5, E[3], E[2]);
    and     G11(w6, E[3], n1, n0);
    and     G12(w7, n3, E[1], E[0]);
    or      G13(v, w5, w6, w7);
endmodule