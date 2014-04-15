module data_latch(input data, input enable, output q, output q_bar);

    wire not_data;
    wire qi0;
    wire qi1;

    nand (qi0, data, enable);

    not  (not_data, data);
    nand (qi1, not_data, enable);

    nand (q, qi0, q_bar);
    nand (q_bar, qi1, q);

endmodule
