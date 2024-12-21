`timescale 1ns / 1ns

module Program_Counter (clk,PC_input, PC);
input clk;
output reg [31:0] PC;
input [31:0] PC_input;

initial begin
 PC = 32'd0;
end
always@(posedge clk)
begin
    PC = PC_input;
end
endmodule

