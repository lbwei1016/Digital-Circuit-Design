module Lab3_SR_Latch_gatelevel (input S, R, output Q, Qb);
    nor #10   G1(Q, R, Qb);
    nor #10   G2(Qb, S, Q);
endmodule