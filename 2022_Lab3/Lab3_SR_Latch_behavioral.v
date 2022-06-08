module Lab3_SR_Latch_behavioral (input S, R, output reg Q, Qb);
    always @(*) begin
        if (S && R) begin
            Q <= 0;
            Qb <= 0;
        end
        else if (S) begin
            Q <= 1;
            Qb <= 0;
        end
        else if (R) begin
            Q <= 0;
            Qb <= 1;
        end
    end
endmodule