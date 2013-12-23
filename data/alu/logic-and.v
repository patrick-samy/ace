module logic_and(input[7:0]  a,
                 input[7:0]  b,
                 output[7:0] c);

    and (c[0], a[0], b[0]);
    and (c[1], a[1], b[1]);
    and (c[2], a[2], b[2]);
    and (c[3], a[3], b[3]);
    and (c[4], a[4], b[4]);
    and (c[5], a[5], b[5]);
    and (c[6], a[6], b[6]);
    and (c[7], a[7], b[7]);

endmodule
