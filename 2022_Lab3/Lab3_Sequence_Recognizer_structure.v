module Lab3_Sequence_Recognizer_structure (input x, clock, reset, output reg z);
    reg Da, Db, Dc;
    wire A, B, C;

    D_ff_AR DA(Da, clock, reset, A);
    D_ff_AR DB(Db, clock, reset, B);
    D_ff_AR DC(Dc, clock, reset, C);

    always @(posedge clock, x) begin
        Da = A&x | !C&x | B&C&(!x);
        Db = A&(!C)&(!x) | !A&C&x | B&(!C)&(!x);
        Dc = !x | A&C;
        z = B&(!C)&(!x);
    end
endmodule