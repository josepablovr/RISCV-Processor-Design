`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:07:10 10/21/2021 
// Design Name: 
// Module Name:    InsMem 
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
Funcionalidad: almacenar las intrucciones en hexadecimal provenientes de un c�digo C,
dependiendo de la direcci�n que se quiera acceder as� ser� su salida con la instrucci�n por realizar
Entrada: 
PC = direcci�n a acceder en memoria
Salida:
Inst = valor con instrucci�n por realizar
Raz�n de uso:
El m�dulo se introdujo para poder guardar las instrucciones en una memoria y poder acceder a ellas
*/

module InsMem(
		input [31:0] PC, 
		output reg [31:0] Inst 
    );
	 
	reg [31:0] Mem [63:0]; //array de 64 registros, cada uno de 32 bits
	 
	 
	wire [5:0] PCfila = PC[7:2]; //como la memoria tiene 64 filas solo se ocupan 6 bits
										  //se seleccion� PC[7:2] ya que el PC+4 corresponde a la posici�n PC[2] y 5 bits por el tama�o de la memoria
	integer i; //entero de 32 bits
	initial begin
		for (i = 0; i < 64; i = i + 1)
		begin
			Mem[i] = 0; //inicializaci�n de memoria
		end
		$readmemh("Prueba.txt", Mem, 0); //lee la informaci�n contenida en el fichero (en hexadecimal) y la almacena en memoria
	end
	
	always@(*)
	begin
		Inst = Mem[PCfila]; 	//colocar a la salida la respectiva instruccion 
	end
	
endmodule

