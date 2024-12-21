module ControlUnit(IMEMout,RegWEn,ALUSel,rs1,rs2,rd,BSel,type,ImGen_input,MemRW,WBSel,Load_type,Store_type,ASel,PCSel,BrLT,BrEq,BrUn,type2, type3);
input[31:0] IMEMout;
output reg RegWEn,BSel,type,MemRW,ASel,PCSel,type2,BrUn, type3;
input BrLT,BrEq;
output reg [3:0] ALUSel;
output reg [4:0] rs1,rs2,rd;
output reg [19:0] ImGen_input;
output reg [2:0] Load_type;
output reg [1:0] Store_type,WBSel;

always@*
begin

    case(IMEMout[6:0])
        7'b0110011:
        begin           //case start
                type2 = 0;
                type3 = 0;
                RegWEn=1;
                ASel=0;
                BSel=0;
                rs1=IMEMout[19:15];
                rs2=IMEMout[24:20];
                rd=IMEMout[11:7];
                PCSel=0;
                WBSel=2'd1;

                if(IMEMout[31:25]==7'b0000000 && IMEMout[14:12]==3'b000)
                begin           //Start of if IMEMout[31:25]==0000000 && IMEMout[14:12]==000
                ALUSel=4'd0;
                end                 //End of if IMEMout[31:25]==0000000 && IMEMout[14:12]==000

                else if (IMEMout[31:25]==7'b0100000 && IMEMout[14:12]==3'b000)
                begin           //Start of if (IMEMout[31:25]==0100000 && IMEMout[14:12]==000)
                ALUSel=4'd1;
                end                 //End of if (IMEMout[31:25]==0100000 && IMEMout[14:12]==000)

                else if (IMEMout[31:25]==7'b0000000 && IMEMout[14:12]==3'b001)
                begin           //Start of IMEMout[31:25]==0000000 && IMEMout[14:12]==001
                ALUSel=4'd2;
                end                 //End of IMEMout[31:25]==0000000 && IMEMout[14:12]==001

                else if( IMEMout[31:25]==7'b0000000 && IMEMout[14:12]==3'b010)
                begin           //Start of func7==0000000 && IMEMout[14:12]==010
                ALUSel=4'd3;
                end                 //End of  IMEMout[31:25]==0000000 && IMEMout[14:12]==010

                else if(IMEMout[31:25]==7'b0000000 && IMEMout[14:12]==3'b011)
                begin           //Start of IMEMout[31:25]==0000000 && IMEMout[14:12]==011
                ALUSel=4'd4;
                end         //End of IMEMout[31:25]==0000000 && IMEMout[14:12]==011

                else if(IMEMout[31:25]==7'b0000000 && IMEMout[14:12]==3'b100)   
                begin           //Start of IMEMout[31:25]==0000000 && IMEMout[14:12]==100
                ALUSel=4'd5;
                end                 //End of IMEMout[31:25]==0000000 && IMEMout[14:12]==100

                else if(IMEMout[31:25]==7'b0000000 && IMEMout[14:12]==3'b101)
                begin           //Start of IMEMout[31:25]==0000000 && IMEMout[14:12]==101
                ALUSel=4'd6;
                end         //End of IMEMout[31:25]==0000000 && IMEMout[14:12]==101

                else if(IMEMout[31:25] == 7'b0100000 && IMEMout[14:12]==3'b101)
                begin           //Start of IMEMout[31:25]==0100000 && IMEMout[14:12]==101
                ALUSel=4'd7;
                end         //end of IMEMout[31:25]==0100000 && IMEMout[14:12]==101

                else if(IMEMout[31:25]==7'b0000000 && IMEMout[14:12]==3'b110)
                begin           //Start of IMEMout[31:25]==0000000 && IMEMout[14:12]==110
                ALUSel=4'd8;
                end         //End of IMEMout[31:25]==0000000 && IMEMout[14:12]==110

                else if (IMEMout[31:25]==7'b0000000 && IMEMout[14:12]==3'b111)
                begin           //Start of IMEMout[31:25]==0000000 && IMEMout[14:12]==111
                ALUSel=4'd9;
                end         //End of IMEMout[31:25]==0000000 && IMEMout[14:12]==111
        end         //case end

        //Start of I type
        7'b0010011:
        begin   // Case I start
                type2 = 0;
                type3 = 0;
                RegWEn=1;
                ASel=0;
                BSel=1;
                rs1=IMEMout[19:15];
                rd=IMEMout[11:7];
                ImGen_input={8'd0,{IMEMout[31:20]}};
                PCSel=0;
                WBSel=2'd1;


                if(IMEMout[14:12]==3'b000)
                begin           //Start of IMEMout[14:12]==3'b000
                ALUSel=4'd0;
                type=0;
                end         //End of IMEMout[14:12]==3'b000

                else if(IMEMout[14:12]==3'b010)
                begin           //Start of IMEMout[14:12]==3'b010
                ALUSel=4'd3;
                type=0;
                end         //End of IMEMout[14:12]==3'b010

                else if(IMEMout[14:12]==3'b011)
                begin           //Start of IMEMout[14:12]==3'b010
                ALUSel=4'd4;
                type=0;
                end         //End of IMEMout[14:12]==3'b010

                else if(IMEMout[14:12]==3'b100)
                begin           //Start of IMEMout[14:12]==3'b100
                ALUSel=4'd5;
                type=0;
                end         //End of IMEMout[14:12]==3'b100

                else if(IMEMout[14:12]==3'b110)
                begin           //Start of IMEMout[14:12]==3'b110
                ALUSel=4'd8;
                type=0;
                end                 //End of IMEMout[14:12]==3'b110

                else if(IMEMout[14:12]==3'b111)
                begin           //Start of IMEMout[14:12]==3'b111
                ALUSel=4'd9;
                type=0;
                end                 //End of IMEMout[14:12]==3'b111

                else if(IMEMout[14:12]==3'b001 && IMEMout[31:25]==7'b0000000)
                begin           //Start of IMEMout[14:12]==3'b001 && IMEMout[31:25]==7'b0000000
                ALUSel=4'd2;
                type=1;
                end                 //End of IMEMout[14:12]==3'b001 && IMEMout[31:25]==7'b0000000

                else if(IMEMout[14:12]==3'b101 && IMEMout[31:25]==7'b0000000)
                begin           //Start of IMEMout[14:12]==3'b101 && IMEMout[31:25]==7'b0000000
                ALUSel=4'd6;
                type=1;
                end                 //End of IMEMout[14:12]==3'b101 && IMEMout[31:25]==7'b0000000

                else if(IMEMout[14:12]==3'b101 && IMEMout[31:25]==7'b0100000)
                begin           //Start of IMEMout[14:12]==3'b101 && IMEMout[31:25]==7'b0100000
                ALUSel=4'd7;
                type=1;
                end                 //End of IMEMout[14:12]==3'b101 && IMEMout[31:25]==7'b0100000

        end   //Case I end

        7'b0000011:
        begin           //Case load start
                type2 = 0;
                type3 = 0;
                RegWEn=1;
                ASel=0;
                BSel=1;
                rs1=IMEMout[19:15];
                rd=IMEMout[11:7];
                MemRW=0;
                WBSel=2'd0;
                ImGen_input={8'd0,{IMEMout[31:20]}};
                PCSel=0;
                type = 0;

                if(IMEMout[14:12]==3'b000)
                begin           //Start of IMEMout[14:12]==3'b000
                ALUSel=4'd0;
                Load_type=3'd1;
                end         //End of IMEMout[14:12]==3'b000

                else if(IMEMout[14:12]==3'b001)
                begin           //Start of IMEMout[14:12]==3'b001
                ALUSel=4'b0;
                Load_type=3'd2;
                end         //End of IMEMout[14:12]==3'b001

                else if(IMEMout[14:12]==3'b010)
                begin           //Start of IMEMout[14:12]==3'b010
                ALUSel=4'd0;
                Load_type=3'd3;
                end                 //End of IMEMout[14:12]==3'b010

                else if(IMEMout[14:12]==3'b100)
                begin           //Start of IMEMout[14:12]==3'b100
                ALUSel=4'd0;
                Load_type=3'd4;
                end                 //End of IMEMout[14:12]==3'b100

                else if(IMEMout[14:12]==3'b101)
                begin           //Start of IMEMout[14:12]==3'b101
                ALUSel=4'd0;
                Load_type=3'd5;                //End of IMEMout[14:12]==3'b101
                end

        end         //Case Load End

        7'b0100011:
        begin           //Start of S case
                type2 = 0;
                type3 = 0;
                RegWEn=0;
                ASel=0;
                BSel=1;
                rs1=IMEMout[19:15];
                rs2=IMEMout[24:20];
                MemRW=1;
                WBSel=2'd0;
                ImGen_input={8'd0,{IMEMout[31:25]} , {IMEMout[11:7]}};
                PCSel=0;
                type = 0;

                if(IMEMout[14:12]==3'b000)
                begin           //Start of IMEMout[14:12]==3'b000
                ALUSel=4'd0;
                Store_type=2'd1;
                end                 //End of IMEMout[14:12]==3'b000

                if(IMEMout[14:12]==3'b001)
                begin           //Start of IMEMout[14:12]==3'b001
                ALUSel=4'd0;
                Store_type=2'd2;
                end                 //End of IMEMout[14:12]==3'b001

                if(IMEMout[14:12]==3'b010)
                begin           //Start of IMEMout[14:12]==3'b010
                ALUSel=4'd0;
                Store_type=2'd3;
                end         //End of IMEMout[14:12]==3'b010

        end         //End of S case

        7'b1100011:
        begin           //Start of branch case
                type2 = 1;
                type3 = 0;
                RegWEn=0;
                rs1=IMEMout[19:15];
                rs2=IMEMout[24:20];
                MemRW=0;
                WBSel=2'd0;
                ALUSel=4'd0;
                BSel=1;
                ASel=1;
                type = 0;
                ImGen_input={8'd0,{IMEMout[31]},{IMEMout[7]},{IMEMout[30:25]}, {IMEMout[11:8]}};

                if(IMEMout[14:12]==3'b000)
                begin           //Start of IMEMout[14:12]==3'b000
                        BrUn=0;

                        if(BrEq==1)
                        begin
                        PCSel=1;
                        end
                        else
                        begin
                        PCSel=0;
                        end

                end         //End of IMEMout[14:12]==3'b000

                if(IMEMout[14:12]==3'b001)
                begin           //Start of IMEMout[14:12]==3'b001
                        BrUn=0;

                        if(BrEq==1)
                        begin
                        PCSel=0;
                        end
                        else
                        begin
                        PCSel=1;
                        end

                end                 //End of IMEMout[14:12]==3'b001

                if(IMEMout[14:12]==3'b100)
                begin                   //Start of IMEMout[14:12]==3'b100
                        BrUn=0;

                        if(BrLT==1)
                        begin
                        PCSel=1;
                        end
                        else
                        begin
                        PCSel=0;
                        end

                end                 //End of IMEMout[14:12]==3'b100

                if(IMEMout[14:12]==3'b101)
                begin                   //Start of IMEMout[14:12]==3'b101
                        BrUn=0;

                        if(BrLT==0)
                        begin
                        PCSel=1;
                        end
                        else
                        begin
                        PCSel=0;
                        end

                end                         //End of IMEMout[14:12]==3'b101

                if(IMEMout[14:12]==3'b110)
                begin                   //Start of IMEMout[14:12]==3'b110
                        BrUn=1;

                        if(BrLT==1)
                        begin
                        PCSel=1;
                        end
                        else
                        begin
                        PCSel=0;
                        end

                end                         //End of IMEMout[14:12]==3'b110

                if(IMEMout[14:12]==3'b111)
                begin                   //Start of IMEMout[14:12]==3'b111
                        BrUn=1;

                        if(BrLT==0)
                        begin
                        PCSel=1;
                        end
                        else
                        begin
                        PCSel=0;
                        end

                end                 //End of IMEMout[14:12]==3'b111

        end                 //End of branch case
        
        7'b1100111:

        begin       //Start of JALR case
            if(IMEMout[14:12]==3'b000)
            begin       //Start of IMEMout[14:12]==3'b000
                type = 0;
                type3 = 0;
                type2 = 0;
                WBSel=2'd2;
                MemRW=0;
                ALUSel=4'd0;
                ASel=0;
                BSel=1;
                RegWEn=1;
                PCSel=1;
                ImGen_input={8'd0,{IMEMout[31:20]}};
                rd=IMEMout[11:7];
                rs1=IMEMout[19:15];

            end         //End of IMEMout[14:12]==3'b000
        
        end     //End of JALR
        
       7'b1101111:
        begin       //Start of J type
                type2= 1;
                type= 1;
                type3 = 0;
                PCSel=1;
                RegWEn=1;
                BSel=1;
                ASel=1;
                ALUSel=4'd0;
                MemRW=0;
                WBSel=2;
                rd=IMEMout[11:7];
                ImGen_input={{IMEMout[31]},{IMEMout[19:12]},{IMEMout[20]}, {IMEMout[30:21]}};
        end         //End of J type

        7'b0110111:
        begin       //Start of LUI

                type3 = 1;
                PCSel=0;
                RegWEn=1;
                BSel=1;
                ALUSel=2;
                MemRW=0;
                WBSel=1;
                rd=IMEMout[11:7];
                ImGen_input=IMEMout[31:12];


        end         //End of LUI

        7'b0010111:

        begin       //Start of AUIPC
                type3 = 1;
                PCSel=0;
                RegWEn=1;
                BSel=1;
                ALUSel=0;                
                MemRW=0;
                WBSel=1;
                rd=IMEMout[11:7];
                ImGen_input=IMEMout[31:12];
end     //End of AUIPC
    endcase//case(IMEMout[6:0])
end
endmodule