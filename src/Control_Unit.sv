module Control_Unit (input logic clk, reset, run, power,
                     input logic [6:0] opcode,
                     output logic alusrc, mem2reg, regwrite, memread, memwrite, branch, writepc, startpc,
                     output logic [1:0] aluop
);


    enum logic [3:0] {Start, Fetch, Decode, R_Type, R_Type_Done, R_Type_Idle, Load_Store, Load, Load_Done, Load_Idle, Store, Store_Idle} state, next_state;

    always_ff @ (posedge clk) begin

        if (reset) begin
            
            state <= Start;

        end

        else if (power & ~run) begin

            state <= Start;

        end

        else begin

            state <= next_state;

        end

    end

    always_comb begin

        // default values
        next_state = state;

        alusrc = 0;
        mem2reg = 0;
        regwrite = 0;
        memread = 0;
        memwrite = 0;
        branch = 0;
        aluop = 2'b00;
        writepc = 0;
        startpc = 0;

        // state sequencing

        case (state)

            Start: 
                next_state = Fetch;

            Fetch: 

                if (run) begin
                    next_state = Decode;
                end

            Decode:

                case (opcode)

                    7'b0110011:
                        next_state = R_Type;

                    7'b0000011: 
                        next_state = Load_Store;

                    7'b0100011:
                        next_state = Load_Store;

                    default:
                        next_state = Start;

                endcase

            R_Type:
                next_state = R_Type_Done;

            R_Type_Done:
                next_state = R_Type_Idle;

            R_Type_Idle:
                next_state = Fetch;

            Load_Store: begin

                case (opcode)

                    7'b0000011:
                        next_state = Load;
                    
                    7'b0100011:
                        next_state = Store;

                    default:    
                        next_state = Start;

                endcase

            end

            Load: 
                next_state = Load_Done;

            Load_Done:
                next_state = Load_Idle;
            
            Load_Idle:
                next_state = Fetch;

            Store:
                next_state = Store_Idle;

            Store_Idle:
                next_state = Fetch;

            default:
                next_state = Start;

        endcase

        // state signaling
        case (state)

            Start: 
                startpc = power;

            Fetch: begin
                writepc = 1;
                startpc = power;
            end

            Decode: ;

            R_Type:
                aluop = 2'b10;

            R_Type_Done:
                regwrite = 1;

            R_Type_Idle: ;

            Load_Store: begin
                aluop = 2'b00;
                alusrc = 1;
            end

            Load:
                memread = 1;

            Load_Done: begin
                regwrite = 1;
                mem2reg = 1;
            end

            Load_Idle: ;

            Store:
                memwrite = 1;

            Store_Idle: ;

            default: ;

        endcase

    end
            

    // always_comb begin
        
    //     alusrc = 0;
    //     mem2reg = 0;
    //     regwrite = 0;
    //     memread = 0;
    //     memwrite = 0;
    //     branch = 0;
    //     aluop = 2'b00;
    //     writepc = 0;

    //     // R Format
    //     if (instruction == 7'b0110011) begin

    //         alusrc = 0;
    //         mem2reg = 0;
    //         regwrite = 1;
    //         memread = 0;
    //         memwrite = 0;
    //         branch = 0;
    //         aluop = 2'b10;

    //     end
        
    //     // Load Operation
    //     else if (instruction == 7'b0000011) begin

    //         alusrc = 1;
    //         mem2reg = 1;
    //         regwrite = 1;
    //         memread = 1;
    //         memwrite = 0;
    //         branch = 0;
    //         aluop = 2'b00;

    //     end

    //     // Store Operation
    //     else if (instruction == 7'b0100011) begin

    //         alusrc = 1;
    //         mem2reg = 0;
    //         regwrite = 0;
    //         memread = 0;
    //         memwrite = 1;
    //         branch = 0;
    //         aluop = 2'b00;

    //     end

    //     // Branch If Equal Operation
    //     else if (instruction == 7'b1100011) begin

    //         alusrc = 0;
    //         mem2reg = 0;
    //         regwrite = 0;
    //         memread = 0;
    //         memwrite = 0;
    //         branch = 1;
    //         aluop = 2'b01;

    //     end

    //     else begin

    //         alusrc = 0;
    //         mem2reg = 0;
    //         regwrite = 0;
    //         memread = 0;
    //         memwrite = 0;
    //         branch = 0;
    //         aluop = 2'b00;
    //         writepc = 0;

    //     end

    // end

endmodule