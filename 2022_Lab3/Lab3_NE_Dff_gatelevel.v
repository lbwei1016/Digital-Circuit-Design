module Lab3_NE_Dff_gatelevel (input D, clock, output Q, Qb);
    wire w1, w2, w3, tmp;
    Lab3_SR_Latch_gatelevel L1(clock, w1, tmp, w2);
    Lab3_SR_Latch_gatelevel L2(w3, w2, Q, Qb);
    nor #10     G1(w1, w3, D);
    nor #10     G2(w3, w2, w1, clock);
endmodule