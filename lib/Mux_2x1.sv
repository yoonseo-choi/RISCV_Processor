module Mux_2x1 (input logic [31:0] in0, in1, 
                input logic sel, 
                output logic [31:0] out
);

    assign out = (sel == 0) ? in0:in1;

endmodule