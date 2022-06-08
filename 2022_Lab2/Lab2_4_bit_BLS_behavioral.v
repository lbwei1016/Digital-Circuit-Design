module Lab2_4_bit_BLS_behavioral(input [3:0] A, B, input bin, output reg [3:0] D, output reg bout);
    always @(A, B, bin) begin
        {bout, D} = A - B - bin;
    end
endmodule