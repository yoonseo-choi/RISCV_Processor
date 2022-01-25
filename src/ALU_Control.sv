module ALU_Control (input logic [1:0] ALU_Op,
                    input logic [3:0] funct_field,
                    output logic [3:0] ALU_Ctrl
);


    always_comb begin

        // ADD OP
        if (ALU_Op == 2'b00) begin
            ALU_Ctrl = 4'b0010;
        end

        // SUB OP
        else if (ALU_Op == 2'b01 || ALU_Op == 2'b11) begin
            ALU_Ctrl = 4'b0110;
        end

        // ADD OP
        else if ((ALU_Op == 2'b10 || ALU_Op == 2'b11) && (funct_field == 4'd0)) begin
            ALU_Ctrl = 4'b0010;
        end
        
        // SUB OP
        else if ((ALU_Op == 2'b10 || ALU_Op == 2'b11) && (funct_field == 4'b1000)) begin
            ALU_Ctrl = 4'b0110;
        end

        // AND OP
        else if ((ALU_Op == 2'b10 || ALU_Op == 2'b11) && (funct_field == 4'b0111)) begin
            ALU_Ctrl = 4'd0;
        end
        
        // OR OP
        else if ((ALU_Op == 2'b10 || ALU_Op == 2'b11) && (funct_field == 4'b0110)) begin
            ALU_Ctrl = 4'b0001;
        end
        
        // STL OP
        else if ((ALU_Op == 2'b10 || ALU_Op == 2'b11) && (funct_field == 4'b1010)) begin
            ALU_Ctrl = 4'b0111;
        end

        else begin
            ALU_Ctrl = 4'b1111;
        end

    end

endmodule

