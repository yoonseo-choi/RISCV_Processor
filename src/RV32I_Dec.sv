module RV32I_Dec (input logic [31:0] instr,
                  output logic [31:0] rs1, rs2, rd, imm
);

    always_comb begin


        /*              Instruction Types               */

        logic is_R, is_I, is_S, is_B, is_U, is_J;

        is_R = (instr[6:2] == 5'b01011) || (instr[6:2] == 5'b01100) || (instr[6:2] == 5'b01110) || (instr[6:2] == 5'b10100);

        is_I = (instr[6:2 ] == 5'b0000) || (instr[6:2] == 5'b00001) || (instr[6:2] == 5'b00100) || (instr[6:2] == 5'b00110) || (instr[6:2] == 5'b11001);

        is_S = (instr[6:2] == 5'b01000) || (instr[6:2] == 5'b01001);

        is_B = (instr[6:2] == 5'b11000) ? 1'b1:1'b0;

        is_U = (instr[6:2] == 5'b00101) || (instr[6:2] == 5'b01101);

        is_J = (instr[6:2] == 5'b11011) ? 1'b1:1'b0;


        /*              Instruction Fields              */

        logic [7:0] _opcode;
        logic [4:0] _rs1,_rs2,_rd;
        logic [2:0] _funct3;
        logic [6:0] _funct7;

        _opcode = instr[6:0];            // instr[1:0] must be 2'b11

        _rs1 = instr[19:15];

        _rs2 = instr[24:20];

        _rd = instr[11:7];

        _funct3 = instr[14:12];

        _funct7 = instr[31:25];


        /*              Check for field validity                */

        logic rs1_valid, rs2_valid, rd_valid, funct3_valid, imm_valid, funct7_valid;

        rs1_valid = is_R || is_I || is_S || is_B;

        rs2_valid = is_R || is_S || is_B;

        rd_valid = is_R || is_I || is_U || is_J;

        funct3_valid = is_R || is_I || is_S || is_B;

        funct7_valid = is_R;

        imm_valid = is_I || is_S || is_B || is_B || is_J;


        /*              Immediate field              */

        logic [31:0] _imm;

        if (is_I == 1'b1) begin
            _imm = {{21{instr[31]}}, instr[30:20]};
        end

        else if (is_S == 1'b1) begin
            _imm = {{21{instr[31]}}, instr[30:25], instr[11:8], instr[7]};
        end

        else if (is_B == 1'b1) begin
            _imm = {{19{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};
        end

        else if (is_U == 1'b1) begin
            _imm = {instr[31], instr[30:20], instr[19:12], 12'b0};
        end

        else if (is_J == 1'b1) begin
            _imm = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:25], instr[24:21], 1'b0};
        end

        else begin
            _imm = 32'd0;
        end


        /*          instruction fields           */

        logic [2:0] funct3;
        logic [6:0] funct7;

        rs1 = (rs1_valid == 1'b1) ? _rs1:32'd0;

        rs2 = (rs2_valid == 1'b1) ? _rs2:32'd0;

        rd = (rd_valid == 1'b1) ? _rd:32'd0;

        imm = (imm_valid == 1'b1) ? _imm:32'd0;

        funct3 = (funct3_valid == 1'b1) ? _funct3:32'd0;

        funct7 = (funct7_valid == 1'b1) ? _funct7:32'd0;

        /*              Determine Instruction               */

        /*              Branch Instructions                 */

        logic is_BEQ, is_BNE, is_BLT, is_BGE, is_BLTU, is_BGEU;

        if (opcode == 7'b1100011 && func3_valid == 1'b1) begin

            if (opcode == 3'd0) begin               // BEQ
                is_BEQ = 1'b1;
                is_BNE = 1'b0;
                is_BLT = 1'b0;
                is_BLT = 1'b0;
                is_BGE = 1'b0;
                is_BLTU = 1'b0;
                is_BGEU = 1'b0;
            end

            else if (opcode == 3'd1) begin          // BNE
                is_BEQ = 1'b0;
                is_BNE = 1'b1;
                is_BLT = 1'b0;
                is_BLT = 1'b0;
                is_BGE = 1'b0;
                is_BLTU = 1'b0;
                is_BGEU = 1'b0;
            end

            else if (opcode == 3'd4) begin          // BLT
                is_BEQ = 1'b0;
                is_BNE = 1'b0;
                is_BLT = 1'b1;
                is_BLT = 1'b0;
                is_BGE = 1'b0;
                is_BLTU = 1'b0;
                is_BGEU = 1'b0;
            end

            else if (opcode == 3'd5) begin          // BGE
                is_BEQ = 1'b0;
                is_BNE = 1'b0;
                is_BLT = 1'b0;
                is_BLT = 1'b0;
                is_BGE = 1'b1;
                is_BLTU = 1'b0;
                is_BGEU = 1'b0;
            end

            else if (opcode == 3'd6) begin          // BLTU
                is_BEQ = 1'b0;
                is_BNE = 1'b0;
                is_BLT = 1'b0;
                is_BLT = 1'b0;
                is_BGE = 1'b0;
                is_BLTU = 1'b1;
                is_BGEU = 1'b0;
            end

            else if (opcode == 3'd7) begin          // BGEU
                is_BEQ = 1'b0;
                is_BNE = 1'b0;
                is_BLT = 1'b0;
                is_BLT = 1'b0;
                is_BGE = 1'b0;
                is_BLTU = 1'b0;
                is_BGEU = 1'b1;
            end

            else begin
                is_BEQ = 1'b0;
                is_BNE = 1'b0;
                is_BLT = 1'b0;
                is_BLT = 1'b0;
                is_BGE = 1'b0;
                is_BLTU = 1'b0;
                is_BGEU = 1'b0;
            end

        end

        else begin
            is_BEQ = 1'b0;
            is_BNE = 1'b0;
            is_BLT = 1'b0;
            is_BLT = 1'b0;
            is_BGE = 1'b0;
            is_BLTU = 1'b0;
            is_BGEU = 1'b0;
        end


        /*              Add Instructions                */

        logic is_ADDI, is_ADD;

        if (funct3_valid == 1'b1 && funct3 == 3'd0 && opcode == 7'b0010011) begin                                                   // ADDI
            is_ADDI = 1'b1;
        end
        
        else begin
            is_ADDI = 1'b0;
        end

        if (funct3_valid == 1'b1 && funct7_valid == 1'b1 && funct3 == 3'd0 && funct7[5] == 1'b0 && opcode == 7'b0110011) begin      // ADD
            is_ADD == 1'b1;
        end

        else begin
            is_ADD = 1'b0;
        end

    end



endmodule
