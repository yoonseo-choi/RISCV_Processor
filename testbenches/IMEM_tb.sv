module IMEM_tb ();

timeunit 10ns;
timeprecision 1ns;

logic clk = 0;

localparam period = 1;
logic [31:0] addr, data;

READ_FROM_IMEM UUT (.*);

always begin: CLOCK_GENERATION
    #1 clk = ~clk;
end

initial begin: CLOCK_INITIALIZATION
    clk = 0;
end

initial begin: TEST_VECTORS

    addr = 0;
    #period;

    $display ("Address: %d, Data: %d", addr, data);
    addr = 1;
    #period;

    $display ("Address: %d, Data: %d", addr, data);    
    addr = 2;
    #period;

    $display ("Address: %d, Data: %d", addr, data);
    addr = 3;
    #period;

    $display ("Address: %d, Data: %d", addr, data);
    addr = 4;
    #period;

    $display ("Address: %d, Data: %d", addr, data);


end

endmodule
