module instruction_memory (
    input [31:0] addr,
    output reg [31:0] data
);
    reg [31:0] memory [0:255]; // 256 words of memory

    initial begin
        // Hardcoded RISC-V Instructions (ADDI and ADD)
        memory[0] = 32'h00000093; // ADDI x1, x0, 0
        memory[1] = 32'h00100113; // ADDI x2, x0, 1
        memory[2] = 32'h00208193; // ADDI x3, x1, 2
        memory[3] = 32'h00310213; // ADDI x4, x2, 3
        memory[4] = 32'h00312133; // ADD x4, x2, x3 (R-type ADD)
        memory[5] = 32'h00418293; // ADDI x5, x3, 4
        memory[6] = 32'h00000000; // Exit condition
    end  

    always @(*) begin
        data = memory[addr >> 2]; // Word-aligned memory access
    end
endmodule