module Lab1_dataflow(
    output  F,
    input   A, B, C, D
);

    assign  F = ((A || !B) && C) || (((B && C) || !D) && A);
endmodule