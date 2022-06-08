module Lab2_converter_4bit_behavioral (input [3:0] E, output reg [3:0] B, output reg v);
    always @(E) begin
        if (E < 3 || E > 12) v = 0;
        else v = 1;
        B = E - 3;
    end
endmodule