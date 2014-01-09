module logic_or(input[31:0]  a,
                input[31:0]  b,
                output[31:0] c);

    genvar i;

    generate
        for (i = 0; i < 32; i = i + 1)
        begin: or_1x1
            or (c[i], a[i], b[i]);
        end
    endgenerate

endmodule
