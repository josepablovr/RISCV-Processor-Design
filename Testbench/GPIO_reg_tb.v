`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:52:43 10/23/2021
// Design Name:   GPIO_reg
// Module Name:   C:/ProyectosVerilog/Proyecto_Micros/GPIO_reg_tb.v
// Project Name:  Proyecto_Micros
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: GPIO_reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
- Objetivo de la prueba: verificar el correcto funcionamiento del registro de salida del GPIO

- Est�mulos: se modifica constantemente el dato de entrada y se activan las se�ales de Enable y Reset
				 en ciertos instantes de la simulaci�n para observar el comportamiento

- Descripci�n de resultados esperados: se espera que el registro cargue el dato de entrada cuando se active
													la se�al de enable y tambi�n que se reinicie cuando el reset se active
*/

module GPIO_reg_tb;

	// Inputs
	reg [31:0] in;
	reg En;
	reg Rst;
	reg clk;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	GPIO_reg uut (
		.in(in), 
		.En(En), 
		.Rst(Rst), 
		.clk(clk), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		En = 0;
		Rst = 0;
		clk = 0;
	end
	
	//control del reloj
	always #5 clk = ~clk;
	
	//variaci�n del dato de entrada
	always #10 in = in + 1;
	
	//Activaci�n/desactivaci�n del enable
	always begin
		#30 En = 1'b1;
		#10 En = 1'b0;
	end
	
	//control de la se�al de reset
	always begin
		#200 Rst = 1'b1;
		#10  Rst = 1'b0;
	end
      
endmodule

