`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:19:14 10/10/2021
// Design Name:   Mux2a1
// Module Name:   C:/Users/Usuario/Documents/TEC/Semestre 8/Microprocesadores y Microcontroladores/Proyecto Final/Progras/StoreBlock/Mux2a1_tb.v
// Project Name:  StoreBlock
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux2a1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
Objetivo de la prueba: Comprobar el correcto funcionamiento de la MUX de 2 a 1, de manera que el seleccionador
de verdad indique la entrada correcta que debe de pasar.

Estímulos: la señal de entrada corresponde a dos valores diferentes agregados a las entradas A y B, y se varia
al seleccionador para poder ver las dos opciones. 

Descripción de resultados esperados: se esperan ver en la señal de seleccionador '0' a la entrada A y lo que contenga
y lo mismo para los otros valores del seleccionador.
*/

module Mux2a1_tb;

	// Inputs
	reg sel;
	reg [31:0] data_A;
	reg [31:0] data_B;

	// Outputs
	wire [31:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	Mux2a1 uut (
		.sel(sel), 
		.data_A(data_A), 
		.data_B(data_B), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		sel = 0;
		data_A = 32'hFFFFFFFF;
		data_B = 32'hAAAAAAAA;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

		#50 sel = 0;
		#50 sel = 1;
	end
      
endmodule

