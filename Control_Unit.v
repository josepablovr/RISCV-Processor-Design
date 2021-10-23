`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:14:39 10/23/2021 
// Design Name: 
// Module Name:    Control_Unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Control_Unit(
    input [31:0] instruction,
    input BrRes,
    output reg PCSel,
    output reg [2:0] ImmSel,
    output reg RegWEn,
    output reg Bsel,
    output reg Asel,
    output reg [2:0] ALUSel,
    output reg MemW,
    output reg [1:0] WBSel,
    output reg Store_Select,
    output reg Load_Select
    );
	 wire [6:0] opcode;
	 wire [6:0] funct7;
	 wire [2:0] funct3;
	 
	 assign opcode = instruction[6:0];	 
	 assign funct3 = instruction[14:12];
	 assign funct7 = instruction[31:25];
	 
	 always@(*) 
		case(opcode[4:0])
		5'b01100: begin //INSTRUCCIONES ARITMETICAS REGISTRO-REGISTRO
							PCSel = 1'b0; 
							ImmSel = 3'b000;
							RegWEn = 1'b1;
							Bsel = 1'b0;
							Asel = 1'b0;
							MemW = 1'b0;
							WBSel = 2'b01;
							Store_Select = 1'b0;
							Load_Select = 1'b0;
							case(funct7[5])
								1'b0: ALUSel = 3'b011;//Instruccion add
								1'b1: ALUSel = 3'b010;//Instruccion sub							
							endcase
						end
						
		5'b00100: begin //INSTRUCCIONES ARITMETOLOGICAS REGISTRO-INMEDIATO
							PCSel = 1'b0; 
							ImmSel = 3'b000;
							RegWEn = 1'b1;
							Bsel = 1'b1;
							Asel = 1'b0;
							MemW = 1'b0;
							WBSel = 2'b01;
							Store_Select = 1'b0;
							Load_Select = 1'b0;
							case(funct3)
								3'b000: ALUSel = 3'b011;//Instruccion addi
								3'b001: ALUSel = 3'b100;//Instruccion slli 
								3'b100: ALUSel = 3'b001;//Instruccion xori
								3'b101: ALUSel = 3'b101;//Instruccion srai
								3'b111: ALUSel = 3'b000;//Instruccion andi 
							endcase
						end
		5'b00011: begin //INSTRUCCION LOAD WORD (lw)
							PCSel = 1'b0; 
							ImmSel = 3'b000;
							RegWEn = 1'b1;
							Bsel = 1'b1;
							Asel = 1'b0;
							ALUSel = 3'b011;
							MemW = 1'b0;
							WBSel = 2'b00;
							Store_Select = 1'b0;
							Load_Select = 1'b0;						
						end
		5'b00000: if (funct3 == 3'b100) //If provisional porque el opcode son 0's (REVISAR)
							begin //INSTRUCCION LOAD BYTE (lbu)
								PCSel = 1'b0; 
								ImmSel = 3'b000;
								RegWEn = 1'b1;
								Bsel = 1'b1;
								Asel = 1'b0;
								ALUSel = 3'b011;
								MemW = 1'b0;
								WBSel = 2'b00;
								Store_Select = 1'b0;
								Load_Select = 1'b1;						
							end
		
		5'b11001: begin //INSTRUCCION JUMP AND LINK (jalr)
							PCSel = 1'b1; 
							ImmSel = 3'b000;
							RegWEn = 1'b1;
							Bsel = 1'b1;
							Asel = 1'b0;
							ALUSel = 3'b011;
							MemW = 1'b0;
							WBSel = 2'b10;
							Store_Select = 1'b0;
							Load_Select = 1'b0;						
						end
		
		5'b01000: begin //INSTRUCCIONES STORE
							PCSel = 1'b0; 
							ImmSel = 3'b011;
							RegWEn = 1'b0;
							Bsel = 1'b1;
							Asel = 1'b0;
							ALUSel = 3'b011;
							MemW = 1'b1;
							WBSel = 2'b00; //XX
							Load_Select = 1'b0;
							case(funct3[1])
								1'b0: Store_Select = 1'b1;//Instruccion sb
								1'b1: Store_Select = 1'b0;//Instruccion sw							
							endcase
						end
						
		5'b11000: begin //INSTRUCCION BRANCH NOT EQUAL	(bne)							 
							ImmSel = 3'b010;
							RegWEn = 1'b0;
							Bsel = 1'b1;
							Asel = 1'b1; 
							ALUSel = 3'b011;
							MemW = 1'b0;
							WBSel = 2'b00; //xx
							Store_Select = 1'b0;
							Load_Select = 1'b0;
							case(BrRes)
								1'b0: PCSel = 1'b0;
								1'b1: PCSel = 1'b1;							
							endcase							
						end
						
		5'b01101: begin //INSTRUCCION LOAD UPPER INMEDIATE (lui)
							PCSel = 1'b0; 
							ImmSel = 3'b100;
							RegWEn = 1'b1;
							Bsel = 1'b0;
							Asel = 1'b0; //X
							ALUSel = 3'b011;//XXX
							MemW = 1'b0;
							WBSel = 2'b11;
							Store_Select = 1'b0;
							Load_Select = 1'b0;						
						end
						
		
						
		5'b11011: begin //INSTRUCCION JUMP AND LINK (jal)
							PCSel = 1'b1; 
							ImmSel = 3'b001;
							RegWEn = 1'b1;
							Bsel = 1'b1;
							Asel = 1'b1; 
							ALUSel = 3'b011;
							MemW = 1'b0;
							WBSel = 2'b10;
							Store_Select = 1'b0;
							Load_Select = 1'b0;						
						end
						
		default: begin //NO HAY INSTRUCCION
							PCSel = 1'b0; 
							ImmSel = 3'b000;
							RegWEn = 1'b0;
							Bsel = 1'b0;
							Asel = 1'b0; 
							ALUSel = 3'b000;
							MemW = 1'b0;
							WBSel = 2'b00;
							Store_Select = 1'b0;
							Load_Select = 1'b0;				
						end

		
		
		
		endcase
	
		
				

endmodule
