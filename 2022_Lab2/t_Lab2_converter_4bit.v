module t_Lab2_converter_4bit;
    wire [3:0] B1, B2, B3;
    wire v1, v2, v3;
    reg [3:0] E;
    integer i;

    Lab2_converter_4bit_gatelevel gatelevel(E, B1, v1);
    Lab2_converter_4bit_dataflow dataflow(E, B2, v2);
    Lab2_converter_4bit_behavioral behavioral(E, B3, v3);
    
    initial begin
        for (i=0; i<16; i=i+1) begin
            {E} = i;
            #10;
        end
    end

    initial #160 $finish;
    initial begin
        $dumpfile("Lab2_converter_4bit.vcd");
        $dumpvars;
    end
endmodule