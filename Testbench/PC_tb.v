`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:05:51 10/22/2021
// Design Name:   PC
// Module Name:   C:/Users/Usuario/Documents/TEC/Semestre 8/Microprocesadores y Microcontroladores/Proyecto Final/Progras/StoreBlock/PC_tb.v
// Project Name:  StoreBlock
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
o Objetivo de la prueba: verificar que la señal de rst y los flancos del clk afectan como deben el sistema.
o Estímulos:

clk: señal de reloj
rst: señal de reset
PC_in: dato a almacenar durante el ciclo de reloj

o Descripción de resultados esperados: se espera que los datos no se almacenen durante flancos negativos y que la señal rst reinicié el FF y coloque su salida en cero.
*/

module PC_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] PC_in;
	
	// Outputs
	wire [31:0] PC_out;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.clk(clk), 
		.rst(rst), 
		.PC_in(PC_in),
		.PC_out(PC_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		PC_in = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
		
		PC_in = 632;
		//el dato se guarda
		#10
		PC_in = 14;
		//el dato no se guarda porque está en el flanco negativo
		rst = 1;
		//se reinicia el FF y la salida es cero
		rst = 0;
		PC_in = 37;
		//se reactiva el FF y se guarda el dato 37.
	end
	
		// Add stimulus here
		always #10 clk=~clk;
		always #50 PC_in=PC_in+32'd4; //cambio de instrucción
		



      
endmodule

