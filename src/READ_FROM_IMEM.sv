module READ_FROM_IMEM (input logic [63:0] addr,
                       output logic [31:0] data);

parameter IMEM_LEN = 32;
parameter IMEM_SIZE = 10;              // 10 instructions max for now

parameter [0:IMEM_SIZE - 1][IMEM_LEN-1:0] IMEM_CONTENT = {
    32'd15,
    32'd64, 
    32'd89,
    32'd1,
    32'd73,
    32'd5,
    32'd6,
    32'd7,
    32'd8,
    32'd9
};

assign data = IMEM_CONTENT[addr];

endmodule

