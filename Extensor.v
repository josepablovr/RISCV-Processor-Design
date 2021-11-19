`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:00:03 10/21/2021 
// Design Name: 
// Module Name:    Extensor 
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
Funcionalidad: este módulo se encarga de generar los inmediatos de 32bits requeridos
					según cada tipo de instrucción.

Entradas:
- ImmSel: selector de 2bits para el tipo de inmediato, según el formato de la instrucción
- inst: entrada de 25bits que corresponden a los bits más significativos [31:7] de la instrucción
		  (en estos bits se codifica el inmediato)

Salidas:
- ImmOut: salida de 32bits para los inmediatos tipo I, J, B y S (se elige con el selector ImmSel)
- Imm_U: salida de 32bits particular y exclusiva para inmediatos del tipo U

Razón de uso: se introdujo este módulo para extraer y decodificar el inmediato de la instrucción,
				  además de extenderlo a 32 bits, respetando el formato específico de cada instrucción

*/

module Extensor(
	input [1:0] ImmSel,
	input [31:7] inst,
	output reg [31:0] ImmOut,
	output [31:0] Imm_U
    );
	
	wire [19:0] signo;
	assign signo = {20{inst[31]}};
	
	always @(ImmSel, signo, inst)
		case (ImmSel)
			2'b00: ImmOut = {signo, inst[31:20]};													//formato I
			2'b01: ImmOut = {signo[11:0], inst[19:12], inst[20], inst[30:21], 1'b0};	//formato J
			2'b10: ImmOut = {signo, inst[7], inst[30:25], inst[11:8], 1'b0};				//formato B
			2'b11: ImmOut = {signo, inst[31:25], inst[11:7]};									//formato S
		endcase

	assign Imm_U = {inst[31:12], 12'h000}; 	//salida individual para el inmediato de formato U

endmodule
