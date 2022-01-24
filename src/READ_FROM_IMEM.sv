module READ_FROM_IMEM (input logic [63:0] addr,
                       output logic [31:0] data);


    /* Instruction Memory with storage of 32 instructions with length of 32 bits each */

    logic [31:0][31:0] IMEM_CONTENT = {

        // instructions 0-7
        32'd15, 
        32'd64, 
        32'd89, 
        32'd1, 
        32'd73, 
        32'd5, 
        32'd6, 
        32'd7,

        // instructions 8-15
        32'd8, 
        32'd9, 
        32'd0, 
        32'd0, 
        32'd0, 
        32'd0, 
        32'd0, 
        32'd0,

        // instructions 16-23
        32'd0, 
        32'd0, 
        32'd0, 
        32'd0, 
        32'd0, 
        32'd0, 
        32'd0, 
        32'd0,

        // instructions 24-31
        32'd0,
        32'd0, 
        32'd0, 
        32'd0, 
        32'd0, 
        32'd0, 
        32'd0, 
        32'd0

    };


    logic [4:0] mem_addr = addr [4:0];

    assign data = IMEM_CONTENT [mem_addr];


endmodule

