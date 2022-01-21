module Mux_2x1 (input logic [63:0] in0, in1, 
                input logic sel, 
                output logic [63:0] out
);

    assign out = (sel == 0) ? in0:in1;

endmodule