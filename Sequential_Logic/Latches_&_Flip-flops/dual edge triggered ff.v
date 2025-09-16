module top_module (
    input clk,
    input d,
    output q
);
    reg q1,q2;
    
    
    always@(posedge clk) q1<=d;
    always@(negedge clk) q2<=d;
    assign q = clk ? q1:q2;  //because q1 represents value of d at last rising edge 
// clk = 1 means it just got value of last rising edge and similarly clk = 0 means it just got value of falling edge


    
        
 

endmodule
