module Lab2_4_bit_BLS_dataflow(input [3:0] A, B, input bin, output [3:0] D, output bout);
    wire g0, g1, g2, g3, p0, p1, p2, p3, b1, b2, b3;
    assign g0 = !A[0] && B[0];
    assign g1 = !A[1] && B[1];
    assign g2 = !A[2] && B[2];
    assign g3 = !A[3] && B[3];

    assign p0 = !((A[0] && !B[0]) || (!A[0] && B[0]));
    assign p1 = !((A[1] && !B[1]) || (!A[1] && B[1]));
    assign p2 = !((A[2] && !B[2]) || (!A[2] && B[2]));
    assign p3 = !((A[3] && !B[3]) || (!A[3] && B[3]));

    assign b1 = g0 || (bin && p0);
    assign b2 = g1 || (b1 && p1);
    assign b3 = g2 || (b2 && p2);
    assign bout = g3 || (b3 && p3);

    assign D[0] = !((bin && !p0) || (!bin && p0));
    assign D[1] = !((b1 && !p1) || (!b1 && p1));
    assign D[2] = !((b2 && !p2) || (!b2 && p2));
    assign D[3] = !((b3 && !p3) || (!b3 && p3));
endmodule