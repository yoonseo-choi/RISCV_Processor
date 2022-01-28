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

reset = 1;

#2

reset = 0;

select = 0;
#10;
$display ("pc: 0x%h, instruction: %b", UUT._pc_, UUT._instruction_);


select = 1;
#period;


$display ("pc: 0x%h, instruction: %b", UUT._pc_, UUT._instruction_);
#period;

$display ("pc: 0x%h, instruction: %b", UUT._pc_, UUT._instruction_);
#period;

$display ("pc: 0x%h, instruction: %b", UUT._pc_, UUT._instruction_);
#period;

$display ("pc: 0x%h, instruction: %b", UUT._pc_, UUT._instruction_);
#period;

$display ("pc: 0x%h, instruction: %b", UUT._pc_, UUT._instruction_);
#period;


end
endmodule


