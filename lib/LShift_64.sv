module LShift_64 (input logic [63:0] in,
               output logic [63:0] out
);


    assign out = {in[62:0], 1'b0};

endmodule

