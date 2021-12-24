module RISCV_Processor (input logic select,
                        input logic clk
);

    /*                 PC LOGIC                */
    /*=========================================*/

    logic [31:0] _pc_next_, _pc_;           // pc and next pc  
    logic _pc_select_;                      // select line for pc mux
    logic [31:0] _pc_in1_;                         // first input to pc mux


    Mux_2x1 PC_MUX (0, _pc_in1_, _pc_select_, _pc_next_);       // pc is temporary counter (change to 4x1 mux later)

    D_FlipFlop PC_DFF (_pc_next_, clk, _pc_);  

    assign _pc_in1_ = _pc_ + 1;                                 // increment pc by 1

    assign _pc_select_ = select;                                // assign to pc select FOR NOW


    /*              INSTRUCTION MEMORY          */
    /*==========================================*/

    logic [31:0] _instruction_;
    
    READ_FROM_IMEM IMEM (_pc_, _instruction_);



endmodule