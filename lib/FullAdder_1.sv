module FullAdder_1 (input a, b, 
                     input cin,
                     output sum, 
                     output cout
);

    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);

endmodule


