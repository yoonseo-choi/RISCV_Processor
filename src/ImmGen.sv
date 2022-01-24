module ImmGen (input logic [31:0] in,
               output logic [63:0] out
);


    assign out = {{32{in[31]}}, in};          // sign extend the input instruction

endmodule