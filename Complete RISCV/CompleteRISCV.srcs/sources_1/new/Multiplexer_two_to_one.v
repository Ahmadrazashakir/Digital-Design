`timescale 1ns/1ns
module multiplexer2x1(input1, input2, select, output_mux);
input [31:0] input1, input2;
input select;
output reg [31:0] output_mux;

always @(*) 
begin
    if(select)
        output_mux = input2;
    else
        output_mux = input1;    
end

endmodule