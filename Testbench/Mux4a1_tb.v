`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:46:35 10/21/2021
// Design Name:   Mux4a1
// Module Name:   C:/Users/Usuario/Documents/TEC/Semestre 8/Microprocesadores y Microcontroladores/Proyecto Final/Progras/StoreBlock/Mux4a1_tb.v
// Project Name:  StoreBlock
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux4a1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
Objetivo de la prueba: Comprobar el correcto funcionamiento de la MUX de 4 a 1, de manera que el seleccionador
de verdad indique la entrada correcta que debe de pasar.

Estímulos: la señal de entrada corresponde a cuatro valores diferentes agregados a las entradas A, B, C y D y se varía
al seleccionador para poder ver las cuatro opciones. 

Descripción de resultados esperados: se esperan ver en la señal de seleccionador '00' a la entrada A y lo que contenga
y lo mismo para los otros valores del seleccionador y de entradas.
*/

module Mux4a1_tb;

	// Inputs
	reg [31:0] data_A;
	reg [31:0] data_B;
	reg [31:0] data_C;
	reg [31:0] data_D;
	reg [1:0] sel;

	// Outputs
	wire [31:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	Mux4a1 uut (
		.data_A(data_A), 
		.data_B(data_B), 
		.data_C(data_C), 
		.data_D(data_D), 
		.sel(sel), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		data_A = 32'hFFFFFFFF;
		data_B = 32'hAAAAAAAA;
		data_C = 32'hBBBBBBBB;
		data_D = 32'hCCCCCCCC;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
		sel = 1;
		#100;
		sel = 10;
		#100;
		sel = 11;
        
		// Add stimulus here

	end
      
endmodule

