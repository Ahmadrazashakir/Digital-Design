`timescale 1ns/1ns
module ALU (Reg_rs1, Reg_rs2, alu, ALUSel);

input [3:0] ALUSel;
input [31:0] Reg_rs1, Reg_rs2;
output reg [31:0] alu;
wire [31:0] BS_out;

BarrelShifter BS1 (Reg_rs1, Reg_rs2, ALUSel, BS_out);

always @(*)
	begin
		case (ALUSel)	// synthesis full_case parallel_case
			4'd0:	alu = Reg_rs1 + Reg_rs2;	// Add
			4'd1:	alu = Reg_rs1 - Reg_rs2;	// Subtract
			4'd2:	alu = BS_out;       // shift left
			4'd3:	alu = ($signed(Reg_rs1) < $signed(Reg_rs2));	// slt
			4'd4:	alu = Reg_rs1 < Reg_rs2;	   // sltu
			4'd5:	alu = Reg_rs1 ^ Reg_rs2;	// XOR
			4'd6:   alu = BS_out;	    // srl
			4'd7:   alu = BS_out;       //srla
			4'd8:   alu = Reg_rs1 | Reg_rs2;    //Or
			4'd9:   alu = Reg_rs1 & Reg_rs2;    //And
		endcase	
end

endmodule
