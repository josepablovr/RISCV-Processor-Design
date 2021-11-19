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
Entradas: 
Read_data: palabra obtenida de la memoria
Load_Select: elige si se carga un byte o una palabra
Offset: elige el byte que se carga de Read_data
Salidas:
Load_data: La palabra o byte que se almacenará en el registro
Razón de uso:
El módulo se introdujo con el fin de poder elegir si cargar la palabra leída o solo un
byte de ella, en uno de los resgistros
*/

//////////////////////////////////////////////////////////////////////////////////
module Load_Block(
    input [31:0] Read_data,
    input Load_Select,
    input [1:0] Offset,
    output reg [31:0] Load_data
    );
	 	 
	 //Variable intermedia para almacenar el Byte seleccionado
	 reg [31:0] Load_Byte;
	
	 //Mux para elegir el byte segun el offset
	 //Se concatena el byte seleccionado con 24 ceros
	 always @(*)
      case (Offset)
         2'b00: Load_Byte = {24'h000000, Read_data[7:0]};
         2'b01: Load_Byte = {24'h000000, Read_data[15:8]};
         2'b10: Load_Byte = {24'h000000, Read_data[23:16]};
         2'b11: Load_Byte = {24'h000000,Read_data[31:24]};
      endcase
		
	
	 //Mux para seleccionar si se carga el byte o la palabra 	 
    always @(*)
       case (Load_Select) //Load_Select determina el dato a cargar
          1'b0: Load_data = Read_data;
          1'b1: Load_data = Load_Byte;       
       endcase
					
endmodule
