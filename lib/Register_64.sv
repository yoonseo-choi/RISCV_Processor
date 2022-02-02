module Register_64 (input logic clk, reset, wr_en,
                    input logic [63:0] in , out
);

    always_ff @ (posedge clk) begin
    
        if (reset) begin

            out <= 64'd0;

        end

        else if (wr_en) begin

            out <= in;
            
        end

        // else retains its own value


    end

endmodule


                    