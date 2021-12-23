// 1 bit Full Adder test bench

module FullAdder1_tb ();

timeunit 10ns;
timeprecision 1ns;

logic clk = 0;

logic a, b, cin, sum, cout;

localparam period = 20;

// unit under test
FullAdder_1 UUT (.*);

always begin: CLOCK_GENERATION  
    #1 clk = ~clk;
end

initial begin: CLOCK_INITIALIZATION

clk = 0;

end


// test vectors for unit under test
initial begin: TEST_VECTORS

a = 0;
b = 0;
cin = 0;
#period
$display ("a: %d b: %d, cin: %d", a, b, cin);
$display ("sum: %d, cout: %d", sum, cout);

#period

a = 0;
b = 1;
cin = 0;
#period
$display ("a: %d b: %d, cin: %d", a, b, cin);
$display ("sum: %d, cout: %d", sum, cout);

#period

a = 1;
b = 1;
cin = 0;
#period
$display ("a: %d b: %d, cin: %d", a, b, cin);
$display ("sum: %d, cout: %d", sum, cout);

#period

a = 1;
b = 1;
cin = 1;
#period
$display ("a: %d b: %d, cin: %d", a, b, cin);
$display ("sum: %d, cout: %d", sum, cout);

end
endmodule


