`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:49 10/19/2021 
// Design Name: 
// Module Name:    Restador 
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
Funcionalidad: este módulo se encarga de hacer la operación de resta de 2 valores
que son ingresados en la ALU, los cuales serán de tipo registro-registro. 

Entradas:

A: Entrada del primer valor a restar almacenado en registro.
B: Entrada del segundo valor a restar almacenado en registro o como inmediato.

Salidas:

S: Resultado de la resta

Razón de uso:
Este módulo se usa como parte del conjunto de operaciones de la ALU, las
cuales van a ser seleccionadas por el seleccionador para ejecutarse, busca
realizar una resta para operaciones de sub.
*/

module Restador(
    
	 input signed [31:0] A, //Operador 1 de la resta, registro 1
	 input signed [31:0] B, //Operador 2 de la resta, registro 2 
	 output [31:0] R //Resultado de la operación
    );
	 
	 reg signed [32:0] Res; 
	 
	 always @*
		Res <= A - B;
		
	 assign R = Res[31:0];

endmodule
