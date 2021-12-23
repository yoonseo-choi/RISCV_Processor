// D flip flop test bench

module DFF_tb ();

timeunit 10ns;
timeprecision 1ns;

logic clk = 0;

logic [31:0] q, d;

localparam period = 1;

// unit under test
D_FlipFlop UUT (.*);

always begin: CLOCK_GENERATION  
    #1 clk = ~clk;
end

initial begin: CLOCK_INITIALIZATION

clk = 0;

end


// test vectors for unit under test
initial begin: TEST_VECTORS

d = 0;
$display ("d: %d, q: %d", d, q);
#period;
$display ("d: %d, q: %d", d, q);

d = 1;
$display ("d: %d, q: %d", d, q);
#period;
$display ("d: %d, q: %d", d, q);

d = 2;
$display ("d: %d, q: %d", d, q);
#period;
$display ("d: %d, q: %d", d, q);

d = 3;
$display ("d: %d, q: %d", d, q);
#period;
$display ("d: %d, q: %d", d, q);

d = 4;
$display ("d: %d, q: %d", d, q);
#period;
$display ("d: %d, q: %d", d, q);

d = 5;
$display ("d: %d, q: %d", d, q);
#period;
$display ("d: %d, q: %d", d, q);

end
endmodule


