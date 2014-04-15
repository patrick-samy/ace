module data_flip_flop(input data, input enable, output q, output q_bar);

    wire q0;
    wire q0_bar;
    wire not_enable;

    not (not_enable, enable);

    data_latch d0(data, not_enable, q0, q0_bar);
    data_latch d1(q0, enable, q, q_bar);

endmodule
