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
    xor     Gx3(p3, A_comp[3], B[3]);
    and     Ga3(g3, A_comp[3], B[3]);
    xor     Gx2(p2, A_comp[2], B[2]);
    and     Ga2(g2, A_comp[2], B[2]);
    xor     Gx1(p1, A_comp[1], B[1]);
    and     Ga1(g1, A_comp[1], B[1]);
    xor     Gx0(p0, A_comp[0], B[0]);
    and     Ga0(g0, A_comp[0], B[0]);

    // begin of two-level structure 
    // below are chuncks that P and B AND together
    and     Gpb1(pb, bin, p0);
    and     Gpb2(ppb, pb, p1);
    and     Gpb3(pppb, ppb, p2);
    and     Gpb4(ppppb, pppb, p3);

    // P and G AND
    and     Gpg1(p1g0, p1, g0);
    and     Gpg2(p2g1, p2, g1);
    and     Gpg3(p3g2, p3, g2);
    and     Gpg4(p2p1g0, p2, p1g0);
    and     Gpg5(p3p2g1, p3, p2g1);
    and     Gpg6(p3p2p1g0, p3, p2p1g0);

    or      Gor1(b1, g0, pb);
    or      Gor2(b2, g1, p1g0, ppb);
    or      Gor3(b3, g2, p2g1, p2p1g0, pppb);
    or      Gor4(bout, g3, p3g2, p3p2g1, p3p2p1g0, ppppb);
    // end of two-level structure

    xnor    Gxn0(D[0], bin, p0);
    xnor    Gxn1(D[1], b1, p1);
    xnor    Gxn2(D[2], b2, p2);
    xnor    Gxn3(D[3], b3, p3);
endmodule