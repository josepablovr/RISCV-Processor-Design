`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:07:37 11/16/2021
// Design Name:   Shift_left
// Module Name:   D:/jcorv/Documents/One drive/OneDrive - Estudiantes ITCR/6 Semestre/Micros/Proyecto_ALU/Nueva_ALU/Shift_left_tb.v
// Project Name:  Nueva_ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Shift_left
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
Objetivo de la prueba: Probar el correcto funcionamiento de la operación de shift lógico a la izquierda, ingresando
dos valores en A y B para ver como opera.

Estímulos: la señal de entrada corresponde a las entradas proporcionadas por la ALU (A y B) para la operación,
en este caso para el shift lógico a la izquierda se ingresa un valor en A y uno en B que va a representar la cantidad
de bits a correr.

Descripción de resultados esperados: se espera un funcionamiento igual de una operación de shift lógico a la izquierda 
una n cantidad de bits.
*/

module Shift_left_tb;

	// Inputs
	reg [31:0] A;
	reg [4:0] B;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	Shift_left uut (
		.A(A), 
		.B(B), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		A = 32'hFFA05FF;
		B = 32'd10;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

