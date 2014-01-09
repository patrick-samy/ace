module data_path_testbench;

    reg[1:0]  input_register_selector_1;
    reg[1:0]  input_register_selector_2;
    reg[1:0]  output_register_selector;
    reg[1:0]  output_source_selector;
    reg       output_enable;
    reg[1:0]  alu_opcode;
    reg[31:0] immediate_1;
    reg[31:0] immediate_2;

    data_path data_path_0(input_register_selector_1, input_register_selector_2,
                          output_register_selector, output_source_selector,
                          output_enable, alu_opcode, immediate_1, immediate_2);

    initial
    begin
        $display("a\tb\tout\tout enabled\talu_opcode\tout data 1\tout data 2");
        $monitor("%d,\t%d,\t%d,\t%b,\t\t%b\t%d\t%d",
                 input_register_selector_1, input_register_selector_2,
                 output_register_selector, output_enable, alu_opcode,
                 data_path_0.input_data_1, data_path_0.input_data_2);

     #0 assign output_enable = 1;
     #0 assign output_source_selector = 1;
     #0 assign immediate_1 = 0;

     #0 assign output_register_selector = 0;
     #0 assign immediate_1 = 21;

     #1 assign output_register_selector = 1;
     #1 assign immediate_1 = 42;

     #2 assign output_register_selector = 2;
     #2 assign immediate_1 = 84;

     #3 assign output_register_selector = 3;
     #3 assign immediate_1 = 168;

     #4 assign output_enable = 0;
     #4 assign input_register_selector_1 = 0;
     #4 assign input_register_selector_2 = 1;

     #5 assign input_register_selector_1 = 2;
     #5 assign input_register_selector_2 = 3;

     #6 assign input_register_selector_1 = 2;
     #6 assign input_register_selector_2 = 3;
     #6 assign output_register_selector = 0;
     #6 assign output_source_selector = 0;
     #6 assign output_enable = 1;
     #6 assign alu_opcode = 'b10;

     #7 assign output_enable = 0;
     #7 assign input_register_selector_1 = 0;
     #7 assign input_register_selector_2 = 0;
    end

endmodule
