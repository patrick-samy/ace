module data_path();

    wire[31:0] input_data_1;
    wire[31:0] input_data_2;
    wire[31:0] output_data;
    wire[31:0] memory_data;
    wire[31:0] alu_data_output;
    wire       alu_carry_output;

    // instruction fetch stage
    program_counter_adder pcadder_0(clock, if_program_counter);

    instruction_memory im_0(if_program_counter, if_instruction_value);

    interstage_buffer_if_id ib_0(if_instruction_value,
                                 clock,
                                 id_instruction_value);

    // instruction decode stage
    instruction_decoder id_0(id_instruction_value,
                             id_alu_opcode,
                             id_input_type_1,
                             id_input_register_selector_1,
                             id_input_immediate_1,
                             id_input_type_2,
                             id_input_register_selector_2,
                             id_input_immediate_2,
                             id_output_enable,
                             id_output_source_selector,
                             id_output_register_selector);

    register_file rf_0(id_input_register_selector_1,
                       id_input_register_selector_2,
                       wb_output_register_selector,
                       wb_output_data,
                       wb_output_enable,
                       id_input_data_1,
                       id_input_data_2);

    interstage_buffer_id_ex(id_alu_opcode,
                            id_operand_1,
                            id_operand_2,
                            id_input_immediate_1,
                            id_output_enable,
                            id_output_source_selector,
                            id_output_register_selector,
                            clock,
                            ex_alu_opcde,
                            ex_operand_1,
                            ex_operand_2,
                            ex_input_immediate_1,
                            ex_output_enable,
                            ex_output_source_selector,
                            ex_output_register_selector);

    // execute stage
    alu alu_0(ex_alu_opcode,
              ex_operand_1,
              ex_operand_2,
              ex_alu_data_output,
              ex_alu_carry_output);

    interstage_buffer_ex_mem(ex_alu_data_output,
                             ex_input_immediate_1,
                             ex_output_source_selector,
                             ex_output_register_selector, clock,
                             mem_alu_data_output,
                             mem_input_immediate_1
                             mem_output_source_selector,
                             mem_output_register_selector);

    // memory stage
    interstage_buffer_mem_wb(mem_alu_data_output,
                             mem_input_immediate_1,
                             mem_output_source_selector,
                             mem_output_register_selector,
                             clock,
                             wb_alu_data_output,
                             wb_input_immediate_1,
                             wb_ouput_source_selector,
                             wb_output_register_selector);

    // writeback stage
    multiplexor_4x1 output_mux_0(wb_output_source_selector,
                                 wb_alu_data_output,
                                 b_input_immediate_1,
                                 0,
                                 wb_memory_data,
                                 wb_output_data);

endmodule
