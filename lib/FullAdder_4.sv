module FullAdder_4 (input logic [3:0] a, b, 
                     input logic cin,
                     output logic [3:0] sum, 
                     output logic cout
);

    logic temp_cout0, temp_cout1, temp_cout2;

    FullAdder_1 fa0 (a[0], b[0], cin, sum[0], temp_cout0);
    FullAdder_1 fa1 (a[1], b[1], temp_cout0, sum[1], temp_cout1);
    FullAdder_1 fa2 (a[2], b[2], temp_cout1, sum[2], temp_cout2);
    FullAdder_1 fa3 (a[3], b[3], temp_cout2, sum[3], cout);

endmodule