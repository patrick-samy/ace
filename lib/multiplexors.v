module multiplexor_2x1(input        control,
                       input[31:0]  in0,
                       input[31:0]  in1,
                       output[31:0] out);

    wire       neg_control;
    wire[31:0] out0;
    wire[31:0] out1;
    genvar     i;

    not (neg_control, control);
    
    generate
        for (i = 0; i < 32; i = i + 1)
        begin : mux_bit
            and (out0[i], neg_control, in0[i]);
            and (out1[i], control, in1[i]);
            or (out[i], out0[i], out1[i]);
        end
    endgenerate

endmodule

module multiplexor_4x1(input[1:0]   control,
                       input[31:0]  in0,
                       input[31:0]  in1,
                       input[31:0]  in2,
                       input[31:0]  in3,
                       output[31:0] out);

    wire[31:0] multiplexor0_out;
    wire[31:0] multiplexor1_out;

    multiplexor_2x1 multiplexor0(control[0], in0, in1, multiplexor0_out);
    multiplexor_2x1 multiplexor1(control[0], in2, in3, multiplexor1_out);

    multiplexor_2x1 multiplexor_out(control[1], multiplexor0_out,
                                    multiplexor1_out, out);

endmodule
