/*Build a 4-digit BCD (binary-coded decimal) counter. Each decimal digit is encoded using 4 bits: q[3:0] is the ones digit, q[7:4] is the tens digit, etc. For digits [3:1], also output an enable signal indicating when each of the upper three digits should be incremented.

You may want to instantiate or modify some one-digit decade counters.


Suppose q = 9_9_0_0 (lower 2 digits are 9) and clock happens:

First if (q[3:0] == 9) is true → q[7:4] increments.

The first if branch executes, so all else if statements are skipped.

That means q[11:8] does not get incremented even though it should (because q[3:0] == 9 && q[7:4] == 9).

✅ This is why only using independent if statements works.


*/







module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output reg [15:0] q
);

    // ena signals are combinational
    assign ena[1] = (q[3:0]  == 4'd9);
    assign ena[2] = (q[7:4]  == 4'd9) && (q[3:0]  == 4'd9);
    assign ena[3] = (q[11:8] == 4'd9) && (q[7:4]  == 4'd9) && (q[3:0] == 4'd9);

    always @(posedge clk) begin
        if (reset) begin
            q <= 16'd0;
        end
        else begin
            q[3:0] <= (q[3:0] == 4'd9) ? 0:q[3:0]+1;
            
            if (q[3:0] == 4'd9) 
                q[7:4] <= (q[7:4] == 4'd9) ? 0:q[7:4]+1;
            if (q[3:0] == 9 && q[7:4] == 9)
            q[11:8] <= (q[11:8] == 9) ? 0 : q[11:8] + 1;
            if (q[3:0] == 9 && q[7:4] == 9 && q[11:8] == 9)
            q[15:12] <= (q[15:12] == 9) ? 0 : q[15:12] + 1;
        end
    end
            
           
                
            
endmodule
