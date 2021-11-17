`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:49:24 10/23/2021
// Design Name:   Control_Unit
// Module Name:   C:/Users/Jose Pablo/Documents/6to Semestre/Microprocesadores y Microcontroladores/Proyecto/Github/Proyecto_Microprocesadores/Control_Unit_tb.v
// Project Name:  Proyecto_Microprocesadores_V1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
/*
Objetivo de la prueba: observar las distintas señales de control de acuerdo al tipo de instrucción

o Estímulos: Se enviarán distintos opcodes, con sus respectivos funct3 y funct7, con el fin de que la unidad de control identifique
la instrucción que se está leyendo.

o Descripción de resultados esperados: cuando la unidad lea la instrucción, esta deberá ser capaz de generar las señales de control
correctas. La coherencia de estas últimas, se verificará al comparar los resultados de la simulación con la tabla respectiva.
*/
////////////////////////////////////////////////////////////////////////////////

module Control_Unit_tb;

	// ENTRADAS
	reg [6:0] opcode;
	reg funct7;
	reg [2:0] funct3;
	reg BrRes;

	// SALIDAS
	wire PCSel;
	wire [1:0] ImmSel;
	wire RegWEn;
	wire Bsel;
	wire Asel;
	wire [2:0] ALUSel;
	wire MemW;
	wire [1:0] WBSel;
	wire Store_Select;
	wire Load_Select;

	// SE INICIALIZA LA FUNCION
	Control_Unit uut (
		.opcode(opcode), 
		.funct7(funct7), 
		.funct3(funct3), 
		.BrRes(BrRes), 
		.PCSel(PCSel), 
		.ImmSel(ImmSel), 
		.RegWEn(RegWEn), 
		.Bsel(Bsel), 
		.Asel(Asel), 
		.ALUSel(ALUSel), 
		.MemW(MemW), 
		.WBSel(WBSel), 
		.Store_Select(Store_Select), 
		.Load_Select(Load_Select)
	);

	initial begin
		//Se inicializan las entradas
		opcode = 7'b0000000;
		funct7 = 1'b0;
		funct3 = 3'b000;
		BrRes = 0;		
		#100;
      //Se procede a probar todas las funciones a utilizar
		
		//add
		opcode = 7'b0110011;
		funct7 = 1'b0;
		funct3 = 000;
		#100;
		
		
		//sub
		opcode = 7'b0110011;
		funct7 = 1'b1;
		funct3 = 3'b000;
		#100;
		
		//addi
		opcode = 7'b0010011;		
		funct3 = 3'b000;
		#100;
		
		//andi
		opcode = 7'b0010011;		
		funct3 = 3'b111;
		#100;
		
		//xori
		opcode = 7'b0010011;		
		funct3 = 3'b100;
		#100;
		
		//srai
		opcode = 7'b0010011;		
		funct3 = 3'b101;
		#100;
		
		//slli
		opcode = 7'b0010011;		
		funct3 = 3'b001;
		#100;
		
		
		//lw
		opcode = 7'b0000011;		
		funct3 = 3'b010;
		#100;
		
		//lbu
		opcode = 7'b0000011;		
		funct3 = 3'b100;
		#100;
		
		//jalr
		opcode = 7'b1100111;		
		funct3 = 3'b100;
		#100;
		
		//sw
		opcode = 7'b0100011;		
		funct3 = 3'b010;
		#100;
		
		//sb
		opcode = 7'b0100011;		
		funct3 = 3'b000;
		#100;
		
		//bne Sin salto
		opcode = 7'b1100011;		
		funct3 = 3'b001;
		#100;
		
		//bne con salto
		BrRes = 1;
		#100;
		
		//lui
		opcode = 7'b0110111;
		#100;
		
		//jal
		opcode = 7'b1101111;
		#100;

	end
      
endmodule

