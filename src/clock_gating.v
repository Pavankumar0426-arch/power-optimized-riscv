`timescale 1ns / 1ps  

module clock_gating (
    input clk,         // Main clock
    input enable,      // Enable signal for clock gating
    output reg gated_clk // Gated clock output
);  
    always @(*) begin
        if (enable)
            gated_clk = clk;   // Allow clock signal
        else
            gated_clk = 0;     // Disable clock when idle
    end
endmodule