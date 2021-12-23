module FullAdder_4 (input [3:0] a, b, 
                     input cin,
                     output [3:0] sum, 
                     output cout
);

    logic [2:0] temp_cout;

    FullAdder_1 fa0 (a[0], b[0], 0, sum[0], temp_cout[0]);
    FullAdder_1 fa1 (a[1], b[1], temp_cout[0], sum[1], temp_cout[1]);
    FullAdder_1 fa2 (a[2], b[2], temp_cout[1], sum[2], temp_cout[2]);
    FullAdder_1 fa3 (a[3], b[3], temp_cout[2], sum[3], cout);

endmodule