module decoder_2x4(input[1:0]  in,
                   output[3:0] out);

    wire neg_in_0;
    wire neg_in_1;

    nor (out[0], in[0], in[1]);
   
    not (neg_in_1, in[1]);
    and (out[1], in[0], neg_in_1);

    not (neg_in_0, in[0]);
    and (out[2], in[1], neg_in_0);

    and (out[3], in[0], in[1]);

endmodule
