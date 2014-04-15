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

        // instruction fetch stage
        program_counter_adder pc_adder_0(clock, program_counter);

        instruction_memory im_0(program_counter, instruction_register);

        interstage_buffer_if_id(clock);

        // instruction decode stage
        multiplexor_4x1 output_mux_0(output_source_selector, alu_data_output,
                                     ir_immediate_1, ir_immediate_2,
                                     memory_data, output_data);

        register_file rf_0(input_register_selector_1, input_register_selector_2,
                           output_register_selector, output_data, output_enable,
                           input_data_1, input_data_2);

        interstage_buffer_id_ex(clock);

        // execute stage
        alu alu_0(alu_opcode, input_data_1, input_data_2,
                  alu_data_output, alu_carry_output);

        interstage_buffer_ex_mem(clock);

        // memory stage
        data_memory dm_0(memory_read_enable, memory_read_address,
                         memory_write_enable, memory_write_data,
                         memory_read_data);

        interstage_buffer_mem_wb(clock);

        // writeback stage

endmodule
