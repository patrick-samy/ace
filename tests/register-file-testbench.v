module register_file_tb;

    reg[1:0]   read_register_port_0;
    reg[1:0]   write_register;
    reg[31:0]  write_data;
    reg        write_enable;
    wire[31:0] read_data_port_0;

    register_file rf(read_register_port_0, write_register, write_data,
                     write_enable, read_data_port_0);

    initial
    begin
        $monitor("read_register_port_0=%d write_register=%d write_data=%d write_enable=%d read_data_port_0=%d",
                 read_register_port_0, write_register, write_data,
                 write_enable, read_data_port_0);

    #0  assign write_enable = 'b1;
    #0  assign write_register = 'b00;
    #0  assign write_data = 'd21;
    
    #5  assign write_enable = 'b1;
    #5  assign write_register = 'b01;
    #5  assign write_data = 'd42;

    #10 assign write_enable = 'b1;
    #10 assign write_register = 'b10;
    #10 assign write_data = 'd84;

    #15 assign write_enable = 'b1;
    #15 assign write_register = 'b11;
    #15 assign write_data = 'd168;

    #20 assign write_enable = 'b0;

    #25 assign read_register_port_0 = 'b00;
    #30 assign read_register_port_0 = 'b01;
    #35 assign read_register_port_0 = 'b10;
    #40 assign read_register_port_0 = 'b11;
    end

endmodule
