module logic_or(input[7:0]  a,
                input[7:0]  b,
                output[7:0] c);

    or (c[0], a[0], b[0]);
    or (c[1], a[1], b[1]);
    or (c[2], a[2], b[2]);
    or (c[3], a[3], b[3]);
    or (c[4], a[4], b[4]);
    or (c[5], a[5], b[5]);
    or (c[6], a[6], b[6]);
    or (c[7], a[7], b[7]);

endmodule
