module IMEM_tb ();

timeunit 10ns;
timeprecision 1ns;

logic clk = 0;

localparam period = 1;
logic [31:0] data;
logic [63:0] addr;

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
    addr = 64'd1;
    #period;

    $display ("Address: %d, Data: %d", addr, data);    
    addr = 64'd2;
    #period;

    $display ("Address: %d, Data: %d", addr, data);
    addr = 64'd3;
    #period;

    $display ("Address: %d, Data: %d", addr, data);
    addr = 64'd4;
    #period;

    $display ("Address: %d, Data: %d", addr, data);


end

endmodule
