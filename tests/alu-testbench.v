module alu_testbench;

    reg[1:0]   opcode;
    reg[31:0]  a;
    reg[31:0]  b;
    wire[31:0] res;
    wire       carry;

    alu alu0(opcode, a, b, res, carry);

    initial
    begin
        assign opcode = 2'b10;
        assign a = 21;
        assign b = 21;
        $display("\t\ttime,\topcode,\ta,\tb,\tres,\tcarry");
        $monitor("%d,\t%b,\t%d,\t%d,\t%d,\t%b",
                 $time, opcode, a, b, res, carry);
    end

endmodule
