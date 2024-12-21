`timescale 1ns/1ns
module multiplexer3x1(input1, input2,input3, select, output_mux);
input [31:0] input1, input2, input3;
input [1:0]select;
output reg [31:0] output_mux;

always @(*) 
begin
    if(select == 2'b01)
        output_mux = input2;
    else if (select == 2'b00) 
        output_mux = input1;    
    else if (select == 2'b10)
        output_mux = input3;
end

endmodule