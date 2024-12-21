`timescale 1ns / 1ns

module DMEM(clk, MemRW, Load_type, Store_type, DataW, addr, DMEMout);
    input clk;
    input MemRW;
    input [31:0] DataW;
    input [31:0] addr;
    input [2:0] Load_type;
    input [1:0] Store_type;
    output reg [31:0] DMEMout;
    reg [7:0] byte[255:0];
    
    initial begin
    byte[0] = 32'd5;
    byte[1] = 32'd0;
    byte[2] = 32'd0;
    byte[3] = 32'd0;
    end
    always@(posedge clk) 
    begin
        if (MemRW == 1)
            begin
                if (Store_type == 2'd1) 
                begin
                    byte[addr+3] = {8{DataW[7]}};
                    byte[addr+2] = {8{DataW[7]}};
                    byte[addr+1] = {8{DataW[7]}};
                    byte[addr] = DataW[7:0];    
                end 
                else if (Store_type == 2'd2) 
                begin
                    byte[addr+3] = {8{DataW[15]}};
                    byte[addr+2] = {8{DataW[15]}};
                    byte[addr+1] = DataW[15:8];
                    byte[addr] = DataW[7:0];    
                end 
                else if (Store_type == 2'd3) 
                begin
                    byte[addr+3] = DataW[31:24];
                    byte[addr+2] = DataW[23:16];
                    byte[addr+1] = DataW[15:8];
                    byte[addr] = DataW[7:0];                        
                end
            end
    end

    always@(*)
    begin
        if (MemRW == 0) begin
            if (Load_type == 3'd1) begin
            DMEMout[31:24] = {8{byte[7]}};
            DMEMout[23:16] = {8{byte[7]}};
            DMEMout[15:8] = {8{byte[7]}};
            DMEMout[7:0] = byte[addr];        
            end 
            else if (Load_type == 3'd2) begin
            DMEMout[31:24] = {8{byte[15]}};
            DMEMout[23:16] = {8{byte[15]}};
            DMEMout[15:8] = byte[addr+1];
            DMEMout[7:0] = byte[addr]; 
            end 
            else if (Load_type == 3'd3) begin
            DMEMout[31:24] = byte[addr+3];
            DMEMout[23:16] = byte[addr+2];
            DMEMout[15:8] = byte[addr+1];
            DMEMout[7:0] = byte[addr];
            end
            else if (Load_type == 3'd4) begin
            DMEMout[31:24] = 8'd0;
            DMEMout[23:16] = 8'd0;
            DMEMout[15:8] = 8'd0;
            DMEMout[7:0] = byte[addr];
            end
            else if (Load_type == 3'd5) begin
            DMEMout[31:24] = {8'd0};
            DMEMout[23:16] = {8'd0};
            DMEMout[15:8] = byte[addr+1];
            DMEMout[7:0] = byte[addr];
            end
    
        end
    end
endmodule