module add(input [31:0] rs1,rs2, output reg [31:0] rd);

always@*
begin

rd = (rs1+rs2);

end
endmodule