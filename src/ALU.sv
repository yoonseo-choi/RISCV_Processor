module ALU (input logic [63:0] src1, src2,
            input logic [3:0] op_sel,
            output logic [63:0] result,
            output logic zero
);



    /*              ALU OPERATIONS              */
    // ======================================== //
    /*          0000        AND                 */
    /*          0001        OR                  */
    /*          0010        ADD                 */
    /*          0110        SUB                 */
    /*          0111        SET LESS THAN       */
    /*          1100        NOR                 */


    always_comb begin

        case (op_sel)

            4'd0: result = src1 & src2;
            4'd1: result = src1 | src2;
            4'd2: result = src1 + src2;
            4'd6: result = src1 - src2;
            4'd7: result = src1 < src2 ? 1:0;
            4'd12: result = ~ (src1 | src2);

            default: result = 64'd0;

        endcase

    end

    assign zero = (result == 64'd0) ? 1'b1:1'b0;            // zero is set if result is 0

endmodule