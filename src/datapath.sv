module datapath (input logic clk, reset,
                 input logic alusrc, mem2reg, regwrite, memread, memwrite, branch, writepc, startpc,
                 input logic [1:0] aluop,
                 output logic [6:0] opcode
);

    /*                  Variable Declarations           */

    // PC

    logic [63:0] _pc_next_, _pc_;           // pc and next pc  
    logic [63:0] _pc_start0_, _pc_start1_;
    logic _pc_select_;                      // pc mux select line
    logic [63:0] _pc_in0_, _pc_in1_;        // inputs to pc mux
    logic _pc_inc_cout_, _pc_jmp_cout_;                   // carry out from pc adders
    logic _alu_zero_;

    // Instruction

    logic [63:0] _imm_64_;
    logic [31:0] _instruction_;
    logic [63:0] _imm_64_shl_;

    // Register File

    logic [63:0] _rf_rd1_data_, _rf_rd2_data_;
    logic [63:0] _rf_wr_data_;                 // input data from mem write back stage

    // ALU

    logic [63:0] _alu_src1_, _alu_src2_;
    logic [63:0] _alu_out_;
    logic [3:0] _alu_op_sel_;
    logic [63:0] _alu_result_;

    // Data Memory

    logic [63:0] _dmem_rd_data_;

    /*                 PC LOGIC                */
    /*=========================================*/

    Register_64 PC_REG (clk, reset, writepc, _pc_next_, _pc_);               // pc register

    FullAdder_64 PC_INC_ADDER (_pc_ , 64'd1, 1'b0, _pc_in0_, _pc_inc_cout_);           // change addend from 1 to 4 later when finalizing
    
    LShift_64 LSHIFT_UNIT (_imm_64_, _imm_64_shl_);

    FullAdder_64 PC_JMP_ADDER (_pc_, _imm_64_shl_, 1'b0, _pc_in1_, _pc_jmp_cout_);  


    Mux_2x1 PC_MUX (_pc_in0_, _pc_in1_, _pc_select_, _pc_start0_);  

    assign _pc_start1_ = 64'd0;  

    Mux_2x1 PC_START_MUX (_pc_start0_, _pc_start1_, startpc, _pc_next_);

    assign _pc_select_ = _alu_zero_ & branch;         // AND gate between branch and alu zero


    /*              INSTRUCTION MEMORY          */
    /*==========================================*/
    
    READ_FROM_IMEM IMEM (_pc_, _instruction_);

    assign opcode = _instruction_ [6:0];

    ImmGen IMMGEN_UNIT (_instruction_, _imm_64_);


    /*              Register File               */
    /*==========================================*/
    
    RegFile_64 REGISTER_FILE (clk, reset, _instruction_[19:15], _instruction_[24:20], _instruction_[11:7], regwrite, _rf_wr_data_, _rf_rd1_data_, _rf_rd2_data_);


    /*              Arithmetic Logic Unit               */
    /*==================================================*/

    assign _alu_src1_ = _rf_rd1_data_;

    Mux_2x1 ALU_SRC2_MUX (_rf_rd2_data_ ,_imm_64_, alusrc, _alu_src2_);

    ALU ALU (_alu_src1_, _alu_src2_, _alu_op_sel_, _alu_out_, _alu_zero_);

    Register_64 ALU_OUT_REG (clk, reset, 1'b1, _alu_out_, _alu_result_);

    /*                  ALU Control Unit                */
    /*==================================================*/

    // receives input from control unit and instruction [30, 14:12] 
    // outputs the _alu_op_sel_

    ALU_Control ALU_CTRL (aluop, {_instruction_[30], _instruction_[14:12]}, _alu_op_sel_);

    /*                  Data Memory                 */
    /*==============================================*/

    Data_Memory DMEM (clk, reset, _alu_result_, memwrite, memread, _rf_rd2_data_, _dmem_rd_data_);

    Mux_2x1 DMEM_MUX (_alu_result_, _dmem_rd_data_, mem2reg, _rf_wr_data_);



    
endmodule