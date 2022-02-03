// RISC-V Processor test bench

module RISCV_Processor_tb ();

timeunit 10ns;
timeprecision 1ns;

logic clk = 0;

logic reset, run, power;


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
run = 0;
power = 1;

$display ("==================================================================================");
$display ("clock: %d", clk);
$display ("memory contents: %d %d %d %d %d", UUT.DATAPATH.DMEM.DMEM_CONTENTS[0], UUT.DATAPATH.DMEM.DMEM_CONTENTS[1],UUT.DATAPATH.DMEM.DMEM_CONTENTS[2], UUT.DATAPATH.DMEM.DMEM_CONTENTS[3],UUT.DATAPATH.DMEM.DMEM_CONTENTS[4]);

$display ("pc: 0x%h, instruction: %b", UUT.DATAPATH._pc_, UUT.DATAPATH._instruction_);

#1 // p clk
$display ("==================================================================================");
$display ("clock: %d", clk);
$display ("state: %d", UUT.CTRL_UNIT.state);

$display ("pc: 0x%h, instruction: %b", UUT.DATAPATH._pc_, UUT.DATAPATH._instruction_);

#1 // START STATE
$display ("==================================================================================");
$display ("clock: %d", clk);
$display ("state: %d", UUT.CTRL_UNIT.state);

$display ("pc: 0x%h, instruction: %b", UUT.DATAPATH._pc_, UUT.DATAPATH._instruction_);


#1 // p clk
$display ("==================================================================================");
$display ("State: START\n");
$display ("clock: %d", clk);
$display ("state: %d", UUT.CTRL_UNIT.state);

$display ("pc: 0x%h, instruction: %b\n", UUT.DATAPATH._pc_, UUT.DATAPATH._instruction_);

$display ("startpc: %d ", UUT.CTRL_UNIT.startpc);
$display ("writepc: %d", UUT.CTRL_UNIT.writepc);

run = 1;


$display ("\n");



#1 // FETCH STATE
$display ("==================================================================================");
$display ("clock: %d", clk);
$display ("state: %d", UUT.CTRL_UNIT.state);

$display ("pc: 0x%h, instruction: %b\n", UUT.DATAPATH._pc_, UUT.DATAPATH._instruction_);

$display ("startpc: %d ", UUT.CTRL_UNIT.startpc);
$display ("writepc: %d", UUT.CTRL_UNIT.writepc);


$display ("\n");

#1 // p clk
$display ("==================================================================================");
$display ("State: FETCH\n");
$display ("clock: %d", clk);
$display ("state: %d", UUT.CTRL_UNIT.state);

$display ("pc: 0x%h, instruction: %b\n", UUT.DATAPATH._pc_, UUT.DATAPATH._instruction_);

$display ("startpc: %d ", UUT.CTRL_UNIT.startpc);
$display ("writepc: %d", UUT.CTRL_UNIT.writepc);

power = 0;

$display ("\n");


#1 // DECODE STATE
$display ("==================================================================================");
$display ("clock: %d", clk);
$display ("state: %d", UUT.CTRL_UNIT.state);

$display ("pc: 0x%h, instruction: %b\n", UUT.DATAPATH._pc_, UUT.DATAPATH._instruction_);

$display ("\n");

#1 // p clk
$display ("==================================================================================");
$display ("State: DECODE\n");
$display ("clock: %d", clk);
$display ("state: %d", UUT.CTRL_UNIT.state);

$display ("pc: 0x%h, instruction: %b\n", UUT.DATAPATH._pc_, UUT.DATAPATH._instruction_);

$display ("opcode : %b", UUT.CTRL_UNIT.opcode);
$display ("\n");


#1 // LOAD_STORE STATE
$display ("==================================================================================");
$display ("clock: %d", clk);
$display ("state: %d", UUT.CTRL_UNIT.state);

$display ("pc: 0x%h, instruction: %b\n", UUT.DATAPATH._pc_, UUT.DATAPATH._instruction_);

$display ("\n");

#1 // p clk
$display ("==================================================================================");
$display ("State: LOAD_STORE\n");
$display ("clock: %d", clk);
$display ("state: %d", UUT.CTRL_UNIT.state);

$display ("pc: 0x%h, instruction: %b\n", UUT.DATAPATH._pc_, UUT.DATAPATH._instruction_);

$display ("Register Idx: %d", UUT.DATAPATH.REGISTER_FILE.rd1_idx);
$display ("R [%d]: %d", UUT.DATAPATH.REGISTER_FILE.rd1_idx, UUT.DATAPATH.REGISTER_FILE.rd1_data);

