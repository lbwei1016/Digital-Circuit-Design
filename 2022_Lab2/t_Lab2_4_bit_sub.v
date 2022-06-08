module t_Lab2_4_bit_sub;
    wire [3:0] D1, D2, D3, D4;
    wire bout1, bout2, bout3, bout4;
    reg [3:0] A, B;
    reg bin; 

    Lab2_4_bit_RBS RBS(A, B, bin, D1, bout1);
    Lab2_4_bit_BLS_gatelevel BLS_gatelevel(A, B, bin, D2, bout2);
    Lab2_4_bit_BLS_dataflow BLS_dataflow(A, B, bin, D3, bout3);
    Lab2_4_bit_BLS_behavioral BLS_behavioral (A, B, bin, D4, bout4);

    initial begin
        // the gate delay of RBS is "2n+2" => 10*2 = 20 time unit
            A = 4'b0000; B = 4'b1100; bin = 1'b1;
        #20 A = 4'b0001; B = 4'b0010; bin = 1'b1;
        #20 A = 4'b0011; B = 4'b0110; bin = 1'b1;
        #20 A = 4'b0101; B = 4'b1011; bin = 1'b0;
        #20 A = 4'b0111; B = 4'b1010; bin = 1'b1;
        #20 A = 4'b1000; B = 4'b0001; bin = 1'b0;
        #20 A = 4'b1011; B = 4'b0110; bin = 1'b0;
        #20 A = 4'b1111; B = 4'b1111; bin = 1'b1;
    end

    initial #180 $finish;

    initial begin   
        $dumpfile("Lab2_4_bit_sub.vcd");
        $dumpvars;
    end
endmodule
