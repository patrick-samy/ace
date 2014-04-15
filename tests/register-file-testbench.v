module register_file_testbench;

    reg[1:0]   read_register_port_0;
    reg[1:0]   read_register_port_1;
    reg[1:0]   write_register;
    reg[31:0]  write_data;
    reg        write_enable;
    wire[31:0] read_data_port_0;
    wire[31:0] read_data_port_1;

    register_file rf(read_register_port_0, read_register_port_1,
                     write_register, write_data, write_enable,
                     read_data_port_0, read_data_port_1);

    initial
    begin
        $dumpfile("register-file-test.vcd");
        $dumpvars(0, register_file_testbench);
        $monitor("read_register_port_0=%d write_register=%d write_data=%d write_enable=%d read_data_port_0=%d",
                 read_register_port_0, write_register, write_data,
                 write_enable, read_data_port_0);

    #0  write_enable = 'b0;
    #0  write_data = 'd21;
    #0  write_register = 'b00;
    #1  write_enable = 'b1;
    #1  write_enable = 'b0;
    
    #0  write_register = 'b01;
    #0  write_data = 'd42;
    #1  write_enable = 'b1;
    #1  write_enable = 'b0;

    #0  write_register = 'b10;
    #0  write_data = 'd84;
    #1  write_enable = 'b1;
    #1  write_enable = 'b0;
    
    #0  write_register = 'b11;
    #0  write_data = 'd168;
    #1  write_enable = 'b1;
    #1  write_enable = 'b0;

    #1  read_register_port_0 = 'b00;
    #1  read_register_port_0 = 'b01;
    #1  read_register_port_0 = 'b10;
    #1  read_register_port_0 = 'b11;
    end

endmodule
