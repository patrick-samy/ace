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

module xor_with(input[7:0]  a,
                input       b,
                output[7:0] out);

    xor (out[0], a[0], b);
    xor (out[1], a[1], b);
    xor (out[2], a[2], b);
    xor (out[3], a[3], b);
    xor (out[4], a[4], b);
    xor (out[5], a[5], b);
    xor (out[6], a[6], b);
    xor (out[7], a[7], b);

endmodule

module add_sub(input[7:0]  a,
               input[7:0]  b,
               input       sub_mode,
               output[7:0] sum,
               output      carry);

    wire[7:0] b0;
    wire[6:0] carries;

    xor_with xor_b(b, sub_mode, b0);

    full_adder fadder0(a[0], b0[0], sub_mode, sum[0], carries[0]);
    full_adder fadder1(a[1], b0[1], carries[0], sum[1], carries[1]);
    full_adder fadder2(a[2], b0[2], carries[1], sum[2], carries[2]);
    full_adder fadder3(a[3], b0[3], carries[2], sum[3], carries[3]);
    full_adder fadder4(a[4], b0[4], carries[3], sum[4], carries[4]);
    full_adder fadder5(a[5], b0[5], carries[4], sum[5], carries[5]);
    full_adder fadder6(a[6], b0[6], carries[5], sum[6], carries[6]);
    full_adder fadder7(a[7], b0[7], carries[6], sum[7], carry);

endmodule
