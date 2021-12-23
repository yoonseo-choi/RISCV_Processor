module Mux_2x1 (input [31:0] in0, in1, 
                input sel, 
                output [31:0] out
);

    always_comb begin

        case (sel)

            1'b0:  out = in0;
            1'b1:  out = in1;
            default;
            
        endcase

    end

endmodule