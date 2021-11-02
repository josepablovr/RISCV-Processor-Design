`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:25:05 10/22/2021
// Design Name:   RegFile
// Module Name:   C:/Users/CARLOS ELIZONDO/Desktop/TEC/Semestre8/Micros/Proyecto/VerilogMicro/RegFile_tb.v
// Project Name:  VerilogMicro
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
/*
o Objetivo de la prueba: comprobar que la memoria de registros concuerda con sus entradas y salidas y la señal de enable

o Estímulos: recibe los valores de registros para operaciones principales, así como el registro destino, también el valor
que se desee escribir en el registro destino y un enable para permitir dicha escritura.

o Descripción de resultados esperados: se espera que el bloque coloque sus salidas RD1 y RD2 de acuerdo con los valores
recibidos por la instrucción, además que logre identificar el registro destino donde se desea escribir y escriba un valor
cargado dependiendo de la operación, siempre y cuando la señal de enable se lo permita.

*/
module RegFile_tb;

	// Inputs
	reg [4:0] A1;
	reg [4:0] A2;
	reg [4:0] A3;
	reg [31:0] WD3;
	reg RegWEn;
	reg clock;
	reg Reset;

	// Outputs
	wire [31:0] RD1;
	wire [31:0] RD2;

	// Instantiate the Unit Under Test (UUT)
	RegFile uut (
		.A1(A1), 
		.A2(A2), 
		.A3(A3), 
		.WD3(WD3), 
		.RegWEn(RegWEn), 
		.clock(clock), 
		.Reset(Reset), 
		.RD1(RD1), 
		.RD2(RD2)
	);

	initial begin
		// Initialize Inputs
		A1 = 0;
		A2 = 0;
		A3 = 0;
		WD3 = 0;
		RegWEn = 0;
		clock = 0;
		Reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		//se prueba que sin el enable de escritura no se escribe en memoria, además se prueba que RD2 coincida con A2
		RegWEn = 0;
		A2 = 17;
		A3 = 5;
		WD3 = 8;
		
		//se activa el enable para que se escriba en escritura y se prueba que RD1 coincide con A1
		#100
		RegWEn = 1;
		A1 = 23;
		A3 = 15;
		WD3 = 1984;
		#100;
		
		
		// Add stimulus here

end
      initial forever #25 clock = ~clock;
endmodule

