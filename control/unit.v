module control_unit(input clock);

    wire[31:0] instruction_data;
    wire[2:0]  control_store_address;
    wire[4:0]  control_store_data;
    wire       output_enable;
    wire[3:0]  opcode;
    wire       input_type_1;
    wire[1:0]  input_register_selector_1;
    wire[7:0]  input_immediate_1;
    wire       input_type_2;
    wire[1:0]  input_register_selector_2;
    wire[7:0]  input_immediate_2;
    wire[1:0]  wire_register_selector;
    wire[1:0]  output_register_selector;
    wire[1:0]  alu_opcode;
    wire       next_address;

    instruction_decoder      id(instruction_data, opcode,
                                input_type_1, input_register_selector_1,
                                input_immediate_1,
                                input_type_2, input_register_selector_2,
                                input_immediate_2,
                                output_register_selector);

    microsequencer           useq(clock, opcode, next_address,
                                  control_store_address);

    control_store            cs(control_store_address, control_store_data);

    microinstruction_decoder uid(control_store_data,
                                 output_enable, output_source_selector,
                                 alu_opcode, next_address);

    data_path                dp(input_register_selector_1,
                                input_register_selector_2,
                                output_register_selector,
                                output_source_selector, output_enable,
                                alu_opcode, ir_immediate_1, ir_immediate_2,
                                instruction_data);

endmodule
