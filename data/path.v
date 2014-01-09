module data_path(input[1:0]  input_register_selector_1,
                 input[1:0]  input_register_selector_2,
                 input[1:0]  output_register_selector,
                 input[1:0]  output_source_selector,
                 input       output_enable,
                 input[1:0]  alu_opcode,
                 input[31:0] ir_immediate_1,
                 input[31:0] ir_immediate_2);

        wire[31:0] input_data_1;
        wire[31:0] input_data_2;
        wire[31:0] output_data;
        wire[31:0] memory_data;
        wire[31:0] alu_data_output;
        wire       alu_carry_output;

        multiplexor_4x1 output_data_mux_0(output_source_selector,
                                          alu_data_output, ir_immediate_1,
                                          ir_immediate_2, memory_data,
                                          output_data);

        register_file rf_0(input_register_selector_1, input_register_selector_2,
                           output_register_selector, output_data, output_enable,
                           input_data_1, input_data_2);

        alu alu_0(alu_opcode, input_data_1, input_data_2,
                  alu_data_output, alu_carry_output);

endmodule
