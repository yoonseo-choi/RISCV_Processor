module ImmGen (input logic [31:0] in,
               output logic [63:0] out
);

    always_comb begin

        if (in [6:0] == 7'b0000011) begin
            out = {{52{in[31]}}, in[31:20]};          // Load immediate
        end

        else if (in [6:0] == 7'b0100011) begin          // Store immediate
            out = {{52{in[31]}}, in[31:25], in[11:7]};
        end

        else begin
            out = {64{in[31]}};
        end

    end


endmodule