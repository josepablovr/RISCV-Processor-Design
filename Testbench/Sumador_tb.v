`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:03:54 11/16/2021
// Design Name:   Sumador
// Module Name:   D:/jcorv/Documents/One drive/OneDrive - Estudiantes ITCR/6 Semestre/Micros/Proyecto_ALU/Nueva_ALU/Sumador_tb.v
// Project Name:  Nueva_ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Sumador
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
Objetivo de la prueba: Probar el correcto funcionamiento de la operación de suama, ingresando
dos valores en A y B para ver como opera, la resta es con signo.

Estímulos: la señal de entrada corresponde a las entradas proporcionadas por la ALU (A y B) para la operación,
en este caso para la suma se ingresan varios valores arbitrarios para ver distintos casos.

Descripción de resultados esperados: se espera un funcionamiento igual de una operación de suma común.
*/

module Sumador_tb;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;

	// Outputs
	wire [31:0] S;

	// Instantiate the Unit Under Test (UUT)
	Sumador uut (
		.A(A), 
		.B(B), 
		.S(S)
	);

	initial begin
		// Initialize Inputs
		//Suma normal
		A = 32'd100;
		B = 32'd20;

		// Wait 100 ns for global reset to finish
		#25;
      
		// Add stimulus here
		//Suma con negativos
		A = 32'hFFFFFFE7;
		B = 32'd20;
		#25;
		
		//Resta de dos números iguales
		A = 32'd80;
		B = 32'hFFFFFFE7;
		#25;
		
		

	end
      
endmodule

