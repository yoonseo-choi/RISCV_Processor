// Decoder Unit test bench

module RV32IDec_tb ();

timeunit 10ns;
timeprecision 1ns;

logic clk = 0;

logic [31:0] instr, rs1, rs2, rd, imm, op2_sel;

localparam period = 5;

// unit under test
RV32I_Dec UUT (.*);

always begin: CLOCK_GENERATION  
    #1 clk = ~clk;
end

initial begin: CLOCK_INITIALIZATION

clk = 0;

end


// test vectors for unit under test
initial begin: TEST_VECTORS

instr = {17'd0, 3'd0, 5'd0, 7'b1100011};
#period;

$display ("Checking for BEQ:");
$display ("Instruction: %b", instr);
$display ("R: %d, I: %d, S: %d, B: %d, U: %d, J: %d", UUT.is_R, UUT.is_I, UUT.is_S, UUT.is_B, UUT.is_U, UUT.is_J);
$display ("FLAG: %d", UUT.is_BEQ);


instr = {17'd0, 3'd1, 5'd0, 7'b1100011};
#period;

$display ("Checking for BNE:");
$display ("Instruction: %b", instr);
$display ("R: %d, I: %d, S: %d, B: %d, U: %d, J: %d", UUT.is_R, UUT.is_I, UUT.is_S, UUT.is_B, UUT.is_U, UUT.is_J);
$display ("FLAG: %d", UUT.is_BNE);

instr = {17'd0, 3'd4, 5'd0, 7'b1100011};
#period;

$display ("Checking for BLT");
$display ("Instruction: %b", instr);
$display ("R: %d, I: %d, S: %d, B: %d, U: %d, J: %d", UUT.is_R, UUT.is_I, UUT.is_S, UUT.is_B, UUT.is_U, UUT.is_J);
$display ("FLAG: %d", UUT.is_BLT);

instr = {17'd0, 3'd5, 5'd0, 7'b1100011};
#period;

$display ("Checking for BGE");
$display ("Instruction: %b", instr);
$display ("R: %d, I: %d, S: %d, B: %d, U: %d, J: %d", UUT.is_R, UUT.is_I, UUT.is_S, UUT.is_B, UUT.is_U, UUT.is_J);
$display ("FLAG: %d", UUT.is_BGE);

instr = {17'd0, 3'd6, 5'd0, 7'b1100011};
#period;

$display ("Checking for BLTU");
$display ("Instruction: %b", instr);
$display ("R: %d, I: %d, S: %d, B: %d, U: %d, J: %d", UUT.is_R, UUT.is_I, UUT.is_S, UUT.is_B, UUT.is_U, UUT.is_J);
$display ("FLAG: %d", UUT.is_BLTU);

instr = {17'd0, 3'd7, 5'd0, 7'b1100011};
#period;

$display ("Checking for BGEU");
$display ("Instruction: %b", instr);
$display ("R: %d, I: %d, S: %d, B: %d, U: %d, J: %d", UUT.is_R, UUT.is_I, UUT.is_S, UUT.is_B, UUT.is_U, UUT.is_J);
$display ("FLAG: %d", UUT.is_BGEU);


instr = {17'd0, 3'd0, 5'd0, 7'b0010011};
#period;

$display ("Checking for ADDI");
$display ("Instruction: %b", instr);
$display ("R: %d, I: %d, S: %d, B: %d, U: %d, J: %d", UUT.is_R, UUT.is_I, UUT.is_S, UUT.is_B, UUT.is_U, UUT.is_J);
$display ("FLAG: %d", UUT.is_ADDI);

instr = {17'd0, 3'd0, 5'd0, 7'b0110011};
#period;

$display ("Checking for ADD");
$display ("Instruction: %b", instr);
$display ("R: %d, I: %d, S: %d, B: %d, U: %d, J: %d", UUT.is_R, UUT.is_I, UUT.is_S, UUT.is_B, UUT.is_U, UUT.is_J);
$display ("FLAG: %d", UUT.is_ADD);

end
endmodule


