module register#(parameter BIT_WIDTH = 32)
                (input[BIT_WIDTH - 1:0]   data,
                 input                    set,
                 output[BIT_WIDTH - 1: 0] value);

    genvar i;

    generate
        for (i = 0; i < BIT_WIDTH; i = i + 1)
        begin : data_flip_flop
            wire q_bar;
            data_flip_flop dff(data[i], set, value[i], q_bar);
        end
    endgenerate

endmodule
