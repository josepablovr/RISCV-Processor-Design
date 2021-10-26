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

module MicroArquitectura_tb();

	// Inputs
	reg clk;
	reg rst;
	
	integer  i=0;
		
	//Outputs

	// Instantiate the Unit Under Test (UUT)
	MicroArquitectura uut (
		.clk(clk), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		#5 rst = 0;
		
		for (i = 0; i<250; i = i + 1) // Inicialización de Memoria de datos para dump
			begin
				MemDump[i] = 0;
			end
			for (i = 250; i<256; i = i + 1) 
				begin
					MemDump[i] = 0;
				end
	end
	
	reg [31:0] MemDump [255:0]; // Memoria de datos para dump
   integer  fd=0;
	
	always @(posedge clk)
	begin
		if (uut.Inst == 32'd0)
		begin 
				rst=1;
				$stop;
				
				for (i = 0; i<250; i = i + 1) // Memoria de datos
				begin
					force uut.Address = i*4;
					#10;
					MemDump[i] = uut.Read_data;
					#10;
				end
				
				for (i = 250; i<256; i = i + 1) // Memoria de datos
				begin
					force uut.Address = i*4;
					#10;
					MemDump[i] = uut.Read_data;
					#10;
				end
				
				fd = $fopen("C:/Users/Jose Pablo/Documents/6to Semestre/Microprocesadores y Microcontroladores/Proyecto/Dump.txt","w");
				$fwrite(fd, "Dirección valor(hex)\n","");
				#5;
				for (i = 0; i<250; i = i +1)
				begin
					$fwrite(fd, "%d - 0x%h\n", i, MemDump[i]);
					#5;
				end
				for (i = 250; i<256; i = i +1)
				begin
					$fwrite(fd, "%d - 0x%h\n", i, MemDump[i]);
					#5;
				end
				$fclose(fd);
				$stop;
		end
		
	end
	
	initial forever #5 clk = ~clk;

endmodule


 
