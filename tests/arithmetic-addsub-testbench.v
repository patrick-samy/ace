module add_sub_tb;

    reg  a;
    reg  b;
    reg  in_carry;
    wire sum;
    wire carry;

    full_adder fa0(a, b, in_carry, sum, carry);
    
    initial
    begin
        assign a = 1'b0;
        assign b = 1'b0;
        assign in_carry = 1'b1;

        $monitor("a=%b b=%b in_carry=%b sum=%b carry=%b",
                 a, b, in_carry, sum, carry);
    end

    /*reg[7:0]  a;
    reg[7:0]  b;
    reg       sub_mode;
    wire[7:0] res;
    wire      carry;

    add_sub add_sub0(a, b, sub_mode, res, carry);
    
    initial
    begin
        assign a = 8'b00000000;
        assign b = 8'b00000001;
        assign sub_mode = 1'b0;
        $display("\t\ttime,\ta,\tb,\tsub_mode,\tres,\tcarry");
        $monitor("%d,\t%b,\t%b,\t%b,\t%b\t%d",
                 $time, a, b, sub_mode, res, carry);
    end*/

endmodule
