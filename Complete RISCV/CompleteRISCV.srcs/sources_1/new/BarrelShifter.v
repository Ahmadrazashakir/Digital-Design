`timescale 1ns/1ns

module BarrelShifter(Reg_rs1, Reg_rs2, select, result);
    input [31:0] Reg_rs1;
    input [31:0] Reg_rs2;
    input [3:0] select;
    output reg [31:0] result;

always @(*) begin
    // Right sift (unsigned) and for +ive signed
    if (select == 4'd6 || ((select == 4'd7) && (Reg_rs1[31]==0))) 
    begin
        case (Reg_rs2)
            32'd0: result = Reg_rs1;
            32'd1: result = {1'd0, Reg_rs1[31:1]};
            32'd2: result = {2'd0, Reg_rs1[31:2]};
            32'd3: result = {3'd0, Reg_rs1[31:3]};
            32'd4: result = {4'd0, Reg_rs1[31:4]};
            32'd5: result = {5'd0, Reg_rs1[31:5]};
            32'd6: result = {6'd0, Reg_rs1[31:6]};
            32'd7: result = {7'd0, Reg_rs1[31:7]};
            32'd8: result = {8'd0, Reg_rs1[31:8]};
            32'd9: result = {9'd0, Reg_rs1[31:9]};
            32'd10: result = {10'd0, Reg_rs1[31:10]};
            32'd11: result = {11'd0, Reg_rs1[31:11]};
            32'd12: result = {12'd0, Reg_rs1[31:12]};
            32'd13: result = {13'd0, Reg_rs1[31:13]};
            32'd14: result = {14'd0, Reg_rs1[31:14]};
            32'd15: result = {15'd0, Reg_rs1[31:15]};
            32'd16: result = {16'd0, Reg_rs1[31:16]};
            32'd17: result = {17'd0, Reg_rs1[31:17]};
            32'd18: result = {18'd0, Reg_rs1[31:18]};
            32'd19: result = {19'd0, Reg_rs1[31:19]};
            32'd20: result = {20'd0, Reg_rs1[31:20]};
            32'd21: result = {21'd0, Reg_rs1[31:21]};
            32'd22: result = {22'd0, Reg_rs1[31:22]};
            32'd23: result = {23'd0, Reg_rs1[31:23]};
            32'd24: result = {24'd0, Reg_rs1[31:24]};
            32'd25: result = {25'd0, Reg_rs1[31:25]};
            32'd26: result = {26'd0, Reg_rs1[31:26]};
            32'd27: result = {27'd0, Reg_rs1[31:27]};
            32'd28: result = {28'd0, Reg_rs1[31:28]};
            32'd29: result = {29'd0, Reg_rs1[31:29]};
            32'd30: result = {30'd0, Reg_rs1[31:30]};
            32'd31: result = {31'd0, Reg_rs1[31]};
            default: result = 32'd0;
        endcase
    end

    // Left SHift
    else if (select == 4'd2) 
    begin
        case (Reg_rs2)
            32'd0: result = Reg_rs1;
            32'd1: result = {Reg_rs1[30:0] ,1'd0};
            32'd2: result = {Reg_rs1[29:0] ,2'd0};
            32'd3: result = {Reg_rs1[28:0] ,3'd0};
            32'd4: result = {Reg_rs1[27:0] ,4'd0};
            32'd5: result = {Reg_rs1[26:0] ,5'd0};
            32'd6: result = {Reg_rs1[25:0] ,6'd0};
            32'd7: result = {Reg_rs1[24:0] ,7'd0};
            32'd8: result = {Reg_rs1[23:0] ,8'd0};
            32'd9: result = {Reg_rs1[22:0] ,9'd0};
            32'd10: result = {Reg_rs1[21:0] ,10'd0};
            32'd11: result = {Reg_rs1[20:0] ,11'd0};
            32'd12: result = {Reg_rs1[19:0] ,12'd0};
            32'd13: result = {Reg_rs1[18:0] ,13'd0};
            32'd14: result = {Reg_rs1[17:0] ,14'd0};
            32'd15: result = {Reg_rs1[16:0] ,15'd0};
            32'd16: result = {Reg_rs1[15:0] ,16'd0};
            32'd17: result = {Reg_rs1[14:0] ,17'd0};
            32'd18: result = {Reg_rs1[13:0] ,18'd0};
            32'd19: result = {Reg_rs1[12:0] ,19'd0};
            32'd20: result = {Reg_rs1[11:0] ,20'd0};
            32'd21: result = {Reg_rs1[10:0] ,21'd0};
            32'd22: result = {Reg_rs1[9:0] ,22'd0};
            32'd23: result = {Reg_rs1[8:0] ,23'd0};
            32'd24: result = {Reg_rs1[7:0] ,24'd0};
            32'd25: result = {Reg_rs1[6:0] ,25'd0};
            32'd26: result = {Reg_rs1[5:0] ,26'd0};
            32'd27: result = {Reg_rs1[4:0] ,27'd0};
            32'd28: result = {Reg_rs1[3:0] ,28'd0};
            32'd29: result = {Reg_rs1[2:0] ,29'd0};
            32'd30: result = {Reg_rs1[1:0] ,30'd0};
            32'd31: result = {Reg_rs1[0] ,31'd0};
            default: result = 32'd0;
        endcase
    end

    // Right shift (signed) for -ive number
    else if (select == 4'd7) 
    begin
        
        if (Reg_rs1[31]) 
        begin
            case (Reg_rs2)
            32'd0: result = Reg_rs1;
            32'd1: result = {~1'd0, Reg_rs1[31:1]};
            32'd2: result = {~2'd0, Reg_rs1[31:2]};
            32'd3: result = {~3'd0, Reg_rs1[31:3]};
            32'd4: result = {~4'd0, Reg_rs1[31:4]};
            32'd5: result = {~5'd0, Reg_rs1[31:5]};
            32'd6: result = {~6'd0, Reg_rs1[31:6]};
            32'd7: result = {~7'd0, Reg_rs1[31:7]};
            32'd8: result = {~8'd0, Reg_rs1[31:8]};
            32'd9: result = {~9'd0, Reg_rs1[31:9]};
            32'd10: result = {~10'd0, Reg_rs1[31:10]};
            32'd11: result = {~11'd0, Reg_rs1[31:11]};
            32'd12: result = {~12'd0, Reg_rs1[31:12]};
            32'd13: result = {~13'd0, Reg_rs1[31:13]};
            32'd14: result = {~14'd0, Reg_rs1[31:14]};
            32'd15: result = {~15'd0, Reg_rs1[31:15]};
            32'd16: result = {~16'd0, Reg_rs1[31:16]};
            32'd17: result = {~17'd0, Reg_rs1[31:17]};
            32'd18: result = {~18'd0, Reg_rs1[31:18]};
            32'd19: result = {~19'd0, Reg_rs1[31:19]};
            32'd20: result = {~20'd0, Reg_rs1[31:20]};
            32'd21: result = {~21'd0, Reg_rs1[31:21]};
            32'd22: result = {~22'd0, Reg_rs1[31:22]};
            32'd23: result = {~23'd0, Reg_rs1[31:23]};
            32'd24: result = {~24'd0, Reg_rs1[31:24]};
            32'd25: result = {~25'd0, Reg_rs1[31:25]};
            32'd26: result = {~26'd0, Reg_rs1[31:26]};
            32'd27: result = {~27'd0, Reg_rs1[31:27]};
            32'd28: result = {~28'd0, Reg_rs1[31:28]};
            32'd29: result = {~29'd0, Reg_rs1[31:29]};
            32'd30: result = {~30'd0, Reg_rs1[31:30]};
            32'd31: result = {~31'd0, Reg_rs1[31]};
            default: result = ~32'd0;
        endcase
        end

    end
        
end
    
endmodule

    
