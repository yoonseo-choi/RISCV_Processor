module Control_Unit (input logic clk, reset,
                     input logic [6:0] instruction,
                     output logic alusrc, mem2reg, regwrite, memread, memwrite, branch, writepc
                     output logic [1:0] aluop
);



    always_comb begin
        
        alusrc = 0;
        mem2reg = 0;
        regwrite = 0;
        memread = 0;
        memwrite = 0;
        branch = 0;
        aluop = 2'b00;
        writepc = 0;
        
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
            writepc = 0;

        end

    end

endmodule