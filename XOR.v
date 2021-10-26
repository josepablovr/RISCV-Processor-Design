`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:47:44 10/18/2021 
// Design Name: 
// Module Name:    XOR 
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
Funcionalidad: este m�dulo se encarga de hacer la operaci�n de XOR de 2 valores
que son ingresados en la ALU 

Entradas:

A: Entrada de la ALU, entrada n�mero 1 para la XOR
B: Entrada de la ALU, entrada n�mero 2 para la XOR

Salidas:

R: Resultado de la operaci�n XOR

Raz�n de uso:
Este m�dulo se usa como parte del conjunto de operaciones de la ALU, las
cuales van a ser seleccionadas por el seleccionador para ejecutarse.
*/

module XOR(
    input [31:0] A, //Registro 1 de la OR
    input [31:0] B, //Lectura de inmediato 
    output [31:0] R //S�lida con el resultado de la OR
    );
	 
	 assign R = A^B;  //Aplicaci�n de la OR


endmodule