$display ("Register Write Idx: %d", UUT.DATAPATH.REGISTER_FILE.wr_idx);
$display ("R [%d]: %d", UUT.DATAPATH.REGISTER_FILE.wr_idx, UUT.DATAPATH.REGISTER_FILE.wr_data);

$display ("Immediate Value: %d", UUT.DATAPATH._imm_64_);

$display ("ALU SRC1: %d", UUT.DATAPATH._alu_src1_);
$display ("ALU SRC2: %d", UUT.DATAPATH._alu_src2_);

$display ("ALU OP: %b", UUT.DATAPATH._alu_op_sel_);
$display ("ALU SRC: %d", UUT.DATAPATH.alusrc);



$display ("\n");

#1 // LOAD STATE
$display ("==================================================================================");
$display ("clock: %d", clk);
$display ("state: %d", UUT.CTRL_UNIT.state);

$display ("pc: 0x%h, instruction: %b\n", UUT.DATAPATH._pc_, UUT.DATAPATH._instruction_);

$display ("\n");


#1 // p clk
$display ("==================================================================================");
$display ("State: LOAD\n");
$display ("clock: %d", clk);
$display ("state: %d", UUT.CTRL_UNIT.state);

$display ("pc: 0x%h, instruction: %b\n", UUT.DATAPATH._pc_, UUT.DATAPATH._instruction_);

$display ("ALU Result: %d", UUT.DATAPATH._alu_result_);

$display ("memread: %d", UUT.CTRL_UNIT.memread);

$display ("\n");

#1 // LOAD_DONE STATE
$display ("==================================================================================");
$display ("clock: %d", clk);
$display ("state: %d", UUT.CTRL_UNIT.state);

$display ("pc: 0x%h, instruction: %b\n", UUT.DATAPATH._pc_, UUT.DATAPATH._instruction_);

$display ("\n");


#1 // p clk
$display ("==================================================================================");
$display ("State: LOAD_DONE\n");
$display ("clock: %d", clk);
$display ("state: %d", UUT.CTRL_UNIT.state);

$display ("pc: 0x%h, instruction: %b\n", UUT.DATAPATH._pc_, UUT.DATAPATH._instruction_);

$display ("data memory [%d]: %d", UUT.DATAPATH.DMEM.addr, UUT.DATAPATH._dmem_rd_data_);

$display ("regwrite: %d", UUT.CTRL_UNIT.regwrite);
$display ("mem2reg: %d", UUT.CTRL_UNIT.mem2reg);

$display ("register write back value: %d", UUT.DATAPATH._rf_wr_data_);


$display ("\n");


#1 // LOAD_IDLE STATE
$display ("==================================================================================");
$display ("clock: %d", clk);
$display ("state: %d", UUT.CTRL_UNIT.state);

$display ("pc: 0x%h, instruction: %b\n", UUT.DATAPATH._pc_, UUT.DATAPATH._instruction_);


#1 // p clk
$display ("==================================================================================");
$display ("State: LOAD_IDLE\n");
$display ("clock: %d", clk);
$display ("state: %d", UUT.CTRL_UNIT.state);

$display ("pc: 0x%h, instruction: %b\n", UUT.DATAPATH._pc_, UUT.DATAPATH._instruction_);

$display ("R [15]: %d", UUT.DATAPATH.REGISTER_FILE.REG_FILE [15]);

$display ("regwrite: %d", UUT.CTRL_UNIT.regwrite);
$display ("mem2reg: %d", UUT.CTRL_UNIT.mem2reg);


$display ("\n");

#1 // FETCH STATE
$display ("==================================================================================");
$display ("clock: %d", clk);
$display ("state: %d", UUT.CTRL_UNIT.state);

$display ("pc: 0x%h, instruction: %b\n", UUT.DATAPATH._pc_, UUT.DATAPATH._instruction_);

#1 // p clk
$display ("==================================================================================");
$display ("State: FETCH\n");
$display ("clock: %d", clk);
$display ("state: %d", UUT.CTRL_UNIT.state);

$display ("pc: 0x%h, instruction: %b\n", UUT.DATAPATH._pc_, UUT.DATAPATH._instruction_);

$display ("R [15]: %d", UUT.DATAPATH.REGISTER_FILE.REG_FILE [15]);

$display ("startpc: %d ", UUT.CTRL_UNIT.startpc);
$display ("writepc: %d", UUT.CTRL_UNIT.writepc);

$display ("\n");

#40

$display ("R[5]: %d", UUT.DATAPATH.REGISTER_FILE.REG_FILE [5]);
$display ("R [15]: %d", UUT.DATAPATH.REGISTER_FILE.REG_FILE [15]);
$display ("M [11]: %d", UUT.DATAPATH.DMEM.DMEM_CONTENTS [11]);



end
endmodule


