`timescale 1ns/1ns
module ImmediateGenerator (ImGen_input, type, type2,type3, ImGen_output);
    input [19:0] ImGen_input;
    output reg [31:0] ImGen_output;
    input type, type2, type3;

always @(*) 
begin 
if (type3 ==0)
begin
    if (type2 == 0) 
    begin
        
        if (type == 0) 
        begin
            ImGen_output[31:11] = {21{ImGen_input[11]}};
            ImGen_output[11:0] = ImGen_input[11:0];
        end

        else if(type == 1)
        begin
            ImGen_output[31:5] = {28{ImGen_input[4]}};
            ImGen_output[4:0] = ImGen_input[4:0];
        end
    end
    else if (type2 == 1)
    begin
            if (type == 0) 
            begin
            ImGen_output[31:13] = {19{ImGen_input[11]}};
            ImGen_output[12:1] = ImGen_input[11:0];
            ImGen_output[0] = 1'b0;
            end

            if (type == 1)
            begin
            ImGen_output[31:21] = {11{ImGen_input[19]}};
            ImGen_output[20:1] = ImGen_input[19:0];
            ImGen_output[0] = 1'b0;            
            end
    end

end    
else
begin
ImGen_output[31:12] = ImGen_input;
ImGen_output[11:0] = 12'd0; 
end

end

endmodule