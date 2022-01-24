module FullAdder_1 (input logic a, b, 
                     input logic cin,
                     output logic sum, 
                     output logic cout
);

    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);

endmodule


