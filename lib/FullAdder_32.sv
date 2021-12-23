module FullAdder_32 (input [31:0] a, b, 
                     input cin,
                     output [31:0] sum, 
                     output cout
);

    logic temp_cout;

    FullAdder_16 fa0 (a[15:0], b[15:0], cin, sum[15:0], temp_cout);
    FullAdder_16 fa1 (a[31:16], b[31:16], temp_cout, sum[31:16], cout);

endmodule





