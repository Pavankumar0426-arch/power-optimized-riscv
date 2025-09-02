`timescale 1ns / 1ps

module testbench;
    reg clk;
    reg reset;
    reg enable_fetch, enable_decode, enable_execute;

    wire [31:0] pc;
    wire [31:0] result;

    // Instantiate the pipeline processor
    riscv_pipeline uut (
        .clk(clk),
        .reset(reset),
        .enable_fetch(enable_fetch),
        .enable_decode(enable_decode),
        .enable_execute(enable_execute),
        .pc(pc),
        .result(result)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        // Monitor signals
        $monitor("Time=%0t | PC=%h | Result=%d", $time, pc, result);

        // Reset
        reset = 1;
        enable_fetch = 0;
        enable_decode = 0;
        enable_execute = 0;
        #10;

        reset = 0;

        // Enable fetch, then decode, then execute (like in report timing diagrams)
        #10 enable_fetch = 1;
        #10 enable_decode = 1;
        #10 enable_execute = 1;

        // Let the program run for some time
        #200;

        // Stop simulation
        $finish;
    end
endmodule