`timescale 1ns / 1ns

module Program_Counter_ALU(PC, PC_plus4);

output reg [31:0] PC_plus4;
input [31:0] PC;

always@(*)
begin
    PC_plus4 = PC + 4;
end
endmodule

