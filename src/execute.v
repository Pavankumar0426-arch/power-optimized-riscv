module execute (
    input enable,
    input [6:0] opcode,
    input [4:0] rd,
    input [2:0] funct3,
    input [4:0] rs1,
    input [4:0] rs2,
    input [6:0] funct7,
    input [31:0] rs1_data,
    input [31:0] rs2_data,
    input [31:0] imm,
    output reg [31:0] result
);
    always @(*) begin
        if (enable) begin
            case (opcode)
                7'b0110011: begin // R-Type
                    case (funct3)
                        3'b000: result = (funct7 == 7'b0000000) ? rs1_data + rs2_data :
                                         (funct7 == 7'b0100000) ? rs1_data - rs2_data : 32'b0;
                        3'b111: result = rs1_data & rs2_data;
                        3'b110: result = rs1_data | rs2_data;
                        3'b100: result = rs1_data ^ rs2_data;
                        3'b001: result = rs1_data << rs2_data;
                        3'b101: result = rs1_data >> rs2_data;
                        3'b010: result = (rs1_data < rs2_data) ? 1 : 0;
                        default: result = 32'b0;
                    endcase
                end
                7'b0010011: result = rs1_data + imm; // I-Type (ADDI)
                default:    result = 32'b0;
            endcase
        end else begin
            result = 32'b0;
        end
    end
endmodule