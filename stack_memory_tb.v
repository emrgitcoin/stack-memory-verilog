`timescale 1ns/1ps

module stack_memory_tb;

    reg clk;
    reg reset;
    reg push;
    reg pop;
    reg [7:0] data_in;

    wire [7:0] data_out;
    wire full;
    wire empty;
    wire [7:0] top;   // PEEK

    
    stack_memory emir_stack (
        .clk(clk),
        .reset(reset),
        .push(push),
        .pop(pop),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty),
        .top(top)
    );

    
    always #5 clk = ~clk;

    initial begin
        $dumpfile("stack_memory.vcd");
        $dumpvars(0, stack_memory_tb);

        clk = 0;
        reset = 1;
        push = 0;
        pop = 0;
        data_in = 0;

        #10 reset = 0;

        // PUSH 10
        #10 data_in = 8'd10; push = 1;
        #10 push = 0;

        // PUSH 20
        #10 data_in = 8'd20; push = 1;
        #10 push = 0;

        // PUSH 30
        #10 data_in = 8'd30; push = 1;
        #10 push = 0;

        // POP → 30
        #10 pop = 1;
        #10 pop = 0;

        // POP → 20
        #10 pop = 1;
        #10 pop = 0;

        // PUSH 40
        #10 data_in = 8'd40; push = 1;
        #10 push = 0;

        // POP → 40
        #10 pop = 1;
        #10 pop = 0;

        // POP → 10
        #10 pop = 1;
        #10 pop = 0;

        #20 $finish;
    end

endmodule