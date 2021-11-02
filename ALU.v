`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:33:58 10/19/2021 
// Design Name: 
// Module Name:    ALU 
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

/* 
Funcionalidad: este m�dulo se encarga del rol de la ALU, se usa para realziar operaciones 
necesarias para el conjunto de instrucciones usadas, desde sumas y restas, hasta desplazamientos
y operaciones aritm�tico l�gicas.

Entradas:

A: Entrada de la ALU (RD1) que es un registro
B: Entrada de la ALU (RD2) que puede ser un registro o un inmediato
ALUSel: Entrada del selccionador para elegir la operaci�n necesaria de la ALU

Salidas:

ALU_Output: Salida de la ALU que contiene el resultado de las operaciones de las instrucciones.
Offset: Salida de la ALU que almacena los 2 bits menos significativos de la ALU_Output para el Load Block
Address: Salida de la ALU para el caso de que se necesite la direcci�n de una nueva memoria con el address alineado

Raz�n de uso:
Este m�dulo se usa para implementar la ALU principal, la cual va a realizar las operaciones 
de las distintas instrucciones brindadas.
*/

module ALU(
	 input [31:0] A, //Primer Operando de entrada
    input [31:0] B, //Segundo Operando de entrada
	 input [2:0] ALUSel, //Seleccionador de la ALU
	 output [31:0] ALU_Output, //Salida de la ALU con resultado
	 output [1:0] Offset, //Salida de la ALU para generar el offset
	 output wire [31:0] Address //Salida de la ALU para generar el address alineado
    );
	 
	wire [31:0] ALU_Out; //Salida de la ALU con resultado
	wire [31:0] LLSOut; //salida del Logical Shift Left
	wire [31:0] ARSOut; //salida del Arithmetic Shift Right
	wire [31:0] ANDOut; //salida de la AND 
	wire [31:0] OROut; //salida de la OR  
	wire [31:0] SUMOut; //salida del sumador
	wire [31:0] RESOut; //salida del restador
	
	//Llamado de AND
	AND AND (
		.A(A), 
		.B(B), 
		.R(ANDOut)
	);
	
	// Llamado de OR
	XOR XOR (
		.A(A), 
		.B(B), 
		.R(OROut)
	);
	
	// Llamado del restador
	Restador Restador ( 
		.A(A), 
		.B(B), 
		.R(RESOut) 
	);
	
	// Llamado del sumador
	Sumador Sumador ( 
		.A(A), 
		.B(B), 
		.S(SUMOut) 
	);
	
	// Llamado de Arithmetic Shift Right
	Shift_left Shift_left (
		.A(A), 
		.B(B[4:0]),
		.out(LLSOut) 
	);
	
	// Llamado de Logical Shift Left 
	Shift_right Shift_right (
		.A(A), 
		.B(B[4:0]), 
		.out(ARSOut)
	);
	
	// Llamado de la MUX para seleccionar operaci�n
	MUX_ALU MAX_ALU ( //Entradas de la ALU seg�n el seleccionador
		.ALUSEL(ALUSel), 
		.AND(ANDOut), 
		.OR(OROut), 
		.RES(RESOut), 
		.SUM(SUMOut), 
		.LLS(LLSOut), 
		.ASR(ARSOut), 
		.ALUOut(ALU_Out) //Salida de la ALU
	);
	
     
       assign ALU_Output = ALU_Out;
       assign Offset = ALU_Out[1:0];
		 assign Address = {ALU_Out[31:2], 2'b00};
		 
endmodule
