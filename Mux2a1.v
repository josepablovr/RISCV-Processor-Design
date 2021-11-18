`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:03:21 10/10/2021 
// Design Name: 
// Module Name:    Mux2a1 
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
Funcionalidad: este módulo es una MUX genérica de 2 a 1, su función cosiste en seleccionar
una de las dos entradas dependiendo de las circunstancias. 

Entradas:

A: Una de las dos entradas del MUX.
B: La segunda entrada de la MUX.
sel: Seleccionador de 1 bit del MUX que puede ser '1' o '0'.

Salidas:

data_out: Salida del Mux con la entrada seleccionada.

Razón de uso:
Este módulo se usa para elegir entre dos opciones, permitiendo que solo pase la indicada 
por el seleccionador.
*/

module Mux2a1(sel, data_A, data_B, data_out);
	input sel;	
	input [31:0] data_A;
	input [31:0] data_B;
	output reg [31:0] data_out;
	
	always @(*)
			case (sel)
				0: data_out = data_A;
				1: data_out = data_B;			
				default: data_out = data_A;
			endcase		

endmodule
