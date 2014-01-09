module microsequencer(input       enable_count,
                      input[3:0]  opcode,
                      input[2:0]  next_address,
                      output[2:0] address);

    wire[1:0] is_last;
    wire[2:0] new_address;

    microdispatcher udispatcher(opcode, start_address);

    and (is_last[0], next_address[0], next_address[1]);
    and (is_last[1], is_last[0], next_address[2]);

    multiplexor_2x1 address_mux(is_last[1], next_address, start_address,
                                new_address);
    register#(3)    uaddress_register(address, enable_count, address);

endmodule
