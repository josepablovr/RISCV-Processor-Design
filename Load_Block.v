`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:20:34 10/11/2021 
// Design Name: 
// Module Name:    Load_Block 
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
/*
Funcionalidad: obtener el byte o la palabra a almacenar en los registros
Entrada: 
Load_Memory: palabra obtenida de la memoria
Load_Select: elige si se carga un byte o una palabra
Offset: elige el byte que se carga de Load_Memoru
Salida:
Load_data: 
Razón de uso:
El módulo se introdujo para poder guardar las instrucciones en una memoria y poder acceder a ellas
*/

//////////////////////////////////////////////////////////////////////////////////
module Load_Block(
    input [31:0] Load_Memory,
    input Load_Select,
    input [1:0] Offset,
    output reg [31:0] Load_data
    );
	 	 
		 
	 reg [31:0] Load_Byte;
			 
	 always @(*)
      case (Offset)
         2'b00: Load_Byte = {24'h000000, Load_Memory[7:0]};
         2'b01: Load_Byte = {24'h000000, Load_Memory[15:8]};
         2'b10: Load_Byte = {24'h000000, Load_Memory[23:16]};
         2'b11: Load_Byte = {24'h000000,Load_Memory[31:24]};
      endcase
		
	
		 
    always @(*)
       case (Load_Select)
          1'b0: Load_data = Load_Memory;
          1'b1: Load_data = Load_Byte;       
       endcase
					
endmodule
