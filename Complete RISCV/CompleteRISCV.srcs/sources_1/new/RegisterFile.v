`timescale 1ns/1ns

module RegisterFile(rs1,rs2,clk, Reg_rs1, Reg_rs2, RegWEn, rd, alu, Reg_4);
    input clk;
    input [31:0] alu;
    input  [4:0] rs1, rs2, rd;
    input RegWEn;
    output reg [31:0] Reg_rs1, Reg_rs2, Reg_4;

    reg [31:0] regfile [31:0]; // AN array of 32 registers of 32 bits
    
    
          initial begin
                 Reg_rs1 = 0;
                 Reg_rs2 = 0;
                 regfile[0]  = 32'h0000_0000;
                 regfile[1]  = 32'h0000_0000;
                 regfile[2]  = 32'h0000_0000;
                 regfile[3]  = 32'h0000_0000;
                 regfile[4]  = 32'h0000_0000;
                 regfile[5]  = 32'h0000_0000;
                 regfile[6]  = 32'h0000_0000;
                 regfile[7]  = 32'h0000_0000;
                 regfile[8]  = 32'h0000_0000;
                 regfile[9]  = 32'h0000_0000;
                 regfile[10] = 32'h0000_0000;
                 regfile[11] = 32'h0000_0000;
                 regfile[12] = 32'h0000_0000;
                 regfile[13] = 32'h0000_0000;
                 regfile[14] = 32'h0000_0000;
                 regfile[15] = 32'h0000_0000;
                 regfile[16] = 32'h0000_0000;
                 regfile[17] = 32'h0000_0000;
                 regfile[18] = 32'h0000_0000;
                 regfile[19] = 32'h0000_0000;
                 regfile[20] = 32'h0000_0000;
                 regfile[21] = 32'h0000_0000;
                 regfile[22] = 32'h0000_0000;
                 regfile[23] = 32'h0000_0000;
                 regfile[24] = 32'h0000_0000;
                 regfile[25] = 32'h0000_0000;
                 regfile[26] = 32'h0000_0000;
                 regfile[27] = 32'h0000_0000;
                 regfile[28] = 32'h0000_0000;
                 regfile[29] = 32'h0000_0000;
                 regfile[30] = 32'h0000_0000;
                 regfile[31] = 32'h0000_0000;
            end
    
    always @(posedge clk)
    begin
        if (RegWEn)
            regfile[rd] = alu;                     
    end
    
    always @(*)
    begin
    Reg_rs2 = regfile[rs2];    
    Reg_rs1 = regfile[rs1];
    Reg_4 = regfile[4];
    end
endmodule