module interstage_buffer_if_id(clock);

    register#(4) id_control_signals_buffer(if_control_signals,
                                           clock,
                                           id_control_signals);
    register#(4) ex_control_signals_buffer(id_control_signals,
                                           clock,
                                           ex_control_signals);
    register#(4) mem_control_signals_buffer(ex_control_signals,
                                           clock,
                                           mem_control_signals);
    register#(4) wb_control_signals_buffer(mem_control_signals,
                                           clock,
                                           wb_control_signals);

endmodule

module interstage_buffer_id_ex(clock);

    register#(4) ex_control_signals_buffer(id_control_signals,
                                           clock,
                                           ex_control_signals);
    register#(4) mem_control_signals_buffer(ex_control_signals,
                                           clock,
                                           mem_control_signals);
    register#(4) wb_control_signals_buffer(mem_control_signals,
                                           clock,
                                           wb_control_signals);

endmodule

module interstage_buffer_ex_mem(clock);

    register#(4) mem_control_signals_buffer(ex_control_signals,
                                           clock,
                                           mem_control_signals);
    register#(4) wb_control_signals_buffer(mem_control_signals,
                                           clock,
                                           wb_control_signals);

endmodule

module interstage_buffer_mem_wb(clock);

    register#(4) wb_control_signals_buffer(mem_control_signals,
                                           clock,
                                           wb_control_signals);

endmodule
