// RISC-V Processor test bench

module RISCV_Processor_tb ();

timeunit 10ns;
timeprecision 1ns;

logic clk = 0;

logic reset;


localparam period = 2;


// unit under test
RISCV_Processor UUT (.*);

always begin: CLOCK_GENERATION  
    #1 clk = ~clk;
end

initial begin: CLOCK_INITIALIZATION

clk = 0;

end


// test vectors for unit under test
initial begin: TEST_VECTORS

reset = 0;
UUT._pc_next_ = 0;

$display ("clock: %d", clk);
$display ("memory contents: %d %d %d %d %d", UUT.DMEM.DMEM_CONTENTS[0], UUT.DMEM.DMEM_CONTENTS[1],UUT.DMEM.DMEM_CONTENTS[2], UUT.DMEM.DMEM_CONTENTS[3],UUT.DMEM.DMEM_CONTENTS[4]);

$display ("pc: 0x%h, instruction: %b", UUT._pc_, UUT._instruction_);

#1        // pos clk
$display ("clock: %d", clk);
$display ("alu result: %d", UUT._alu_out_);
$display ("alu op: %b", UUT._alu_op_sel_);
$display ("alu src1: %d alu src2: %d", UUT._alu_src1_, UUT._alu_src2_);
$display ("alu src2 mux select: %d", UUT._alu_src2_sel_);
$display ("register read idx1: %d, read idx2: %d", UUT.REGISTER_FILE.rd1_idx, UUT.REGISTER_FILE.rd2_idx);
$display ("register write idx: %d", UUT.REGISTER_FILE.wr_idx);
$display ("data memory out: %d", UUT._dmem_rd_data_);
$display ("register write data out: %d", UUT._rf_wr_data_);
$display ("data mem mux select: %d", UUT._mem_to_reg_);
$display ("R[15] = %d", UUT.REGISTER_FILE.REG_FILE[15]);

$display ("pc: 0x%h, instruction: %b", UUT._pc_, UUT._instruction_);

#1        // neg clk
$display ("clock: %d", clk);
$display ("pc: 0x%h, instruction: %b", UUT._pc_, UUT._instruction_);

$display ("R[15] = %d", UUT.REGISTER_FILE.REG_FILE[15]);

$display ("alu result: %d", UUT._alu_out_);
$display ("data memory out: %d", UUT._dmem_rd_data_);
$display ("register write data out: %d", UUT._rf_wr_data_);
$display ("data mem mux select: %d", UUT._mem_to_reg_);

$display ("register read idx1: %d, read idx2: %d", UUT.REGISTER_FILE.rd1_idx, UUT.REGISTER_FILE.rd2_idx);
$display ("register write idx: %d", UUT.REGISTER_FILE.wr_idx);
$display ("alu src2 mux select: %d", UUT._alu_src2_sel_);
$display ("alu src1: %d alu src2: %d", UUT._alu_src1_, UUT._alu_src2_);

#1 

$display ("clock: %d", clk);        // pos clk




end
endmodule


