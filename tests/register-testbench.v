module register_testbench;

    reg[31:0]  value;
    wire[31:0] out;
    reg        set;

    register r1(value, set, out);

    initial
    begin
        $monitor("value=%d set=%b out=%d", value, set, out);
    #0  value = 'd42;
    #0  set = 0;
    #1  set = 1;
    #1  set = 0;
    #1  value = 'd21;
    #1  set = 1;
    end

endmodule
