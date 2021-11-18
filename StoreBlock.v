`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:38:31 10/10/2021 
// Design Name: 
// Module Name:    StoreBlock 
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
Funcionalidad: enviar a la memoria de datos el valor correcto a escribir

Entradas: 
Mem: valor leído de la memoria
store_word: dato almacenado en el registro RS1 de fuente de operación
imm_byte: primer byte del valor leído en memoria
offset: es un selector de un mux, fue calculado por el bloque Address Generator y permite colocar los valores leídos correctamente.
store_select: es otro selector de un mux que permite seleccionar entre el caso de SW y SB.

Salidas:
store_out: es la señal que entra al bloque de memoria de datos, indicando el valor a escribir.

Razón de uso: se requirió para realizar el almacenamiento de 1 byte en memoria sin modificar los demás.
*/

module StoreBlock(Mem, imm_byte, offset, store_select, store_word, store_out);
	input [31:0] Mem;
	input [7:0] imm_byte;
	input [1:0] offset;
	input store_select;
	input [31:0] store_word;
	output [31:0] store_out;
	
wire [31:0] Mux_byte_out;

Mux Multiplexor_byte (
    .offset(offset), 
    .Mem(Mem), 
    .imm_byte(imm_byte), 
    .data_out(Mux_byte_out)
    );
	 
Mux2a1 Multiplexor_2a1 (
    .sel(store_select), 
    .data_A(store_word), 
    .data_B(Mux_byte_out), 
    .data_out(store_out)
    );

endmodule
