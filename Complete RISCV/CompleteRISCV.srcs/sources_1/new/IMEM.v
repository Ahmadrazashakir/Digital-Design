`timescale 1ns / 1ns
    
    module IMEM(PC, IMEMout);
        input [31:0] PC;
        output reg [31:0] IMEMout;
        reg [7:0] byte[1000:0];
            initial begin
                         byte[0] = 8'h06;
                         byte[1] = 8'h40;
                         byte[2] = 8'h02;
                         byte[3] = 8'h93;
                         
                         byte[4] = 8'h00;
                         byte[5] = 8'h00;
                         byte[6] = 8'h81;
                         byte[7] = 8'h13;
                         
                         byte[8] = 8'h00;
                         byte[9] = 8'h11;
                         byte[10] = 8'h01;
                         byte[11] = 8'h93;
                         
                         byte[12] = 8'h00;
                         byte[13] = 8'h01;
                         byte[14] = 8'h02;
                         byte[15] = 8'h13;
                         
                         byte[16] = 8'h00;
                         byte[17] = 8'h21;
                         byte[18] = 8'h81;
                         byte[19] = 8'hB3;
                         
                         byte[20] = 8'hFE;
                         byte[21] = 8'h52;
                         byte[22] = 8'h58;
                         byte[23] = 8'hE3;
                         
                         byte[24] = 8'h00;
                         byte[25] = 8'h31;
                         byte[26] = 8'h01;
                         byte[27] = 8'h33;
                         
                         byte[28] = 8'h40;
                         byte[29] = 8'h31;
                         byte[30] = 8'h01;
                         byte[31] = 8'hB3;
                         
                         byte[32] = 8'h40;
                         byte[33] = 8'h31;
                         byte[34] = 8'h01;
                         byte[35] = 8'h33;
                         
                         byte[36] = 8'hFE;
                         byte[37] = 8'h9F;
                         byte[38] = 8'hF3;
                         byte[39] = 8'h6F;
                                                  
                         byte[40] = 8'h00;
                         byte[41] = 8'h00;
                         byte[42] = 8'h00;
                         byte[43] = 8'h00;
                         byte[44] = 8'h00;
                         byte[45] = 8'h00;
                         byte[46] = 8'h00;
                         byte[47] = 8'h00;                                                
                         byte[48] = 8'h00;
                         byte[49] = 8'h00;
                         byte[50] = 8'h00;
                         byte[51] = 8'h00;
                    end
        always @ (PC) begin
            IMEMout[31:24] = byte[PC];
            IMEMout[23:16] = byte[PC+1];
            IMEMout[15:8] = byte[PC+2];
            IMEMout[7:0] = byte[PC+3];
        end
    endmodule