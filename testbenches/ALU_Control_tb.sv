module ALU_Control_tb ();

timeunit 10ns;
timeprecision 1ns;

logic clk = 0;

logic [1:0] ALU_Op;
logic [3:0] funct_field;
logic [3:0] ALU_Ctrl;

ALU_Control UUT (.*);

initial begin: CLOCK_INIT

    clk = 0;

end

always begin: CLOCK_GEN

    #1 clk = ~clk;

end

initial begin: TEST_VECTORS

    ALU_Op = 2'b00;
    funct_field = 4'b0000;

#5  $display ("ALU_Op: %b, funct_field: %b", ALU_Op, funct_field);
    ALU_Op = 2'b00;
    funct_field = 4'b000;
#1  $display ("ALU Control: %b", ALU_Ctrl);

#5  $display ("ALU_Op: %b, funct_field: %b", ALU_Op, funct_field);
    ALU_Op = 2'b01;
    funct_field = 4'b1111;
#1  $display ("ALU Control: %b", ALU_Ctrl);

#5  $display ("ALU_Op: %b, funct_field: %b", ALU_Op, funct_field);
    ALU_Op = 2'b10;
    funct_field = 4'b0000;
#1  $display ("ALU Control: %b", ALU_Ctrl);

#5  $display ("ALU_Op: %b, funct_field: %b", ALU_Op, funct_field);
    ALU_Op = 2'b11;
    funct_field = 4'b1000;
#1  $display ("ALU Control: %b", ALU_Ctrl);

#5  $display ("ALU_Op: %b, funct_field: %b", ALU_Op, funct_field);
    ALU_Op = 2'b10;
    funct_field = 4'b0111;
#1  $display ("ALU Control: %b", ALU_Ctrl);

#5  $display ("ALU_Op: %b, funct_field: %b", ALU_Op, funct_field);
    ALU_Op = 2'b11;
    funct_field = 4'b0110;
#1  $display ("ALU Control: %b", ALU_Ctrl);

end
endmodule