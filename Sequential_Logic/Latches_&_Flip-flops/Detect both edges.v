module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] anyedge
);
    reg [7:0] in_prev;
    always@(posedge clk) begin
        in_prev <= in;
        anyedge <= (~in_prev & in) | (in_prev & ~in); // here we must use bitwise operators not logical 
        // logical are the "&&" and || ones give result in single bit .ie, true(1) or false(0)
    end

endmodule
