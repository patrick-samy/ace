module register#(parameter BIT_WIDTH = 32)
                (input[BIT_WIDTH - 1:0]   in,
                 input                    set,
                 output[BIT_WIDTH - 1: 0] out);

    genvar i;

    generate
        for (i = 0; i < BIT_WIDTH; i = i + 1)
        begin : generic_register
            wire not_d;
            wire q0;
            wire not_q0;
            wire not_q;

            nand (q0, in[i], set);

            not  (not_d, in[i]);
            nand (not_q0, not_d, set);

            nand (out[i], q0, not_q);
            nand (not_q, not_q0, out[i]);
        end
    endgenerate

endmodule
