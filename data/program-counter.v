module program_counter(input        enable_count,
                       input        enable_overwrite,
                       input[31:0]  overwrite_value,
                       output[31:0] out);

    wire[31:0] adder_out;
    wire[31:0] muxed_out;
    wire       carry;
    wire       write_pc;

    arithmetic_adder#(32) pc_adder(out, 4, 0, adder_out, carry);

    multiplexor_2x1#(32)  pc_mux(enable_overwrite, adder_out, overwrite_value,
                                 muxed_out);

    register#(32)         pc_register(muxed_out, enable_count, out);

endmodule
