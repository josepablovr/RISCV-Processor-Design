`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:32:41 10/23/2021
// Design Name:   Load_Block
// Module Name:   C:/Users/Jose Pablo/Documents/6to Semestre/Microprocesadores y Microcontroladores/Proyecto/Github/Proyecto_Microprocesadores/Load_Block_tb.v
// Project Name:  Proyecto_Microprocesadores_V1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Load_Block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
/*
Objetivo de la prueba: probar la lectura de las palabras de memoria

o Est�mulos: Inicialmente se coloca un dato de memoria, de esta manera se podr� cambiar el Load_Select para verificar si la
salida del m�dulo es una palabra o un byte. Adem�s, en caso de que se quiera cargar un byte, se modifica la se�al Offset, 
con el fin de comprobar que se carga el byte solicitado de la palabra.

o Descripci�n de resultados esperados: cuando Load_Select es 0, se cargar� la palabra completa, si es 1 se cargar� el byte 
seleccionado. El n�mero de byte seleccionado es igual al offset, de manera que si la se�al Offset es 10, se cargar� el tercer
byte en los 8 bits menos significartivos de la salida del m�dulo.
*/

////////////////////////////////////////////////////////////////////////////////

module Load_Block_tb;

	// ENTRADAS
	reg [31:0] Load_Memory;
	reg Load_Select;
	reg [1:0] Offset;

	// SALIDAS
	wire [31:0] Load_data;

	// SE LLAMA AL M�DULO
	Load_Block uut (
		.Load_Memory(Load_Memory), 
		.Load_Select(Load_Select), 
		.Offset(Offset), 
		.Load_data(Load_data)
	);

	initial begin
		// Se inicializa el valor de memoria
		Load_Memory = 32'hA14BC5F3;
		
		//Se carga la palabra
		Load_Select = 0;
		Offset = 2'b00;		
		#100;
		
		//Se carga el primer byte
      Load_Select = 1;
		Offset = 2'b00;		
		#100;      
		
		//Se carga el segundo byte
		Offset = 2'b01;		
		#100;  
			
		//Se carga el tercer byte
		Offset = 2'b10;
		#100; 
		
		//Se carga el cuarto byte
		Offset = 2'b11;
		#100;
		
	end

