module RV32I_Dec (input logic [31:0] instr,
                  output logic [31:0] rs1, rs2, rd, imm
);

    /*              Instruction Types               */

    logic is_R, is_I, is_S, is_B, is_U, is_J;

    assign is_R = (instr[6:2] == 5'b01011) || (instr[6:2] == 5'b01100) || (instr[6:2] == 5'b01110) || (instr[6:2] == 5'b10100);

    assign is_I = (instr[6:2 ] == 5'b0000) || (instr[6:2] == 5'b00001) || (instr[6:2] == 5'b00100) || (instr[6:2] == 5'b00110) || (instr[6:2] == 5'b11001);

    assign is_S = (instr[6:2] == 5'b01000) || (instr[6:2] == 5'b01001);

    assign is_B = (instr[6:2] == 5'b11000) ? 1'b1:1'b0;

    assign is_U = (instr[6:2] == 5'b00101) || (instr[6:2] == 5'b01101);

    assign is_J = (instr[6:2] == 5'b11011) ? 1'b1:1'b0;


    /*              Instruction Fields              */

    logic [7:0] _opcode;
    logic [4:0] _rs1,_rs2,_rd;
    logic [2:0] _funct3;

    assign _opcode = instr[6:0];            // instr[1:0] must be 2'b11

    assign _rs1 = instr[19:15];

    assign _rs2 = instr[24:20];

    assign _rd = instr[11:7];

    assign _funct3 = instr[14:12];


    /*              Check for field validity                */

    logic rs1_valid, rs2_valid, rd_valid, funct3_valid, imm_valid;

    assign rs1_valid = is_R || is_I || is_S || is_B;

    assign rs2_valid = is_R || is_S || is_B;

    assign rd_valid = is_R || is_I || is_U || is_J;

    assign funct3_valid = is_R || is_I || is_S || is_B;

    assign imm_valid = is_I || is_S || is_B || is_B || is_J;


    /*              Assign Immediate field              */

    logic [31:0] _imm;

    always_comb begin

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

    end

    /*          Assign instruction fields           */

    assign rs1 = (rs1_valid == 1'b1) ? _rs1:32'd0;

    assign rs2 = (rs2_valid == 1'b1) ? _rs2:32'd0;

    assign rd = (rd_valid == 1'b1) ? _rd:32'd0;

    assign imm = (imm_valid == 1'b1) ? _imm:32'd0;

endmodule
