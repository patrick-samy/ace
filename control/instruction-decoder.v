module instruction_decoder(input[31:0] instruction_data,
                           output[3:0] opcode,
                           output      input_type_1,
                           output[1:0] input_register_selector_1,
                           output[7:0] input_immediate_1,
                           output      input_type_2,
                           output[1:0] input_register_selector_2,
                           output[7:0] input_immediate_2,
                           output[1:0] output_register_selector);

    register#(4) r_opcode(instruction_data[31:28], 1, opcode);

    register#(1) r_type_1(instruction_data[27], 1, input_type_1);
    register#(2) r_register_1(instruction_data[26:25], 1,
                              input_register_selector_1);
    register#(8) r_immediate_1(instruction_data[26:19], 1,
                               input_immediate_1);

    register#(1) r_type_2(instruction_data[18], 1, input_type_1);
    register#(2) r_register_2(instruction_data[17:16], 1,
                              input_register_selector_2);
    register#(8) r_immediate_2(instruction_data[17:10], 1,
                               input_immediate_2);

    register#(2) r_output_register(instruction_data[9:8], 1,
                                   output_register_selector);

endmodule
