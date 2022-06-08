module Lab2_4_bit_RBS(input [3:0] A, B, input bin, output [3:0] D, output bout);
    wire b1, b2, b3;
    Lab2_full_sub   M1(A[0], B[0], bin, D[0], b1);
    Lab2_full_sub   M2(A[1], B[1], b1, D[1], b2);
    Lab2_full_sub   M3(A[2], B[2], b2, D[2], b3);
    Lab2_full_sub   M4(A[3], B[3], b3, D[3], bout);
endmodule