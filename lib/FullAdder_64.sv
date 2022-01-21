module FullAdder_64 (input logic [63:0] a, b, 
                     input logic cin,
                     output logic [63:0] sum, 
                     output logic cout
);

    logic temp_cout;

    FullAdder_32 fa0 (a[31:0], b[31:0], cin, sum[31:0], temp_cout);
    FullAdder_32 fa1 (a[63:32], b[63:32], temp_cout, sum[63:32], cout);

endmodule





