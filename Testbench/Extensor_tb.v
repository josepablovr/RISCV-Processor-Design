`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:01:57 10/21/2021
// Design Name:   Extensor
// Module Name:   C:/ProyectosVerilog/Proyecto_Micros/Extensor_tb.v
// Project Name:  Proyecto_Micros
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Extensor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
- Objetivo de la prueba: verificar el correcto funcionamiento del módulo Extensor

- Estímulos: se modifica periódicamente el selector y los bits [31:7] de la instrucción para
				 probar la decodificación de cada formato.

- Descripción de resultados esperados: Se esperan las siguientes salidas según las entradas indicadas:
	
	Para la cadena de bits #1: inst[31:7] = 25'b1011001110001111000011111
		Formato I (ImmSel = 00):	ImmOut = 32'hFFFFFB38
		Formato J (ImmSel = 01):	ImmOut = 32'hFFFF0338
		Formato B (ImmSel = 10):	ImmOut = 32'hFFFFFB3E
		Formato S (ImmSel = 11):	ImmOut = 32'hFFFFFB3F
		Formato U (ImmSel = XX):	Imm_U  = 32'hB38F0000
		
	Para la cadena de bits #2: inst[31:7] = 25'b0110001110000111100000111
		Formato I (ImmSel = 00):	ImmOut = 32'h00000638
		Formato J (ImmSel = 01):	ImmOut = 32'h00078638
		Formato B (ImmSel = 10):	ImmOut = 32'h00000E26
		Formato S (ImmSel = 11):	ImmOut = 32'h00000627
		Formato U (ImmSel = XX):	Imm_U  = 32'h63878000
*/

module Extensor_tb;

	// Inputs
	reg [1:0] ImmSel;
	reg [31:7] inst;

	// Outputs
	wire [31:0] ImmOut;
	wire [31:0] Imm_U;

	// Instantiate the Unit Under Test (UUT)
	Extensor uut (
		.ImmSel(ImmSel), 
		.inst(inst), 
		.ImmOut(ImmOut),
		.Imm_U(Imm_U)
	);

	initial begin
		// Initialize Inputs
		ImmSel = 0;
		inst = 0;
	end
    
	//Variación del selector
	always #10 ImmSel[0] = ~ImmSel[0];
	always #20 ImmSel[1] = ~ImmSel[1];
	
	//Se prueban las decodificaciones con 2 cadenas de bits distintas
	initial begin
		#40 inst = 25'b1011001110001111000011111;	//cadena 1
		#40 inst = 25'b0110001110000111100000111; //cadena 2
		#40 inst = 25'b1011001110001111000011111;	//cadena 1
		#40 inst = 25'b0110001110000111100000111; //cadena 2
		#40 $stop;
	end
		
endmodule

