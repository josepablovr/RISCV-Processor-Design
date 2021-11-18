`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:02:42 10/10/2021
// Design Name:   StoreBlock
// Module Name:   C:/Users/Usuario/Documents/TEC/Semestre 8/Microprocesadores y Microcontroladores/Proyecto Final/Progras/StoreBlock/StoreBlock_tb.v
// Project Name:  StoreBlock
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: StoreBlock
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
/*
o Objetivo de la prueba: comprobar que las señales selectoras de los multiplexores funcionan correctamente.


o Estímulos: recibe mediante 'Mem' el valor leído en memoria, con la señal 'store_word' se identifica si la instrucción es un SW o un SB,
'imm_byte' corresponde al primer byte del valor leído en memoria, mientras que las señales 'offset' y 'store_select' funcionan como selectoras
en dos multiplexores distintos.


o Descripción de resultados esperados: se espera que dependiendo de SW o SB se reacomode el nuevo valor a escribir con los datos precargados
de memoria.
*/

module StoreBlock_tb;

	// Inputs
	reg [31:0] Mem;
	reg [7:0] imm_byte;
	reg [1:0] offset;
	reg store_select;
	reg [31:0] store_word;

	// Outputs
	wire [31:0] store_out;

	// Instantiate the Unit Under Test (UUT)
	StoreBlock uut (
		.Mem(Mem), 
		.imm_byte(imm_byte), 
		.offset(offset), 
		.store_select(store_select), 
		.store_word(store_word), 
		.store_out(store_out)
	);

	initial begin
		// Initialize Inputs
		Mem = 0;
		imm_byte = 0;
		offset = 0;
		store_select = 1;
		store_word = 0;
		offset = 0;
		// Wait 100 ns for global reset to finish
		#100;
		Mem = 32'hFFFFFFFF;
		imm_byte = 8'hAA;
		store_word = 32'hCC;
		offset = 00;
		store_select = 0;
		# 50
		offset = 11;
		store_select = 1;
		# 50
		offset = 10;
		store_select = 0;
		# 50
		offset = 01;
		store_select = 1;
		

		// Add stimulus here

	end
      
endmodule

