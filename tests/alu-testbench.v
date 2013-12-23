module alu_tb;

    reg[1:0]  opcode;
    reg[7:0]  a;
    reg[7:0]  b;
    wire[7:0] res;
    wire      carry;

    alu alu0(opcode, a, b, res, carry);
    
    initial
    begin
        assign opcode = 2'b11;
        assign a = 0;
        assign b = 255;
        $display("\t\ttime,\topcode,\ta,\tb,\tres,\tcarry");
        $monitor("%d,\t%b,\t%d,\t%d,\t%d,\t%b",$time, opcode, a, b, res, carry);
    end

endmodule
