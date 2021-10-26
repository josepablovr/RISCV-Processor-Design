`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:09:36 10/21/2021 
// Design Name: 
// Module Name:    RegFile 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

/*
Funcionalidad: memoria donde se leen y escriben valores en los registros

Entradas: 

A1: contiene la dirección a acceder del registro 1
A2: contiene la dirección a acceder del registro 2
A3: contiene la dirección a acceder del registro a escribir
WD3: contiene el valor a escribir en A3
RegWEn: indica si se debe escribir en A3
clock: señal de reloj
Reset: reinicia los registros

Salidas:
RD1: valor del registro en la dirección de A1
RD2: valor del registro en la dirección de A2

Razón de uso:
El módulo se introdujo para acceder a los registros de memoria y poder trabajar con ellos

*/

module RegFile(A1, A2, A3, WD3, RegWEn, clock, Reset, RD1, RD2
    );
	 
	input [4:0] A1, A2, A3;
	input [31:0] WD3;
	input RegWEn, clock, Reset;
	output [31:0] RD1, RD2; 

	reg [31:0] RegMem [31:0]; //memoria de registros (array de 32 registros, cada uno de 32 bits)
	 
	integer i; //entero de 32 bits
	initial begin										//inicialización de la memoria
		for (i=0; i <= 31; i=i+1) begin	
			RegMem[i] = 0;
		end
		i = 0;
	end
	
	always@(posedge clock)
	begin
		if (Reset)
		begin
			for (i = 0; i<32; i =i+1) // Reinicia el valor de los registros
			begin
				RegMem[i] = 0;
			end
		end
		
		else
		begin
			if (RegWEn) // Escribir en registro
			begin
				if(A3 != 0) // El registro cero no se modifica
				begin
					RegMem[A3] = WD3;
				end
			end 
		end 
	end
	
	//asignación de los valores de memoria a las salidas
	assign RD1 = RegMem[A1];
	assign RD2 = RegMem[A2];

endmodule
