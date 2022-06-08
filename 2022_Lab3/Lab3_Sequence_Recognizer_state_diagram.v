module Lab3_Sequence_Recognizer_state_diagram (input x, clock, reset, output z);
    reg [2:0] state, next_state;
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110;

    // state transition
    always @(posedge clock, negedge reset) begin
        if (!reset) state <= S0;
        else state <= next_state;
    end
    // form next state
    always @(state, x) begin
        case (state)
            S0: next_state <= x ? S4 : S1;
            S1: next_state <= x ? S2 : S1;
            S2: next_state <= x ? S4 : S3;
            S3: next_state <= x ? S2 : S6;
            S4: next_state <= x ? S4 : S5;
            S5: next_state <= x ? S2 : S6;
            S6: next_state <= S6;
        endcase
    end

    assign z = (state == S2 && x == 0) ? 1 : 0;
endmodule