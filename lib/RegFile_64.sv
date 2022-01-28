module RegFile_64 (input logic clk,
                   input logic reset,
                   input logic [4:0] rd1_idx, rd2_idx,
                   input logic [4:0] wr_idx,
                   input logic wr_en,
                   input logic [63:0] wr_data,
                   output logic [63:0] rd1_data, rd2_data
);


    logic [0:31][63:0] REG_FILE = {

        64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0,
        64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0,
        64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0,
        64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0, 64'd0
    };

    always_comb begin

        rd1_data = REG_FILE [rd1_idx];

        rd2_data = REG_FILE [rd2_idx];

    end

    generate 

        always_ff @ (posedge clk) begin

            if (reset) begin

                int i;
                
                for (i = 0; i < 32; i++) begin: RESET_REG_FILE

                    REG_FILE [i] <= 64'd0;

                end

            end


            else if (wr_en) begin

                REG_FILE [wr_idx] <= wr_data;

            end

        end

    endgenerate

endmodule