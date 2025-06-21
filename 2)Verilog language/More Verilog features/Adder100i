module fadd(input a1,b1,cin1,
            output sum1,cout1);
    assign {cout1,sum1} = a1+b1+cin1;
endmodule


//Module instantiations (fadd faX(...)) cannot be placed inside an always block. Hence here we have to use generate statements
module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    fadd fa0(.a1(a[0]),.b1(b[0]),.cin1(cin),.sum1(sum[0]),.cout1(cout[0]));
    genvar i;
    generate
        for(i=1;i<100;i++) begin:fadd
            fadd fa(.a1(a[i]),.b1(b[i]),.cin1(cout[i-1]),.sum1(sum[i]),.cout1(cout[i]));
        end
    endgenerate
    
        
            
endmodule
