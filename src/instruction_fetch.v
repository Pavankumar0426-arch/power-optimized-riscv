module instruction_fetch (
    input clk,
    input reset,
    input enable,
    output reg [31:0] pc,
    output reg [31:0] instr,
    output reg done
);
    wire gated_clk;
    wire [31:0] mem_instr;

    // Clock gating
    clock_gating clk_gate (
        .clk(clk),
        .enable(enable),
        .gated_clk(gated_clk)
    );

    // Instruction memory
    instruction_memory imem (
        .addr(pc),
        .data(mem_instr)
    );

    always @(posedge gated_clk or posedge reset) begin
        if (reset) begin
            pc <= 0;
            instr <= 32'b0;
            done <= 0;
        end else if (!done) begin
            instr <= mem_instr;
            if (mem_instr == 32'h00000000)
                done <= 1;        // Exit condition
            else
                pc <= pc + 4;     // Next instruction
        end
    end
endmodule