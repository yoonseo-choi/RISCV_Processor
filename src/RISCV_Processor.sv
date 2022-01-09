module RISCV_Processor (input logic clk, reset, select
);

    /*                 PC LOGIC                */
    /*=========================================*/

    logic [31:0] _pc_next_, _pc_;           // pc and next pc  
    logic _pc_select_;                      // select line for pc mux
    logic [31:0] _pc_in1_;                         // first input to pc mux


    Mux_2x1 PC_MUX (0, _pc_in1_, _pc_select_, _pc_next_);       // pc is temporary counter (change to 4x1 mux later)

    D_FlipFlop PC_DFF (_pc_next_, clk, _pc_);  

    assign _pc_in1_ = _pc_ + 1;                                 // increment pc by 1

    assign _pc_select_ = select;                                // assign to pc select FOR NOW


    /*              INSTRUCTION MEMORY          */
    /*==========================================*/

    logic [31:0] _instruction_;
    
    READ_FROM_IMEM IMEM (_pc_, _instruction_);

    /*              DECODE LOGIC                */
    /*==========================================*/

    logic [4:0] _rs1_, _rs2_, _rd_;
    logic [31:0] _imm_;

    RV32I_Dec DECODE_UNIT (_instruction_, _rs1_, _rs2_, _rd_, _imm_, _op2_sel_);

    /*              Register File               */
    /*==========================================*/

    logic _rd1_en_, _rd2_en_, _wr_en_;
    logic [4:0] _rd1_idx_, _rd2_idx, _wr_idx_;
    logic [31:0] _rd1_data_, _rd2_data_, _wr_data_;

    RegFile_32 REGISTER_FILE (clk, reset, _rd1_idx_, _rd2_idx, _rd1_en_, _rd2_en_, _wr_idx_, _wr_en_, _wr_data_, _rd1_data_, _rd2_data_);


    /*              Arithmetic Logic Unit               */
    /*==================================================*/

    logic [31:0] _op1_, _op2_;
    logic _op2_sel_;

    assign _op1_ = _rd1_data_;

    Mux_2x1 OP2_MUX (_rd2_data_, _imm_, _op2_sel_, _op2_);



endmodule