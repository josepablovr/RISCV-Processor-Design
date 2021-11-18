`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer student: Gabriel Fuentes 
// 
// Create Date:    16:42:10 10/10/2021 
// Design Name: 
// Module Name:    Mux 
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
Funcionalidad: este módulo es un multiplexor, forma parte del Store Block e indicar la cantidad de bytes
y cuales usar. 

Entradas:

offset: Entrada que proviene de unas de las salidas de la ALU, y funciona como selccionador
para saber cual tipo de offset hacer. 
Mem: Proviene del Read Data de la Data Memory, contiene la información que se va a 
cargar en memoria.
imm_byte: corresponde a la función de store byte separada del store word original (entero), es la parte
que se va a cargar.


Salidas:

data_out: Contiene la salida ya codificada del 32 bits, está va a ingresar a otro MUX donde va 
a ser selccionado o no.

Razón de uso:
Este módulo se encarga de seleccionar en base al offset ingresado la corrcta dirección y forma a leer
por la Data memory donde se va a cargar la información.
*/

module Mux(offset, imm_byte, Mem, data_out);
	//Se definen entradas y salidas
	input [1:0] offset;	
	input [31:0] Mem;
	input [7:0] imm_byte;
	output reg [31:0] data_out;
	
	always @(*)
			case (offset)
				2'd0: data_out = {Mem[31:8], imm_byte[7:0]};
				2'd1: data_out = {Mem[31:16], imm_byte[7:0], Mem[7:0]};
				2'd2: data_out = {Mem[31:24], imm_byte[7:0], Mem[15:0]};
				2'd3: data_out = {imm_byte[7:0], Mem[23:0]};				
				default: data_out = {Mem[31:8], imm_byte[7:0]};
			endcase			
endmodule