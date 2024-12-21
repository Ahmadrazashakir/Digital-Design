module tb_clz();

    reg [31:0] A; // First 32-bit input

    wire [31:0] P; // 32-bit carryless product output

    // Instantiate the carryless_mult module
 clz uut(.rs1(A),.rd(P));

    initial begin
        // Test vectors
        A = 32'b01110100011110000000000000010001;
        end
endmodule 