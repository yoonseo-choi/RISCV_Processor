module Control_Unit (input logic [6:0] instruction,
                     output logic branch, memread, mem2reg, memwrite, alusrc, regwrite,
                     output logic [1:0] aluop
);



    always_comb begin
        
        // R Format
        if (instruction == 7'b0110011) begin

            alusrc = 0;
            mem2reg = 0;
            regwrite = 1;
            memread = 0;
            memwrite = 0;
            branch = 0;
            aluop = 2'b10;

        end
        
        // Load Operation
        else if (instruction == 7'b0000011) begin

            alusrc = 1;
            mem2reg = 1;
            regwrite = 1;
            memread = 1;
            memwrite = 0;
            branch = 0;
            aluop = 2'b00;

        end

        // Store Operation
        else if (instruction == 7'b0100011) begin

            alusrc = 1;
            mem2reg = 0;
            regwrite = 0;
            memread = 0;
            memwrite = 1;
            branch = 0;
            aluop = 2'b00;

        end

        // Branch If Equal Operation
        else if (instruction == 7'b1100011) begin

            alusrc = 0;
            mem2reg = 0;
            regwrite = 0;
            memread = 0;
            memwrite = 0;
            branch = 1;
            aluop = 2'b01;

        end

        else begin

            alusrc = 0;
            mem2reg = 0;
            regwrite = 0;
            memread = 0;
            memwrite = 0;
            branch = 0;
            aluop = 2'b00;

        end

    end

endmodule