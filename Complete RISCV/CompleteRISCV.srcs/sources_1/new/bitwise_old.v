
module bitwise_old(input [31:0] IMEMout, rs1, rs2, imm,output reg [31:0] rd);

reg [6:0] opcode;
reg [2:0] func3 ;
reg [6:0] func7 ;

integer i,j;
reg [15:0] rotated;
reg [63:0] product;
reg found_one;

initial
begin
	rd = 32'b0; product = 64'b0;
	rotated = 16'b0; found_one = 0;
	i = 0; j = 0;
end

always@*
begin
		opcode = IMEMout[6:0];
        func3 = IMEMout[14:12];
        func7 = IMEMout[31:25];
end

always@*
begin
	case(opcode)
		default: begin rd = 32'b0; end
		7'b0110011: begin        
					case (func7)    		// Zba
						default: begin rd = 32'b0; end
						7'b0010000: 
								begin
								rd = (rs1 << fun3[2:1]) + rs2;
//									case(func3)
//											default: begin rd = 32'b0; end
//											3'b010: begin rd = (rs1 << 1) + rs2; end // shift left rs1 by 1 and add to rs2
//											3'b100: begin rd = (rs1 << 2) + rs2; end // shift left rs1 by 2 and add to rs2
//											3'b110: begin rd = (rs1 << 3) + rs2; end // shift left rs1 by 3 and add to rs2
//									endcase
								end
						7'b0000101:
								begin 
									case(func3)
											//Zbc
					
											
											
											default: begin rd = 32'b0; end
											3'b001:  begin   								// Carry-less multiply (low-part)
														product = 0; 
														for (i = 0; i < 32; i = i + 1) begin
															for (j = 0; j < 32; j = j + 1) begin
																if (rs2[i] & rs1[j]) begin
																	product[i + j] = product[i + j] ^ 1'b1; 
																end
																else begin end
															end
														end
														rd = product[31:0]; 
													end 
											3'b011:	begin     								// Carry-less multiply (high-part)
															product = 0; 
															for (i = 0; i < 32; i = i + 1) begin
																for (j = 0; j < 32; j = j + 1) begin
																	if (rs2[i] & rs1[j]) begin
																		product[i + j] = product[i + j] ^ 1'b1; 
																	end
																	else begin end
																end
															end
														   rd = product[63:32];
													end
											3'b010: begin									 // Carry-less multiply (reversed)
															product = 0; 
															for (i = 0; i < 32; i = i + 1) begin
																for (j = 0; j < 32; j = j + 1) begin
																	if (rs2[i] & rs1[j]) begin
																		product[i + j] = product[i + j] ^ 1'b1; 
																	end
																	else begin end
																end
															end
															rd = product[62:31];
													end
											//Zbb
											3'b100: begin rd = (($signed(rs1) < $signed(rs2)) ? rs1 : rs2); end //min of rs1 and rs2 (signed)
											3'b101:	begin rd = ((rs1 < rs2) ? rs1 : rs2); end //min of rs1 and rs2 (unsigned)
											3'b110:	begin rd = (($signed(rs1) > $signed(rs2)) ? rs1 : rs2); end //max of rs1 and rs2 (signed)
											3'b111:	begin rd = ((rs1 > rs2) ? rs1 : rs2); end //max of rs1 and rs2 (unsigned)
									endcase
								end
						//Zbs
						7'b0100100: 
								begin
									case(func3)
											default: begin rd = 32'b0; end
											3'b001: begin rd = rs1 & ~(1 << rs2[4:0]); end // single bit cleared   from rs1 at the index specified in rs2
											3'b101:	begin rd = rs1 &  (1 << rs2[4:0]); end // single bit extracted from rs1 at the index specified in rs2
									endcase
								end
						7'b0110100: 
								begin
									if (func3==3'b001) 
										begin
											rd = rs1 ^ (1 << rs2[4:0]);	// single bit inverted in rs1 at the index specified in rs2
										end
									else begin end
								end
						7'b0010100:
								begin 
						            if (func3==3'b001) 
						            	begin
						                	rd = rs1 | (1 << rs2[4:0]);  // single bit set in rs1 at the index specified in rs2
						                end
										else begin end
						        end
						7'b0100000: 
								begin
									case (func3)
											default: begin rd = 32'b0; end
											3'b100: begin rd = ~(rs1 ^ rs2); end	//xnor
											3'b110: begin rd = rs1 | ~(rs2); end    //or with inverted operand (rs2)
											3'b111: begin rd = rs1 & ~(rs2); end    //and with inverted operand(rs2)
									endcase		
								end				   

						7'b0110000: 
								begin 
									case (func3)
										default: begin rd = 32'b0; end
										3'b001: begin rd = (rs1 << rs2[4:0])| (rs1 >> (32 - rs2[4:0])); end // rotate rs1 to left by amount in rs2
										3'b101: begin rd = (rs1 >> rs2[4:0])| (rs1 << (32 - rs2[4:0])); end // rotate rs1 to right by amount in rs2 
									endcase
								end
						7'b0000100:
								begin
									 if(func3 == 3'b100)  //zero extend halfword
										begin
											if (IMEMout[24:20]==5'b00000) 
											begin
												rd = {{16'b0}, rs1[15:0]}; 
											end
											else begin end
										end
									 else begin end	
								end 
					endcase 
				 end
		//Zbs (imm instructions)
		7'b0010011:
			begin 
				case (func3)
						default: begin rd = 32'b0; end	
						3'b001:
							begin  
								case(func7)
									default: begin rd = 32'b0; end
									7'b0100100:  rd = rs1 & ~(1 << imm[4:0]);    // single bit cleared   from rs1 at the index specified in imm
									7'b0110100:	 rd = rs1 ^  (1 << imm[4:0]);    // single bit inverted in rs1 at the index specified in imm
									7'b0010100:  rd = rs1 |  (1 << imm[4:0]);    // single bit set in rs1 at the index specified in imm
				    							//Zbb (counting) 
									7'b0110000: 
												case (IMEMout[24:20])
													default: begin rd = 32'b0; end
													5'b00000:                      //(count leading zeroes)
																begin
																	i = 31; rd = 0; found_one = 0;
																	while(i >= 0 && !found_one)
																	begin
																		if (rs1[i]) begin found_one = 1; rd = 31-i;  end else begin end
																		i = i-1;
																	end
																		if (!found_one) begin rd = 32; end else begin end
																end
													5'b00010:                      //(count one's)
																begin
																	rd = 0; i = 31;
																	for(i=31; i>=0;i=i-1)
																	begin
																		if(rs1[i])
																		begin
																			rd = rd + 1;
																		end
																		else begin end
																	end
																end
													5'b00001:                      //(count trailing zeroes)
															 	begin
															 		i = 0; rd = 0; found_one = 0;
																	while(i <= 31 && !found_one)
																	begin
																		if (rs1[i]) begin found_one = 1; rd = i;  end else begin end
																		i = i+1;
																	end
																		if (!found_one) begin rd = 32; end else begin end
															 	end
													5'b00100:       //sign extend byte
																begin
																	rd = {{24{rs1[7]}}, rs1[7:0]};
																end
													5'b00101:       //sign extend halfword
																begin
																	rd = {{16{rs1[15]}}, rs1[15:0]};
																end
												endcase
								endcase
							end 
						3'b101:
							begin 
								case(func7)
									default: begin rd = 32'b0; end
									7'b0100100: begin rd = rs1 & (1 << imm[4:0]); end	 // single bit extracted from rs1 at the index specified in imm
									7'b0110000: begin rd = {rs1 >> imm[4:0], rs1 << (32 - imm[4:0])}; end //rotate rs1 to right by amount in imm
									7'b0010100: begin rd = {(rs1[31:24] == 0) ? 8'b00000000 : 8'b11111111,
                											(rs1[23:16] == 0) ? 8'b00000000 : 8'b11111111,
               												(rs1[15: 8] == 0) ? 8'b00000000 : 8'b11111111,
                											(rs1[7 : 0] == 0) ? 8'b00000000 : 8'b11111111};  end // orc.b
									7'b0110100: begin rd = {rs1[7:0], rs1[15:8], rs1[23:16],rs1[31:24]};end // reverse order of bytes(rev8)
								endcase
							end	
				endcase
			end
	endcase
end
endmodule