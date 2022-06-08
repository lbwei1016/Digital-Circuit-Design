module Lab2_4_bit_BLS_gatelevel(input [3:0] A, B, input bin, output [3:0] D, output bout);
    wire p0, g0, p1, g1, p2, g2, p3, g3, b1, b2, b3;
    wire [3:0] A_comp;

    wire pb, ppb, pppb, ppppb;
    wire p1g0, p2g1, p3g2, p2p1g0, p3p2g1, p3p2p1g0;

    not     N1(A_comp[3], A[3]);
    not     N2(A_comp[2], A[2]);
    not     N3(A_comp[1], A[1]);
    not     N4(A_comp[0], A[0]);

    // gates for Gi and Pi
    xor #(4)     Gx3(p3, A_comp[3], B[3]);
    and #(2)     Ga3(g3, A_comp[3], B[3]);
    xor #(4)     Gx2(p2, A_comp[2], B[2]);
    and #(2)     Ga2(g2, A_comp[2], B[2]);
    xor #(4)     Gx1(p1, A_comp[1], B[1]);
    and #(2)     Ga1(g1, A_comp[1], B[1]);
    xor #(4)     Gx0(p0, A_comp[0], B[0]);
    and #(2)     Ga0(g0, A_comp[0], B[0]);

    // begin of two-level structure 
    // below are chuncks that P and B AND together
    and #(2)     Gpb1(pb, bin, p0);
    and #(2)     Gpb2(ppb, bin, p0, p1);
    and #(2)     Gpb3(pppb, bin, p0, p1, p2);
    and #(2)     Gpb4(ppppb, bin, p0, p1, p2, p3);

    // P and G AND
    and #(2)     Gpg1(p1g0, p1, g0);
    and #(2)     Gpg2(p2g1, p2, g1);
    and #(2)     Gpg3(p3g2, p3, g2);
    and #(2)     Gpg4(p2p1g0, p2, p1, g0);
    and #(2)     Gpg5(p3p2g1, p3, p2, g1);
    and #(2)     Gpg6(p3p2p1g0, p3, p2, p1, g0);

    or #(2)      Gor1(b1, g0, pb);
    or #(2)      Gor2(b2, g1, p1g0, ppb);
    or #(2)      Gor3(b3, g2, p2g1, p2p1g0, pppb);
    or #(2)      Gor4(bout, g3, p3g2, p3p2g1, p3p2p1g0, ppppb);
    // end of two-level structure

    xnor #(4)    Gxn0(D[0], bin, p0);
    xnor #(4)    Gxn1(D[1], b1, p1);
    xnor #(4)    Gxn2(D[2], b2, p2);
    xnor #(4)    Gxn3(D[3], b3, p3);
endmodule