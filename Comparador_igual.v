`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:14:18 10/23/2021 
// Design Name: 
// Module Name:    Comparador_igual 
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
Funcionalidad: compara si ambas entradas del módulo son iguales

Entradas:
- A: primer dato de 32 bits a comparar
- B: segundo dato de 32 bits a comparar

Salidas:
- igual: se coloca en 1 si A y B son iguales, de lo contrario es 0

Razón de uso: se implementó este comparador como parte del módulo GPIO_control,
				  para revisar si la dirección de escritura es 0xABCD, que indica
				  que se debe escribir el dato en el GPIO
*/

module Comparador_igual(
	input [31:0] A,
	input [31:0] B,
	output igual
    );

	assign igual = (A == B);

endmodule
