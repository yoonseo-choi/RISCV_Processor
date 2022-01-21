module D_FlipFlop (input logic [63:0] d, 
            input logic clk,
            output logic [63:0] q
);

    always_ff @ (posedge clk) begin

        q <= d;

    end

endmodule