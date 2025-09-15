module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);
    reg [31:0] in_prev;
    always@(posedge clk) begin
        in_prev <= in;
        if(reset) out <= 0;
        else
            out <= out | (in_prev & ~in); // out should stay 1 hence its begin orred
    end
        
            

endmodule
