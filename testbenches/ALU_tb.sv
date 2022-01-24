module ALU_tb ();

timeunit 10ns;
timeprecision 1ns;

logic clk = 0;

logic [63:0] src1, src2;
logic [3:0] op_sel;
logic [63:0] result;
logic zero;

ALU UUT (.*);

initial begin: CLOCK_INITIALIZATION

    clk = 0;

end


always begin: CLOCK_GENERATION

    #1 clk = ~clk;

end

initial begin: TEST_VECTORS

    src1 = 64'd0;
    src2 = 64'd0;
    op_sel = 4'd0;

#5  $display ("TEST AND: 0xFFFFFFFF & 0x000000FF");
    src1 = 64'hffffffff;
    src2 = 64'h000000ff;
    op_sel = 4'd0;
#1  $display ("result: %x, zero: %d", UUT.result, UUT.zero);

#5  $display ("TEST OR: 0xFFFFFFFF | 0x000000FF");
    src1 = 64'hffffffff;
    src2 = 64'h000000ff;
    op_sel = 4'd1;
#1  $display ("result: %x, zero: %d", UUT.result, UUT.zero);

#5  $display ("TEST ADD: 64 + 100");
    src1 = 64'd64;
    src2 = 64'd100;
    op_sel = 4'd2;
#1  $display ("result: %d, zero: %d", UUT.result, UUT.zero);

#5  $display ("TEST SUB: 64 - 64");
    src1 = 64'd64;
    src2 = 64'd64;
    op_sel = 4'd6;
#1  $display ("result: %b, zero: %d", UUT.result, UUT.zero);

#5  $display ("TEST STL: 4 < 5");
    src1 = 64'd4;
    src2 = 64'd5;
    op_sel = 4'd7;
#1  $display ("result: %b, zero: %d", UUT.result, UUT.zero);

#5  $display ("TEST NOR ~(0 | 0)");
    src1 = 64'd0;
    src2 = 64'd0;
    op_sel = 4'd12;
#1  $display ("result: %b, zero: %d", UUT.result, UUT.zero);

end

endmodule