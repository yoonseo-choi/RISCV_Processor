module Data_Memory (input logic clk, reset,
                    input logic [63:0] addr,
                    input logic mem_wr, mem_rd,
                    input logic [63:0] wr_data,
                    output logic [63:0] rd_data
);

    logic [31:0][63:0] DMEM_CONTENTS = {

        64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0,
        64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0,
        64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0,
        64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0

    };

    generate 

        always_ff @ (posedge clk) begin

            if (reset) begin

                int i;
                
                for (i = 0; i < 32; i++) begin: RESET_DMEM

                    DMEM_CONTENTS [i] <= 64'd0;

                end

            end

            // cannot read and write at same time so mutually exclusive

            else if (mem_wr) begin

                DMEM_CONTENTS [addr] <= wr_data;

            end

            else if (mem_rd) begin          // read from data memory should take longer than register so has 1 clock ready cycle

                rd_data <= DMEM_CONTENTS [addr];

            end

            else begin

                rd_data <= 64'd0;

            end

            
        end

    endgenerate

endmodule