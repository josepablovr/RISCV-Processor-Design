`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:07:29 10/22/2021
// Design Name:   InsMem
// Module Name:   C:/Users/CARLOS ELIZONDO/Desktop/TEC/Semestre8/Micros/Proyecto/VerilogMicro/InsMem_tb.v
// Project Name:  VerilogMicro
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InsMem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
Objetivo de la prueba: recorrer la memoria de instrucciones utilizando PC 
o Estímulos: la señal de entrada corresponde al seleccionador de instrucciones PC que varía en múltiplos de 4
o Descripción de resultados esperados: se espera que las instrucciones decodificadas coincidan con el código base en C   
*/

module InsMem_tb;

	// Inputs
	reg [31:0] PC;

	// Outputs
	wire [31:0] Inst;

	// Instantiate the Unit Under Test (UUT)
	InsMem uut (
		.PC(PC), 
		.Inst(Inst)
	);
	
	integer i = 0;
	initial begin
		// Initialize Inputs
		PC = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		for (i=1; i<64; i=i+1) begin		//se recorre la memoria de instrucciones
			PC = PC + 4;								//el avance es con PC+4
			#100;
		end
	
	end
      
endmodule

