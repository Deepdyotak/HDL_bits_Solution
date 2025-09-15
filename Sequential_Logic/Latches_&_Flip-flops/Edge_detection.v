//pedge[i] <= out[i] // this doesnt mark a positive edge rather just says when input is 1 or 0
            
module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);
    reg [7:0] i_prev;
    always@(posedge clk)begin
        for(integer i=0;i<8;i++) begin
            
            i_prev[i] <= in[i];  // remember the previous state
            pedge[i] <= ~i_prev[i] & in[i]; // this tells when prev state was 0 and later state is 1 then only pedge pedge 1.
        end
    end

endmodule
