module mux_2x1(input       control,
               input[7:0]  in0,
               input[7:0]  in1,
               output[7:0] out);

    wire neg_control;
    wire out0[7:0];
    wire out1[7:0];

    not (neg_control, control);
    and (out0[0], neg_control, in0[0]);
    and (out0[1], neg_control, in0[1]);
    and (out0[2], neg_control, in0[2]);
    and (out0[3], neg_control, in0[3]);
    and (out0[4], neg_control, in0[4]);
    and (out0[5], neg_control, in0[5]);
    and (out0[6], neg_control, in0[6]);
    and (out0[7], neg_control, in0[7]);

    and (out1[0], control, in1[0]);
    and (out1[1], control, in1[1]);
    and (out1[2], control, in1[2]);
    and (out1[3], control, in1[3]);
    and (out1[4], control, in1[4]);
    and (out1[5], control, in1[5]);
    and (out1[6], control, in1[6]);
    and (out1[7], control, in1[7]);

    or (out[0], out0[0], out1[0]);
    or (out[1], out0[1], out1[1]);
    or (out[2], out0[2], out1[2]);
    or (out[3], out0[3], out1[3]);
    or (out[4], out0[4], out1[4]);
    or (out[5], out0[5], out1[5]);
    or (out[6], out0[6], out1[6]);
    or (out[7], out0[7], out1[7]);

endmodule

module alu(input[1:0]  opcode,
           input[7:0]  a,
           input[7:0]  b,
           output[7:0] out,
           output      carry);

    wire[7:0] logic_and_out;
    wire[7:0] logic_or_out;
    wire[7:0] logic_out;
    wire[7:0] add_sub_out;

    logic_and and0(a, b, logic_and_out);
    logic_or or0(a, b, logic_or_out);
    add_sub add_sub0(a, b, opcode[0], add_sub_out, carry);

    mux_2x1 mux0(opcode[0], logic_and_out, logic_or_out, logic_out);
    mux_2x1 mux1(opcode[1], logic_out, add_sub_out, out);

endmodule
