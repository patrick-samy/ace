module program_counter(input        enable_count,
                       output[31:0] out);

    wire[31:0] adder_out;
    wire       carry;

    arithmetic_adder#(32) pc_adder(out, 4, 0, adder_out, carry);
    register#(32)         pc_register(adder_out, enable_count, out);

endmodule
