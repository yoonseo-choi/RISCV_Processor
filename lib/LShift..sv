module LShift (input logic [63:0] in,
               output logic [63:0] out
);


    assign out = {in[62:0], 0};

endmodule

