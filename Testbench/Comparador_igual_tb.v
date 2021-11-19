`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:19:34 10/23/2021
// Design Name:   Comparador_igual
// Module Name:   C:/ProyectosVerilog/Proyecto_Micros/Comparador_igual_tb.v
// Project Name:  Proyecto_Micros
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Comparador_igual
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
- Objetivo de la prueba: verificar el correcto funcionamiento del comparador de datos iguales

- Estímulos: se modifica periódicamente el dato en la entrada A mientras que B se mantiene
				 constante con un valor de 0x0000ABCD

- Descripción de resultados esperados: se espera que la salida se active ("igual" en alto) cuando
													ambas entradas A y B sean iguales
*/

module Comparador_igual_tb;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;

	// Outputs
	wire igual;

	// Instantiate the Unit Under Test (UUT)
	Comparador_igual uut (
		.A(A), 
		.B(B), 
		.igual(igual)
	);

	initial begin
		// Initialize Inputs
		A = 32'h0000ABC0;
		B = 32'h0000ABCD;
		
		#200 $stop;
	end
   
   //se incrementa periódicamente la entrada A
	always #10 A = A + 1;
		
endmodule

