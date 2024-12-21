
module clz(input [31:0] rs1,output reg [31:0] rd);
    integer i;
    wire [31:0] add_result;
    add add_inst (.rs1(rd), .rs2(32'b1), .rd(add_result));

    always @(*) begin
        rd = 0;
        for (i = 31; i >= 0; i = i - 1) begin
            if (rs1[i]) begin
                rd = add_result;
            end
        end
    end
endmodule
