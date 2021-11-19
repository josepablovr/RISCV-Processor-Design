`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:35:16 10/23/2021
// Design Name:   GPIO_control
// Module Name:   C:/ProyectosVerilog/Proyecto_Micros/GPIO_control_tb.v
// Project Name:  Proyecto_Micros
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: GPIO_control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
- Objetivo de la prueba: verificar el correcto funcionamiento del m�dulo controlador del GPIO

- Est�mulos: se modifican peri�dicamente las se�ales de entrada para observar el comportamiento

- Descripci�n de resultados esperados: se espera que la salida GPIO_W se coloque en alto cuando
													ALU_out == 0xABCD y MemW == 1
*/

module GPIO_control_tb;

	// Inputs
	reg MemW;
	reg [31:0] ALU_out;

	// Outputs
	wire GPIO_W;

	// Instantiate the Unit Under Test (UUT)
	GPIO_control uut (
		.MemW(MemW), 
		.ALU_out(ALU_out), 
		.GPIO_W(GPIO_W)
	);

	initial begin
		// Initialize Inputs
		MemW = 0;
		ALU_out = 32'h0000ABC0;
	end
	
	//se cambia peri�dicamente la se�al MemW
	always #30 MemW = ~MemW;
   
	//se incrementa peri�dicamente el valor de ALU_out
	always #10 ALU_out[3:0] = ALU_out[3:0] + 1;
	
endmodule

