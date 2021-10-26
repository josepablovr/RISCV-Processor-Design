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
Funcionalidad: este módulo se encarga de hacer la operación de XOR de 2 valores
que son ingresados en la ALU 

Entradas:

A: Entrada de la ALU, entrada número 1 para la XOR
B: Entrada de la ALU, entrada número 2 para la XOR

Salidas:

R: Resultado de la operación XOR

Razón de uso:
Este módulo se usa como parte del conjunto de operaciones de la ALU, las
cuales van a ser seleccionadas por el seleccionador para ejecutarse.
*/

module XOR(
    input [31:0] A, //Registro 1 de la OR
    input [31:0] B, //Lectura de inmediato 
    output [31:0] R //Sálida con el resultado de la OR
    );
	 
	 assign R = A^B;  //Aplicación de la OR


endmodule
