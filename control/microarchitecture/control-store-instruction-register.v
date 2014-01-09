module control_store_instruction_register(input[4:0]  control_store_data,
                                          output      output_enable,
                                          output[1:0] output_register_selector,
                                          output[1:0] alu_opcode,
                                          output      next_address);

    register#(1) r0(control_store_data[0], 1, output_enable);
    register#(2) r12(control_store_data[2:1], 1, output_register_selector);
    register#(2) r34(control_store_data[4:3], 1, alu_opcode);

endmodule
