module FullAdder_16 (input [15:0] a, b, 
                     input cin,
                     output [15:0] sum, 
                     output cout
);

    logic temp_cout0, temp_cout1, temp_cout2;

    FullAdder_4 fa0 (a[3:0], b[3:0], cin, sum[3:0], temp_cout0);
    FullAdder_4 fa1 (a[7:4], b[7:4], temp_cout0, sum[7:4], temp_cout1);
    FullAdder_4 fa2 (a[11:8], b[11:8], temp_cout1, sum[11:8], temp_cout2);
    FullAdder_4 fa3 (a[15:12], b[15:12], temp_cout2, sum[15:12], cout);

endmodule