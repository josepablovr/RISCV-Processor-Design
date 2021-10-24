`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:41:29 10/21/2021 
// Design Name: 
// Module Name:    branch_comp 
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
Funcionalidad: Comparar dos registros e indicar si no son iguales
Entradas: 
RD1: registro 1
RD2: registro 2

Salida:
BrRes: Indica si no son iguales 

Razón de uso:
Se desarrolló este comparador fuera de la ALU con el fin de ejecutar la suma
de PC + imm de manera parela
*/
//////////////////////////////////////////////////////////////////////////////////
module branch_comp(
    input [31:0] RD1,
    input [31:0] RD2,
    output reg BrRes
    );
	 
	 //Se determina si el registro 1 no es igual al registro 2
	 always @(*)
      if (RD1 != RD2)
         BrRes <= 1'b1; //BrRes se establece en 1 si no iguales
      else
         BrRes <= 1'b0; ////BrRes se establece en 0 si iguales
endmodule
