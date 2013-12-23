module register(input[31:0]  in,
                input        set,
                output[31:0] out);

    genvar i;

    generate
        for (i = 0; i < 32; i = i + 1)
        begin : d_flipflop
            wire not_d;
            wire q0;
            wire not_q0;
            wire not_q;

            nand (q0, in[i], set);

            not (not_d, in[i]);
            nand (not_q0, not_d, set);

            nand (out[i], q0, not_q);
            nand (not_q, not_q0, out[i]);
        end
    endgenerate

endmodule
