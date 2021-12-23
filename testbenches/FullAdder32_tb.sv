// 1 bit Full Adder test bench

module FullAdder32_tb ();

timeunit 10ns;
timeprecision 1ns;

logic clk = 0;

logic [31:0] a, b;
logic cin;
logic [31:0] sum;
logic cout;

localparam period = 20;

// unit under test
FullAdder_32 UUT (.*);

always begin: CLOCK_GENERATION  
    #1 clk = ~clk;
end

initial begin: CLOCK_INITIALIZATION

clk = 0;

end


// test vectors for unit under test
initial begin: TEST_VECTORS

a = 32;
b = 32;
cin = 0;
#period
$display ("a: %d b: %d, cin: %d", a, b, cin);
$display ("sum: %d, cout: %d", sum, cout);

#period

a = 1024;       
b = 256;
cin = 0;
#period
$display ("a: %d b: %d, cin: %d", a, b, cin);
$display ("sum: %d, cout: %d", sum, cout);

#period

a = 10000;
b = 20000;
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


