module stack_memory (
    input clk,
    input reset,
    input push,
    input pop,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output full,
    output empty,
    output [7:0] top   // PEEK
);

    reg [7:0] stack [0:7];
    reg [3:0] sp;

    assign empty = (sp == 0);
    assign full  = (sp == 8);
    assign top   = (sp > 0) ? stack[sp - 1] : 0;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sp <= 0;
            data_out <= 0;
        end
        else begin
            if (push && !full) begin
                stack[sp] <= data_in;
                sp <= sp + 1;
            end
            else if (pop && !empty) begin
                sp <= sp - 1;
                data_out <= stack[sp - 1];
            end
        end
    end

endmodule