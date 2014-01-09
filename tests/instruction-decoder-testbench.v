module instruction_decoder_testbench();

    reg[31:0] instruction_data;
    wire[3:0] opcode;
    wire      input_type_1;
    wire[1:0] input_register_selector_1;
    wire[7:0] input_immediate_1;
    wire      input_type_2;
    wire[1:0] input_register_selector_2;
    wire[7:0] input_immediate_2;
    wire[1:0] output_register_selector;

    instruction_decoder id(instruction_data, opcode,
                           input_type_1, input_register_selector_1,
                           input_immediate_1, input_type_2, 
                           input_register_selector_2, input_immediate_2,
                           output_register_selector);

    initial
    begin   
     #0 assign instruction_data = 'h00000000;
        
        $display("opcode\treg s1\treg s2\treg d\timm 1\timm 2");
        $monitor("%b\t%d\t%d\t%d\t%d\t%d",
                 opcode, input_register_selector_1, input_register_selector_2,
                 output_register_selector,
                 input_immediate_1, input_immediate_2);
 
                                  /* 0 |   r0   | i 255  | r0 |  0  */
     #1 assign instruction_data = 'b00000010000001111111110000000000;
                                  /* 1 |   r3   | i 42   | r0 |  0  */
     #2 assign instruction_data = 'b00010110000001001010100100000000;
                                  /* 2 |   i 1  |   r0   | r0 |  0  */
     #3 assign instruction_data = 'b00101000000010000000001000000000;
                                  /* 3 |  i 255 |   r2   | r0 |  0  */
     #4 assign instruction_data = 'b00111111111110100000001100000000;
    end

endmodule
