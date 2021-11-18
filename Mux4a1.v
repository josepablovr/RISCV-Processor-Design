`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:37:11 10/21/2021 
// Design Name: 
// Module Name:    Mux4a1 
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
Funcionalidad: este módulo es una MUX genérica de 4 a 1, su función cosiste en seleccionar
una de las cuatro entradas dependiendo de las circunstancias. 

Entradas:

A: Una de las dos entradas del MUX.
B: La segunda entrada de la MUX.
C: La tercer entrada de la MUX.
D: La cuarta entrada de la MUX.
sel: Seleccionador de 2 bits del MUX que puede ser '00', '01', '10' o '11'.

Salidas:

data_out: Salida del Mux con la entrada seleccionada.

Razón de uso:
Este módulo se usa para elegir entre cuatro opciones, permitiendo que solo pase la indicada 
por el seleccionador dependiendo de la unidad de control u otra señal.
*/

module Mux4a1(data_A, data_B, data_C, data_D, sel, data_out);
	input [1:0] sel;	
	input [31:0] data_A;
	input [31:0] data_B;
	input [31:0] data_C;
	input [31:0] data_D;
	output reg [31:0] data_out;
	
	always @(*)
			case (sel)
				2'd0: data_out = data_A;
				2'd1: data_out = data_B;
				2'd2: data_out = data_C;
				2'd3: data_out = data_D;				
				default: data_out = data_A;
			endcase

endmodule
