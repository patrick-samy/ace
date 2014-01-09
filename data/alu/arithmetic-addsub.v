module full_adder(input  a,
                  input  b,
                  input  in_carry,
                  output sum,
                  output carry);

    wire sum0;
    wire carry0;
    wire carry1;

    xor (sum0, a, b);
    and (carry0, a, b);

    xor (sum, sum0, in_carry);
    and (carry1, sum0, in_carry);

    xor (carry, carry0, carry1);

endmodule

module arithmetic_adder#(parameter BIT_WIDTH = 32)
                        (input[BIT_WIDTH - 1:0]  a,
                         input[BIT_WIDTH - 1:0]  b,
                         input                   sub_mode,
                         output[BIT_WIDTH - 1:0] sum,
                         output                  carry);

    genvar                i;
    wire[BIT_WIDTH - 1:0] b0;
    wire[BIT_WIDTH - 2:0] carries;

    generate
        for (i = 0; i < BIT_WIDTH; i = i + 1)
        begin : xor_1x1
            xor (b0[i], b[i], sub_mode);
        end
    endgenerate

    full_adder fadder_0(a[0], b0[0], sub_mode, sum[0], carries[0]);

    generate
        for (i = 1; i < BIT_WIDTH - 1; i = i + 1)
        begin : full_adder
            full_adder fadder_i(a[i], b0[i], carries[i - 1],
                                sum[i], carries[i]);
        end
    endgenerate

    full_adder fadder_31(a[BIT_WIDTH - 1], b0[BIT_WIDTH - 1],
                         carries[BIT_WIDTH - 2], sum[BIT_WIDTH - 1], carry);

endmodule
