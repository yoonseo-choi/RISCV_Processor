module RISCV_Processor (input logic clk, reset
);

    /*      Variable Declaration     */

    // control unit

    logic _alusrc_, _mem2reg_, _regwrite_, _memread_, _memwrite_, _branch_;
    logic [1:0] _aluop_;
    logic [6:0] _opcode_;


    datapath DATAPATH (clk, reset, _alusrc_, _mem2reg_, _regwrite_, _memread_, _memwrite_, _branch_, _aluop_, _opcode_);

    Control_Unit CTRL_UNIT (clk, reset, _opcode_, _alusrc_, _mem2reg_, _regwrite_, _memread_, _memwrite_, _branch_, _aluop_);


endmodule