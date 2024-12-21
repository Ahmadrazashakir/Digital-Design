   `timescale 1ns / 1ns
    module RISCV( clk,U_testvar, V_testvar, W_testvar,X_testvar, Y_testvar, Z_testvar);
    input clk;
    output reg [31:0] W_testvar,X_testvar;
    output reg [31:0] Y_testvar;
    output reg [31:0] Z_testvar;
    output reg [3:0] V_testvar;
    output reg U_testvar;
    wire [31:0] PC;
    wire [31:0] IMEMout;
    wire RegWEn;
    wire [3:0] ALUSel;
    wire [4:0] rs1, rs2, rd; 
    wire [31:0] Reg_rs1;
    wire [31:0] Reg_rs2, alu;
    wire [19:0] ImGen_input;
    wire [31:0] ImGen_output;
    wire [31:0] mux_imm_output, mux_dmm_output;
    wire type, BSel;
    wire [1:0] WBSel;
    wire MemRW;
    wire [2:0] Load_type;
    wire [31:0] DMEMout;
    wire [1:0] Store_type;
    wire BrUn, BrLT, BrEq;
    wire PCSel;
    wire [31:0] mux_pc_output;
    wire ASel;
    wire type2;
    wire [31:0] PC_plus4, PC_input;
    wire [31:0] Reg_4;
    wire type3;
    
    multiplexer2x1 mux_pc_input(PC_plus4, alu, PCSel, PC_input);
    
    Program_Counter_ALU PCALU(PC, PC_plus4);
    
    Program_Counter P1 (clk,PC_input, PC);
    
    IMEM I1(PC, IMEMout);
    
    ControlUnit CU1(IMEMout,RegWEn,ALUSel,rs1,rs2,rd,BSel,type,ImGen_input,MemRW,WBSel,Load_type,Store_type,ASel,PCSel,BrLT,BrEq,BrUn,type2, type3);

    RegisterFile R1(rs1,rs2,clk,Reg_rs1, Reg_rs2, RegWEn, rd, mux_dmm_output, Reg_4);
    
    ImmediateGenerator Immed1(ImGen_input, type,type2,type3, ImGen_output);
    
    multiplexer2x1 mux_pc(Reg_rs1, PC, ASel, mux_pc_output);
    
    multiplexer2x1 mux_imm(Reg_rs2, ImGen_output, BSel, mux_imm_output);
    
    ALU Alu1(mux_pc_output, mux_imm_output, alu, ALUSel);
    
    BComp BCprtr(Reg_rs1, Reg_rs2, BrUn, BrLT, BrEq);
    
    DMEM dmem1 (clk, MemRW, Load_type,Store_type, Reg_rs2, alu, DMEMout);
    
    multiplexer3x1 mux_dmm1(DMEMout, alu,PC_plus4, WBSel, mux_dmm_output);
    
    always@(*)
    begin
    U_testvar = RegWEn;
    V_testvar = ALUSel;
     W_testvar = PC;
     X_testvar = IMEMout;
     Y_testvar = Reg_4;
     Z_testvar = mux_imm_output;
    end
    
    endmodule