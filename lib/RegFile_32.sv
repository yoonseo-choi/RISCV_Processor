module RegFile_32 (input logic clk,
                   input logic reset,
                   input logic [4:0] rd1_idx, rd2_idx,
                   input logic rd1_en, rd2_en,
                   input logic [4:0] wr_idx,
                   input logic wr_en,
                   input logic [31:0] wr_data,
                   output logic [31:0] rd1_data, rd2_data
);


    logic [0:31][31:0] REG_FILE = {

        32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0,
        32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0,
        32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0,
        32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0, 32'd0
    };

    always_comb begin


        if (rd1_en == 1'b1) begin

            rd1_data = REG_FILE [rd1_idx];

        end

        else begin

            rd1_data = 32'd0;

        end

        if (rd2_en == 1'b1) begin

            rd2_data = REG_FILE [rd2_idx];

        end

        else begin

            rd2_data = 32'd0;

        end

    end

    generate 

        always_ff @ (posedge clk) begin

            if (reset) begin

                int i;
                
                for (i = 0; i < 32; i++) begin: RESET_REG_FILE

                    REG_FILE [i] <= 32'd0;

                end

            end


            if (wr_en) begin

                REG_FILE [wr_idx] <= wr_data;

            end

        end

    endgenerate

endmodule