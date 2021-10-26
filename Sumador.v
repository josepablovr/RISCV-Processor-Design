`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:24:04 10/17/2021 
// Design Name: 
// Module Name:    Sumador 
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
Funcionalidad: este módulo se encarga de hacer la operación de suma de 2 valores
que son ingresados en la ALU, ya sean registro-registro o registro-inmediato. 

Entradas:

A: Entrada del primer valor a sumar almacenado en registro.
B: Entrada del segundo valor a sumar almacenado en registro o como inmediato.

Salidas:

S: Resultado de la suma.

Razón de uso:
Este módulo se usa como parte del conjunto de operaciones de la ALU, las
cuales van a ser seleccionadas por el seleccionador para ejecutarse, busca
realzair una suma para operaciones de add o para buscar la nueva dirección
*/

module Sumador(

	 input signed [31:0] A, //Registro 1 de la suma
	 input signed [31:0] B, //Registro 2 o Inmediato de la suma 
	 output reg signed [31:0] S //Resultado de la suma
    );
	 
	 reg signed [32:0] Sum;
	 
	 always @*
		S <= A + B;
		
	
	 


endmodule


