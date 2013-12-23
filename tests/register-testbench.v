module register_tb;

    reg[31:0]  value;
    wire[31:0] out;
    reg        set;

    register r1(value, set, out);

    initial
    begin
        $monitor("value=%d set=%b out=%d", value, set, out);
        assign value = 'd42;
    #0  assign set = 0;
    #1  assign set = 1;
    #2  assign set = 0;
    #5  assign value = 'd21;
    #10 assign set = 1;
    end

endmodule
