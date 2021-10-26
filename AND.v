`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:47:31 10/17/2021 
// Design Name: 
// Module Name:    AND 
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
Funcionalidad: este m�dulo se encarga de hacer la operaci�n de AND de 2 valores
que son ingresados en la ALU 

Entradas:

A: Entrada de la ALU, entrada n�mero 1
B: Entrada de la ALU, entrada n�mero 2

Salidas:

R: Resultado de la operaci�n AND

Raz�n de uso:
Este m�dulo se usa como parte del conjunto de operaciones de la ALU, las
cuales van a ser seleccionadas por el seleccionador para ejecutarse.
*/

module AND(
    input [31:0] A, //Entrada A de la AND
    input [31:0] B, //Entrada B de la AND
    output [31:0] R //Salida de la AND
    );
	 
	 assign R = A & B; //Operaci�n de la AND

endmodule
