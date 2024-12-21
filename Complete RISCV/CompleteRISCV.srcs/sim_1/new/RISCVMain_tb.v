`timescale 1ns/1ns
module RISCV_tb();
    reg clk;
    wire [31:0] W_testvar,X_testvar;
    wire [31:0] Y_testvar;
    wire [31:0] Z_testvar;
    wire [3:0] V_testvar;
    wire U_testvar;
    RISCV R1 ( clk, U_testvar, V_testvar,W_testvar,X_testvar, Y_testvar, Z_testvar);
    
initial begin
 clk=0;
forever #5 clk=~clk;
end

initial begin
$monitor("clk = %d, U=%d, V=%d,W = %d, X = %d, Y = %d, Z= %d", clk,U_testvar, V_testvar,W_testvar, X_testvar, Y_testvar, Z_testvar);
#10000 $finish;
end

endmodule

