// Decoder Unit test bench

module RV32IDec_tb ();

timeunit 10ns;
timeprecision 1ns;

logic clk = 0;

logic [31:0] instr, rs1, rs2, rd, imm;

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

instr = {25'd0 , 5'b01100, 2'b11};
#period;

$display ("Checking for R type");
$display ("Instruction: %b", instr);
$display ("R: %d, I: %d, S: %d, B: %d, U: %d, J: %d", UUT.is_R, UUT.is_I, UUT.is_S, UUT.is_B, UUT.is_U, UUT.is_J);


instr = {25'd0 , 5'b00110, 2'b11};
#period;

$display ("Checking for I type");
$display ("Instruction: %b", instr);
$display ("R: %d, I: %d, S: %d, B: %d, U: %d, J: %d", UUT.is_R, UUT.is_I, UUT.is_S, UUT.is_B, UUT.is_U, UUT.is_J);

instr = {25'd0 , 5'b01001, 2'b11};
#period;

$display ("Checking for S type");
$display ("Instruction: %b", instr);
$display ("R: %d, I: %d, S: %d, B: %d, U: %d, J: %d", UUT.is_R, UUT.is_I, UUT.is_S, UUT.is_B, UUT.is_U, UUT.is_J);

instr = {25'd0 , 5'b11000, 2'b11};
#period;

$display ("Checking for B type");
$display ("Instruction: %b", instr);
$display ("R: %d, I: %d, S: %d, B: %d, U: %d, J: %d", UUT.is_R, UUT.is_I, UUT.is_S, UUT.is_B, UUT.is_U, UUT.is_J);

instr = {25'd0 , 5'b01101, 2'b11};
#period;

$display ("Checking for U type");
$display ("Instruction: %b", instr);
$display ("R: %d, I: %d, S: %d, B: %d, U: %d, J: %d", UUT.is_R, UUT.is_I, UUT.is_S, UUT.is_B, UUT.is_U, UUT.is_J);

instr = {25'd0 , 5'b11011, 2'b11};
#period;

$display ("Checking for J type");
$display ("Instruction: %b", instr);
$display ("R: %d, I: %d, S: %d, B: %d, U: %d, J: %d", UUT.is_R, UUT.is_I, UUT.is_S, UUT.is_B, UUT.is_U, UUT.is_J);


end
endmodule


