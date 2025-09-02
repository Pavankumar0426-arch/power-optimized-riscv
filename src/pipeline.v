module riscv_pipeline (
    input clk,
    input reset,
    input enable_fetch,
    input enable_decode,
    input enable_execute,
    output [31:0] pc,
    output [31:0] result
);
    wire [31:0] instr;
    wire [6:0] opcode;
    wire [4:0] rd, rs1, rs2;
    wire [2:0] funct3;
    wire [6:0] funct7;
    wire [31:0] imm;
    reg [31:0] regfile [0:31];
    reg [31:0] rs1_data, rs2_data;

    // Instruction Fetch
    instruction_fetch IF (
        .clk(clk),
        .reset(reset),
        .enable(enable_fetch),
        .pc(pc),
        .instr(instr),
        .done()
    );

    // Instruction Decode
    instruction_decoder ID (
        .instr(instr),
        .enable(enable_decode),
        .opcode(opcode),
        .rd(rd),
        .funct3(funct3),
        .rs1(rs1),
        .rs2(rs2),
        .funct7(funct7),
        .imm(imm)
    );

    // Register File
    always @(*) begin
        rs1_data = regfile[rs1];
        rs2_data = regfile[rs2];
    end

    // Execute
    execute EX (
        .enable(enable_execute),
        .opcode(opcode),
        .rd(rd),
        .funct3(funct3),
        .rs1(rs1),
        .rs2(rs2),
        .funct7(funct7),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data),
        .imm(imm),
        .result(result)
    );

    // Write-back
    always @(posedge clk) begin
        if (rd != 0 && enable_execute)
            regfile[rd] <= result;
    end
endmodule