// RISC-V Processor test bench

module RISCV_Processor_tb ();

timeunit 10ns;
timeprecision 1ns;

logic clk = 0;

logic select;
logic [31:0] out_pc;


localparam period = 1;


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

select = 0;
$display ("out: %d", out_pc);
#10;


select = 1;
$display ("out: %d", out_pc);
#period;



$display ("out: %d", out_pc);
#period;



$display ("out: %d", out_pc);
#period;



$display ("out: %d", out_pc);
#period;



$display ("out: %d", out_pc);
#period;


end
endmodule


