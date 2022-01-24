module RegFile_tb ();

timeunit 10ns;
timeprecision 1ns;

logic clk = 0;

logic reset;

logic wr_en;

logic [4:0] wr_idx, rd1_idx, rd2_idx;

logic [63:0] wr_data, rd1_data, rd2_data;


RegFile_64 UUT (.*);

always begin: CLOCK_INITIALIZATION

    #1 clk = ~clk;

end

initial begin: CLOCK_GENERATION

    clk = 0;

end


initial begin: TEST_VECTORS

    reset = 1;

    wr_data = 32'd0;
    wr_idx = 5'd0; rd1_idx = 5'd0; rd2_idx = 5'd0;


    #5      // neg clock

    reset = 0;
    wr_en = 1; wr_idx = 5'd1; wr_data = 32'd5;

    #10     // neg clock

    wr_idx = 5'd2; wr_data = 32'd10;

    rd1_idx = 5'd1;
    rd2_idx = 5'd2;

    #1

    $display ("REG_FILE[%d]: %b", rd1_idx, rd1_data);
    $display ("REG_FILE[%d]: %b", rd2_idx, rd2_data);

end

endmodule
