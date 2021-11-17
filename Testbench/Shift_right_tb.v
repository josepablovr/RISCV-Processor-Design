`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:14:17 11/16/2021
// Design Name:   Shift_right
// Module Name:   D:/jcorv/Documents/One drive/OneDrive - Estudiantes ITCR/6 Semestre/Micros/Proyecto_ALU/Nueva_ALU/Shift_right_tb.v
// Project Name:  Nueva_ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Shift_right
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
Objetivo de la prueba: Probar el correcto funcionamiento de la operación de shift aritmético a la derecha, ingresando
dos valores en A y B para ver como opera su desplazamiento de bits.

Estímulos: la señal de entrada corresponde a las entradas proporcionadas por la ALU (A y B) para la operación,
en este caso para el shift aritmético a la derecha se ingresa un valor en A y uno en B que va a representar la cantidad
de bits a correr a la derecha.

Descripción de resultados esperados: se espera un funcionamiento igual de una operación de shift aritmético a la derecha 
una n cantidad de bits.
*/

module Shift_right_tb;

	// Inputs
	reg [31:0] A;
	reg [4:0] B;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	Shift_right uut (
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

