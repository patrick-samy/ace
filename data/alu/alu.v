module alu(input[1:0]   opcode,
           input[31:0]  a,
           input[31:0]  b,
           output[31:0] out,
           output       carry);

    wire[31:0] logic_and_out;
    wire[31:0] logic_or_out;
    wire[31:0] logic_out;
    wire[31:0] adder_out;

    logic_and             and_0(a, b, logic_and_out);
    logic_or              or_0(a, b, logic_or_out);
    arithmetic_adder#(32) adder_0(a, b, opcode[0], adder_out, carry);

    multiplexor_2x1 opcode_mux_0(opcode[0], logic_and_out,
                                 logic_or_out, logic_out);
    multiplexor_2x1 opcode_mux_1(opcode[1], logic_out, adder_out, out);

endmodule
