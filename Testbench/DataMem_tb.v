`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:41:06 10/22/2021
// Design Name:   DataMem
// Module Name:   C:/Users/CARLOS ELIZONDO/Desktop/TEC/Semestre8/Micros/Proyecto/VerilogMicro/DataMem_tb.v
// Project Name:  VerilogMicro
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataMem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
Objetivo de la prueba: probar la lectura y escritura de palabras completas en memoria.

o Estímulos: se ingresa la dirección de memoria que se quiere leer o bien en la que se quiere escribir, además
se coloca el valor de memoria a escribir y un señal de enable que indica si se quiere escribir o no, dicha señal ya está
condicionada para que en caso de que se introduzca la dirección de memoria ABCD, se escriba en un GPIO y no en memoria.

o Descripción de resultados esperados: se accede a la dirección correctamente y se escriben o leen los valores respectivos.
*/

module DataMem_tb;

	// Inputs
	reg [31:0] Address;
	reg [31:0] Wdata;
	reg MemRW;
	reg clock;
 
	// Outputs
	wire [31:0] Rdata;

	// Instantiate the Unit Under Test (UUT)
	DataMem uut (
		.Address(Address), 
		.Wdata(Wdata), 
		.MemRW(MemRW), 
		.clock(clock), 
		.Rdata(Rdata)
	);

	initial begin
		// Initialize Inputs
		Address = 0;
		Wdata = 0;
		MemRW = 0;
		clock = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		//Add stimulus here
		//se modifica la inicializazión de la memoria
		Address = 12;			//se accede a la posición de memoria 12, es decir en la palabra 3
		Wdata = 0;				//no hay valor a escribir en memoria
		MemRW = 0;				//no se escribe en memoria
		#100;
		
		Address = 36;			//se accede a la posición de memoria 36, es decir en la palabra 9
		Wdata = 1114;			//valor a escribir en memoria
		MemRW = 1;				//se escribe en memoria
		#100;
		
		//$stop 
	end
	
   initial forever #50 clock = ~clock; //valor que supera el máximo tiempo de propagación
	
endmodule

