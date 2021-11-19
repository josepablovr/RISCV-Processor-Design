`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:28:54 10/23/2021 
// Design Name: 
// Module Name:    GPIO_control 
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
Funcionalidad: m�dulo encargado de controlar la captura y escritura de datos en el 
					GPIO, cuando estos se direccionan a 0xABCD

Entradas:
- MemW: se�al proveniente de la UC que indica que se trata de una instrucci�n Store
- ALU_out: entrada de 32 bits que corresponde a la salida de la ALU, que contiene la 
			  direcci�n en la que se desea hacer escritura

Salidas:
- GPIO_W: se�al de control que indica si se desea escribir el dato en el GPIO en lugar
			 que en memoria

Raz�n de uso: se implement� este m�dulo para verificar cuando se cumplen las condiciones
				  necesarias para la escritura en el GPIO, es decir, cuando la instrucci�n sea
				  un Store y el dato se direccione a 0xABCD, para habilitar la escritura en el
				  GPIO y deshabilitar la escritura en memoria
*/

module GPIO_control(
	input MemW,
	input [31:0] ALU_out,
	output GPIO_W
    );

	wire igual;
	
	Comparador_igual Comparador (
    .A(ALU_out), 
    .B(32'h0000ABCD), 
    .igual(igual)
    );
	
	assign GPIO_W = (MemW & igual);

endmodule
