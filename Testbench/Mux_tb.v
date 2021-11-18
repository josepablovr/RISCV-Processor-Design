`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:16:04 10/10/2021
// Design Name:   Mux
// Module Name:   C:/Users/Usuario/Documents/TEC/Semestre 8/Microprocesadores y Microcontroladores/Proyecto Final/Progras/StoreBlock/Mux_tb.v
// Project Name:  StoreBlock
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
Objetivo de la prueba: Probar el correcto funcionamiento de la MUX del Store Block, con esta se busca observar
que las distintas configuraciones de bits creadas se cumplan.

Estímulos: Las señales de entrada deberían de corresponder a las provenientes del offset y la memoria, para esta 
prueba se usan señales arbitrarias para ver el funcionamiento general, se indica un data_memory y el offset (sel) para
poder ver cada uno de los cuatro casos del MUX.

Descripción de resultados esperados: se espera poder observar las dintintas entradas (cuatro) del MUX, cada una va a tener un
orden y acomodo de los bits diferentes. 
*/

module Mux_tb;

	// Inputs
	reg [1:0] sel;
	reg [31:0] data_memory;
	reg [7:0] data_byte;

	// Outputs
	wire [31:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	Mux uut (
		.sel(sel), 
		.data_memory(data_memory), 
		.data_byte(data_byte), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		sel = 0;
		data_memory = 0;
		data_byte = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//data_memory = 32'hFFFFFFFF;
		
		#100 sel = 0;
		
		#100 sel = 1;
		
		#100 sel = 10;
				
		#100 sel = 11;
	end
      
endmodule

