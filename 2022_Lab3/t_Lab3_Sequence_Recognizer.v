module t_Lab3_Sequence_Recognizer;
    wire sd_z, st_z;
    reg x, clock, reset;
    integer i;

    Lab3_Sequence_Recognizer_state_diagram SD(x, clock, reset, sd_z);
    Lab3_Sequence_Recognizer_structure ST(x, clock, reset, st_z);

    reg [15:0] inputs = 'b0011000101110100;

    // clock period = 20
    always #10 clock = ~clock;

    initial begin
        clock <= 0;
        reset <= 0;
        x <= 0;

        repeat (1) @(posedge clock);
        reset <= 1;

        for (i=0; i<13; i=i+1) begin 
            #19;
            x <= inputs[i]; 
            #1;
        end

        reset <= 0;
        repeat (1) @(posedge clock);
        reset <= 1;

        for (i=13; i<16; i=i+1) begin
            #19;
            x <= inputs[i]; 
            #1;
        end
    end

    initial #370 $finish;

    initial begin
        $dumpfile("Lab3_Sequence_Recognizer.vcd");
        $dumpvars;
    end
endmodule