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
/*
FUNCIONALIDAD: enviar las señales de control a los distintos bloques de la microarquitectura de acuerdo
con la instruccion actual

ENTRADAS:
opcode[6:2]: indica el tipo de instrucción
funct3[5]: especifica la instruccion en los tipos R, I y S 
funct7: especifica la instruccion en el tipo R.

SALIDAS:
PCSel: Selecciona si se lee el valor de PC+4 o PC + imm
ImmSel: Selecciona el tipo de inmediato
RegWEn: Enable para escribir en los registros
Bsel: Selecciona si la entrada 2 de la ALU proviene de un registro o inmediato
Asel: Selecciona si la entrada 1 de la ALU proviene de un registro o PC
ALUSel: Selecciona la operacion en la ALU
MemW: Enable para escribir en memoria
WBSel: Selecciona el tipo de dato a escribir en el registro
Store_Select: Selecciona si se guarda una palabra o un byte en la memoria
Load_Select: Selecciona si se carga una palabra o un byte en los registros

Razón de uso:
Se debe controlar todos los módulos en conjunto para que la arquitectura funcione como se pretende
*/
//////////////////////////////////////////////////////////////////////////////////
module Control_Unit(
    input [5:0] opcode,
	 input funct7,
	 input [2:0] funct3,
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
	 
	 always@(*) //Se realiza el caso para opcode difente
		case(opcode[5:0])
		6'b011001: begin //INSTRUCCIONES ARITMETICAS REGISTRO-REGISTRO
							PCSel = 1'b0; 
							ImmSel = 3'b000;
							RegWEn = 1'b1;
							Bsel = 1'b0;
							Asel = 1'b0;
							MemW = 1'b0;
							WBSel = 2'b01;
							Store_Select = 1'b0;
							Load_Select = 1'b0;
							case(funct7) 
								1'b0: ALUSel = 3'b011;//Instruccion add
								1'b1: ALUSel = 3'b010;//Instruccion sub							
							endcase
						end
						
		6'b001001: begin //INSTRUCCIONES ARITMETOLOGICAS REGISTRO-INMEDIATO
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
								default: ALUSel = 3'b011; //Se elimina la inferencia, se suma por defecto
							endcase
						end
						
		6'b000001: begin //INSTRUCCIONES LOAD
							PCSel = 1'b0; 
							ImmSel = 3'b000;
							RegWEn = 1'b1;
							Bsel = 1'b1;
							Asel = 1'b0;
							ALUSel = 3'b011;
							MemW = 1'b0;
							WBSel = 2'b00;
							Store_Select = 1'b0;
							case(funct3)
								3'b010: Load_Select = 1'b0;//Instruccion lw
								3'b100: Load_Select = 1'b1;//Instruccion lbu	
								default: Load_Select = 1'b0; //Se elimina la inferencia, se suma por defecto
							endcase
											
						end						
		
		6'b110011: begin //INSTRUCCION JUMP AND LINK (jalr)
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
		
		6'b010001: begin //INSTRUCCIONES STORE
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
						
		6'b110001: begin //INSTRUCCION BRANCH NOT EQUAL	(bne)							 
							ImmSel = 3'b010;
							RegWEn = 1'b0;
							Bsel = 1'b1;
							Asel = 1'b1; 
							ALUSel = 3'b011;
							MemW = 1'b0;
							WBSel = 2'b00; //No importa el valor
							Store_Select = 1'b0;
							Load_Select = 1'b0;
							case(BrRes)
								1'b0: PCSel = 1'b0;
								1'b1: PCSel = 1'b1;							
							endcase							
						end
						
		6'b011011: begin //INSTRUCCION LOAD UPPER INMEDIATE (lui)
							PCSel = 1'b0; 
							ImmSel = 3'b100;
							RegWEn = 1'b1;
							Bsel = 1'b0;
							Asel = 1'b0; //No importa el valor
							ALUSel = 3'b011;//No importa el valor
							MemW = 1'b0;
							WBSel = 2'b11;
							Store_Select = 1'b0;
							Load_Select = 1'b0;						
						end
						
		
						
		6'b110111: begin //INSTRUCCION JUMP AND LINK (jal)
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
						
		default: begin //NO HAY INSTRUCCION, se asumen las salidas 0
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
