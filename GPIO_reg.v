`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:46:26 10/23/2021 
// Design Name: 
// Module Name:    GPIO_reg 
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
Funcionalidad: es un registro utilizado para la salida del GPIO. Almacena un dato de 32bits
					que se desee escribir al GPIO.

Entradas:
- in: entrada de 32bits con el dato que se desea escribir en el GPIO
- En: enable de escritura en el registro
- Rst: señal de reset, asíncrona y activa en alto
- clk: señal de reloj del sistema

Salidas:
- out: salida de 32bits con el dato escrito en el GPIO

Razón de uso: se implementó este registro para capturar un dato cuando este se direcciona a
				  0xABCD, que indica que se debe escribir en el GPIO en lugar de la memoria

*/

module GPIO_reg(in, En, Rst, clk, out);

	input [31:0] in;
	input En, Rst, clk;
	output reg [31:0] out = 0;
	
   always @(posedge clk or posedge Rst)
      if (Rst)
			begin
				out <= 32'd0;
			end
		else
			if (En)
				begin
				out <= in;
				end
endmodule
