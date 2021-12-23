// 4 bit Full Adder test bench

module FullAdder4_tb ();

timeunit 10ns;
timeprecision 1ns;

logic clk = 0;

logic [3:0] a, b;
logic cin;
logic [3:0] sum;
logic cout;

localparam period = 20;

// unit under test
FullAdder_4 UUT (.*);

always begin: CLOCK_GENERATION  
    #1 clk = ~clk;
end

initial begin: CLOCK_INITIALIZATION

clk = 0;

end


// test vectors for unit under test
initial begin: TEST_VECTORS

a = 4'b0011;        // 3
b = 4'b0101;        // 5
cin = 0;
#period
$display ("a: %d b: %d, cin: %d", a, b, cin);
$display ("sum: %d, cout: %d", sum, cout);

#period

a = 4'b0111;        // 7         
b = 4'b1000;        // 8
cin = 0;
#period
$display ("a: %d b: %d, cin: %d", a, b, cin);
$display ("sum: %d, cout: %d", sum, cout);

#period

a = 4'b1000;            // 8
b = 4'b1000;            // 8
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


