module program_counter_testbench;

    reg        clock;
    reg        enable_overwrite;
    reg[31:0]  overwrite_value;
    wire[31:0] pc_value;

    program_counter pc0(clock, enable_overwrite, overwrite_value, pc_value);

    initial
    begin
        $dumpfile("program-counter-test.vcd");
        $dumpvars(0, program_counter_testbench);

        $display("\tclock,\toverwrite\tpc value");
        $monitor("\t%b,\t%b,\t\t%x", clock, enable_overwrite, pc_value);

        #0 clock = 0;
        #0 overwrite_value = 'h42;
        #0 enable_overwrite = 1;

        #4 enable_overwrite = 0;
        #1 overwrite_value = 'h42424242;
        #1 enable_overwrite = 1;
        $display("\n\tjmp 0x42424242\n");
        #1 enable_overwrite = 0;

        #5 $finish;
    end

    always #1 clock = ~clock;

endmodule
