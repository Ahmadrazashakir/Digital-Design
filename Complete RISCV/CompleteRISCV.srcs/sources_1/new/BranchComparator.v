`timescale 1ns / 1ns

module BComp(Reg_rs1, Reg_rs2, BrUn, BrLT, BrEq);
    input [31:0] Reg_rs1;
    input [31:0] Reg_rs2;
    input BrUn;
    output reg BrLT;
    output reg BrEq;
    
    always@(*)
    begin
    
        if (BrUn == 1)
        begin
            if (Reg_rs1 < Reg_rs2)
            begin
            BrLT = 1;
            BrEq = 0;
            end
            else if (Reg_rs1 == Reg_rs2)
            begin
            BrLT = 0;
            BrEq = 1;
            end  
            else
            begin
            BrLT = 0;
            BrEq = 0;
            end          
        end
        else
        begin
            if ($signed(Reg_rs1) < $signed(Reg_rs2))
            begin
            BrLT = 1;
            BrEq = 0;
            end
            else if (Reg_rs1 == Reg_rs2)
            begin
            BrLT = 0;
            BrEq = 1;
            end
            else
            begin
            BrLT = 0;
            BrEq = 0;
            end
        end
    end    
endmodule