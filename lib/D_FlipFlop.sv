module D_FlipFlop (input [31:0] d, 
            input clk,
            output [31:0] q
);

    always_ff @ (posedge clk) begin

        q <= d;

    end

endmodule