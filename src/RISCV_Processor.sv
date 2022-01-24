module RISCV_Processor (input logic clk, reset, select
);

    /*                 PC LOGIC                */
    /*=========================================*/

    logic [63:0] _pc_next_, _pc_;           // pc and next pc  

    logic _pc_select_;                      // pc mux select line
    logic [63:0] _pc_in0_, _pc_in1_;        // inputs to pc mux

    logic _pc_inc_cout_, _pc_jmp_cout_;                   // carry out from pc adders
  

    D_FlipFlop PC_DFF (_pc_next_, clk, _pc_);               // pc register


    FullAdder_64 PC_INC_ADDER (_pc_ , 64'd1, 0, _pc_in0_, _pc_inc_cout_);           // change addend from 1 to 4 later when finalizing
    

    LShift LSHIFT_UNIT (_instruction_64_, _instruction_64_shl_);

    FullAdder_64 PC_JMP_ADDER (_pc_, _instruction_64_shl_, 0, _pc_in1_, _pc_jmp_cout_);  


    Mux_2x1 PC_MUX (_pc_in0_, _pc_in1_, _pc_select_, _pc_next_);     

    assign _pc_select_ = _alu_zero_ & _branch_;         // AND gate between branch and alu zero




    /*              INSTRUCTION MEMORY          */
    /*==========================================*/

    logic [31:0] _instruction_;
    
    READ_FROM_IMEM IMEM (_pc_, _instruction_);

    logic [63:0] _instruction_64_;

    ImmGen IMMGEN_UNIT (_instruction_, _instruction_64_);

    logic [63:0] _instruction_64_shl_;


    /*              Register File               */
    /*==========================================*/

    logic _wr_en_;              // CU variable

    logic [63:0] _rd1_data_, _rd2_data_;
    
    logic [63:0] _wr_data_;                 // input data from mem write back stage

    RegFile_64 REGISTER_FILE (clk, reset, _instruction_[19:15], _instruction_[24:20], _instruction_[11:7], _wr_en_, _wr_data_, _rd1_data_, _rd2_data_);


    /*              Arithmetic Logic Unit               */
    /*==================================================*/

    logic _alu_src2_sel_;              // CU Variable

    logic [63:0] _alu_src1_, _alu_src2_;

    assign _alu_src1_ = _rd1_data_;

    Mux_2x1 ALU_SRC2_MUX (_rd2_data_ ,_instruction_64_, _alu_src2_sel_, _alu_src2_);

    logic [3:0] _alu_op_sel_;
    logic [63:0] _alu_out_;
    logic _alu_zero_;

    ALU ALU (_alu_src1_, _alu_src2_, _alu_op_sel_, _alu_out_, _alu_zero_);

    // ALU CONTROL UNIT 
    // receives input from control unit and instruction [30, 14:12] 
    // outputs the _alu_op_sel_


    /*                  Control Unit                    */

    // inputs
    // _instruction_ [6:0]


    // outputs
    logic _branch_;
    logic _mem_read_, _mem_write_;
    logic _mem_to_reg_;
    logic [1:0] _alu_op_;
    // _alu_src2_sel
    // wr_en



    
endmodule