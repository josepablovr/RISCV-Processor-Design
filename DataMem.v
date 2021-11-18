`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:54:10 10/21/2021 
// Design Name: 
// Module Name:    DataMem 
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
Funcionalidad: almacena la informaci�n para guardar en memoria y leerla

Entradas: 

Address: direcci�n de memoria a la que se quire acceder
Wdata: informaci�n que se desea escribir en memoria
MemRW: permite escribir informaci�n en memoria 
clock: se�al de reloj

Salidas:

Rdata: salida de datos de memoria

Raz�n de uso:
El m�dulo se introdujo para guardar bytes de manera individual o bien, palabras completas, adem�s, 
se agreg� para leer palabras completas de memoria y utilizarlas para otras funciones
*/

module DataMem(
		input [31:0] Address,  						
		input [31:0] Wdata, 							
		input MemRW,		  							
		input clock,
		output reg [31:0] Rdata 
    );

	reg [31:0] Mem [255:0];  		   //Memoria de 32 bits y 256 filas
	wire [7:0] Direc = Address[9:2];	//como cada fila es de 4 bytes la direcci�n de inter�s es Address[2]
											   // y se toman 8 bits por el tama�o de la memoria

	integer i;	//entero de 32 bits
	
	initial begin									//inicializaci�n de la memoria tomando en cuenta el l�mite de 250 loops del software
		for (i = 0; i < 248; i = i + 1) begin
			Mem[i] = 0;
		end
		for (i = 248 ;i < 256; i = i + 1)
		begin
			Mem[i] = 0;
		end
	end
	
	
	always @(posedge clock) begin
		if (MemRW) begin									//si se desea escribir a memoria
			Mem[Direc] = Wdata;			//escribe los datos de Wdata en la direccion de memoria
		end
	end
	
	always @(negedge clock) begin
		Rdata = Mem[Direc];				   //coloca a la salida la palabra en la direccion de memoria
	end
	
endmodule 
