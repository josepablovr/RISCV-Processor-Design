`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:57:33 10/23/2021
// Design Name:   MicroArquitectura
// Module Name:   C:/Users/Usuario/Documents/TEC/Semestre 8/Microprocesadores y Microcontroladores/Proyecto Final/Main/MicroArquitectura_tb.v
// Project Name:  Main
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MicroArquitectura
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
/*
o Objetivo de la prueba: verificar que el método empleado para realizar el dump de memoria funciona correctamente.

o Estímulos: 
clk: señal de reloj
rst: señal de reset
Se instancia el módulo 'Microarquitectura' y se extraen algunas señales del mismo para escribir en el dump, tales como 'Address' y 'Read_data'.

o Descripción de resultados esperados: se espera que los valores guardados en el archivo Dump.txt coincidan con las instrucciones del ejercicio que se pruebe.
*/

module tb_full();

	// Inputs
	reg clk;
	reg rst;
	
	integer  i=0;
		
	//Outputs
	wire [31:0] WD3;
	wire [31:0] Mux_A;
	wire [31:0] Mux_B;
	wire [31:0] Store_out;
	wire [31:0] GPIO_out;
	wire [31:0] PC_out;

	// Instantiate the Unit Under Test (UUT)
	MicroArquitectura uut (
		.clk(clk), 
		.rst(rst),
		.WD3(WD3),
		.Mux_A(Mux_A),
		.Mux_B(Mux_B),
		.Store_out(Store_out),
		.GPIO_out(GPIO_out),
		.PC_out(PC_out)
	);
	//nótese que los ciclos for se dividen en dos partes debido a la limitante del software para tratar con tantas iteraciones
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		#5 rst = 0;
		
		for (i = 0; i < 248; i = i + 1) // Inicialización de Memoria de datos para dump
			begin
				MemDump[i] = 0;
			end
			for (i = 248; i < 256; i = i + 1) 
				begin
					MemDump[i] = 0;
				end
	end

	reg [31:0] MemDump [255:0]; // Memoria de datos para dump
   integer  fd = 0;
	
	always @(posedge clk)
	begin
		if (uut.Inst == 32'd0)
		begin 
				rst=1;
				$stop;
				
				for (i = 0; i < 248; i = i + 1) // Memoria de datos
				begin
					force uut.Address = i*4;
					#10;
					MemDump[i] = uut.Read_data;
					#10;
				end
				
				for (i = 248; i < 256; i = i + 1) // Memoria de datos
				begin
					force uut.Address = i*4;
					#10;
					MemDump[i] = uut.Read_data;
					#10;
				end
				
				fd = $fopen("C:/Users/Usuario/Documents/GitHub/Proyecto_Microprocesadores/Dump.txt","w");
				$fwrite(fd, "Dirección valor(hex)\n","");
				#5;
				for (i = 0; i < 248; i = i + 1)
				begin
					$fwrite(fd, "%d - 0x%h\n", i*4, MemDump[i]);
					#5;
				end
				for (i = 248; i < 256; i = i + 1)
				begin
					$fwrite(fd, "%d - 0x%h\n", i*4, MemDump[i]);
					#5;
				end
				$fclose(fd);
				$stop;
		end
		
	end
	
	initial forever #50 clk = ~clk;

endmodule


 
