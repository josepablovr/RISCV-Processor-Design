`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:33:20 11/16/2021
// Design Name:   XOR
// Module Name:   D:/jcorv/Documents/One drive/OneDrive - Estudiantes ITCR/6 Semestre/Micros/Proyecto_ALU/Nueva_ALU/XOR_tb.v
// Project Name:  Nueva_ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: XOR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
Objetivo de la prueba: Probar el correcto funcionamiento de la operaci�n XOR ingresando
dos valores en A y B para ver como opera.

Est�mulos: la se�al de entrada corresponde a las entradas proporcionadas por la ALU (A y B) para la operaci�n,
en este caso para la XOR se ingresa un valor arbitrario.

Descripci�n de resultados esperados: se espera un funcionamiento igual de una compuerta XOR.
*/

module XOR_tb;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;

	// Outputs
	wire [31:0] R;

	// Instantiate the Unit Under Test (UUT)
	XOR uut (
		.A(A), 
		.B(B), 
		.R(R)
	);

	initial begin
		// Initialize Inputs
		A = 32'h0F0F00FF;
		B = 32'hF0FA00FF;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

