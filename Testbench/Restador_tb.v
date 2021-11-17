`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:45:20 11/16/2021
// Design Name:   Restador
// Module Name:   D:/jcorv/Documents/One drive/OneDrive - Estudiantes ITCR/6 Semestre/Micros/Proyecto_ALU/Nueva_ALU/Restador_tb.v
// Project Name:  Nueva_ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Restador
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
Objetivo de la prueba: Probar el correcto funcionamiento de la operación de resta, ingresando
dos valores en A y B para ver como opera, la resta es con signo.

Estímulos: la señal de entrada corresponde a las entradas proporcionadas por la ALU (A y B) para la operación,
en este caso para la resta se ingresan varios valores arbitrarios para ver distintos casos.

Descripción de resultados esperados: se espera un funcionamiento igual de una operación de resta común.
*/

module Restador_tb;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;

	// Outputs
	wire [31:0] R;

	// Instantiate the Unit Under Test (UUT)
	Restador uut (
		.A(A), 
		.B(B), 
		.R(R)
	);

	initial begin
		// Initialize Inputs
		//Resta normal 40-21
		A = 32'd40;
		B = 32'd21;

		// Wait 100 ns for global reset to finish
		#25;
      
		// Add stimulus here
		//Resta que espera 
		A = 32'd20;
		B = 32'd40;
		#25;
		
		//Resta de dos números iguales
		A = 32'd20;
		B = 32'd20;
		#25;
		
		//Resta de un número negativo
		A = 32'hFFFFFFE7;
		B = 32'd20;
		#25;
	end
      
endmodule

