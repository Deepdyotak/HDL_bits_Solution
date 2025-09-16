module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    wire [3:0] q1,q2,q3;
    assign c_enable[0] = 1'b1; // fastest or u can say sec hand of clock always high 0-9
    assign c_enable[1] = (q1 == 4'd9); // this one when q1 reaches 9
    assign c_enable[2] = (q1 == 4'd9) & (q2 == 4'd9) ; // this one when q1 and q2 reaches 9-9
    
    

        

    bcdcount counter0 (clk, reset, c_enable[0],q1);
    bcdcount counter1 (clk, reset, c_enable[1],q2);
    bcdcount counter2 (clk, reset, c_enable[2],q3);
    assign OneHertz = (q1 == 4'd9) & (q2 == 4'd9) & (q3==4'd9) ; // 1000 input cycles get over = 1 pulse of OneHertz signal

endmodule
