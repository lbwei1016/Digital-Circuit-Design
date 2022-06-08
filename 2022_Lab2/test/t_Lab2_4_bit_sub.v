module t_Lab2_4_bit_sub;
    wire [3:0] D1, D2;
    wire bout1, bout2;
    reg [3:0] A, B;
    reg bin; 

    Lab2_4_bit_RBS RBS(A, B, bin, D1, bout1);
    Lab2_4_bit_BLS_gatelevel BLS(A, B, bin, D2, bout2);

    initial begin
            A = 4'b0000; B = 4'b1100; bin = 1'b1;
        #20 A = 4'b0001; B = 4'b0010; bin = 1'b1;
        #20 A = 4'b0011; B = 4'b0110; bin = 1'b1;
        #20 A = 4'b0101; B = 4'b1011; bin = 1'b0;
        #20 A = 4'b0111; B = 4'b1010; bin = 1'b1;
        #20 A = 4'b1000; B = 4'b0001; bin = 1'b0;
        #20 A = 4'b1011; B = 4'b0110; bin = 1'b0;
        #20 A = 4'b1111; B = 4'b1111; bin = 1'b1;
    end

    initial #160 $finish;

    initial begin   
        $dumpfile("Lab2_4_bit_sub.vcd");
        $dumpvars;
    end
endmodule
