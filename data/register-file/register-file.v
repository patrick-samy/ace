module register_file(input[1:0]   read_register_port_0,
                     input[1:0]   read_register_port_1,
                     input[1:0]   write_register,
                     input[31:0]  write_data,
                     input        write_enable,
                     output[31:0] read_data_port_0,
                     output[31:0] read_data_port_1);

    wire[31:0] mux_in0;
    wire[31:0] mux_in1;
    wire[31:0] mux_in2;
    wire[31:0] mux_in3;
    wire[3:0]  dec_out;
    wire[3:0]  write_enabled_register;

    decoder_2x4 dec_write_register(write_register, dec_out);
    and (write_enabled_register[0], write_enable, dec_out[0]);
    and (write_enabled_register[1], write_enable, dec_out[1]);
    and (write_enabled_register[2], write_enable, dec_out[2]);
    and (write_enabled_register[3], write_enable, dec_out[3]);

    register r0(write_data, write_enabled_register[0], mux_in0);
    register r1(write_data, write_enabled_register[1], mux_in1);
    register r2(write_data, write_enabled_register[2], mux_in2);
    register r3(write_data, write_enabled_register[3], mux_in3);

    multiplexor_4x1 mux_data_port_0(read_register_port_0,
                                    mux_in0, mux_in1, mux_in2, mux_in3,
                                    read_data_port_0);

    multiplexor_4x1 mux_data_port_1(read_register_port_1,
                                    mux_in0, mux_in1, mux_in2, mux_in3,
                                    read_data_port_1);
endmodule
