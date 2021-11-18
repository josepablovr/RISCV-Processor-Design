`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:45:20 10/21/2021
// Design Name:   branch_comp
// Module Name:   C:/Users/Jose Pablo/Documents/6to Semestre/Microprocesadores y Microcontroladores/Proyecto/Github/Proyecto_Microprocesadores/branch_comp_tb.v
// Project Name:  Proyecto_Microprocesadores_V1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: comparador
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
/*
o Objetivo de la prueba: esta prueba simplemente verifica que la comparación entre los dos registros se realiza correctamente.


o Estímulos: recibe RD1 y RD2 que corresponde a los dos registros que se comparan.


o Descripción de resultados esperados: se espera que si los dos registros son iguales la salida BrRes se coloque en 0 y en el caso 
contrario que se coloque en 1.
*/

module branch_comp_tb;

	// ENTRADAS
	reg [31:0] RD1;
	reg [31:0] RD2;

	// SALIDAS
	wire BrRes;

	// Se llama al modulo
	COMPARADOR uut (
		.RD1(RD1), 
		.RD2(RD2), 
		.BrRes(BrRes)
	);

	initial begin
		//Dos registros iguales
		RD1 = 32'hFFBBCCAA;
		RD2 = 32'hFFBBCCAA;		
		#100;
		
		
      //Dos registros diferentes
		RD1 = 32'hFFBBCCAA;
		RD2 = 32'hFFFFFFFF;	
		#100;
		
		//Dos registros iguales
		RD1 = 32'hF7A99BC4;
		RD1 = 32'hF7A99BC4;
		#100;

	

	end
      
endmodule

