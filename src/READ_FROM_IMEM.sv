module READ_FROM_IMEM (input logic [63:0] addr,
                       output logic [31:0] data);


    /* Instruction Memory with storage of 32 instructions with length of 32 bits each */

    logic [0:31][31:0] IMEM_CONTENT = {

        // instructions 0-7
        32'b00000000001000010010011110000011, 
        32'b00000000011101111000001010110011,
        32'd0, 
        32'd0, 
        32'd0, 
        32'd0, 
        32'd0, 
        32'd0,

        // instructions 8-15
        32'd0, 
        32'd0, 
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


    logic [4:0] mem_addr;
    
    always_comb begin
        
        if (addr > 64'd31) begin
            mem_addr = 4'd0;
            data = 32'hFFFFFFFF;
        end
            
        else begin
            mem_addr = addr [4:0];
            data = IMEM_CONTENT [mem_addr];
        end

    end


endmodule

