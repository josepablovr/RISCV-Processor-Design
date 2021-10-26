`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:34:29 10/20/2021 
// Design Name: 
// Module Name:    MUX_ALU 
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
module MUX_ALU(

	input [2:0] ALUSEL, //Seleccionador de la ALU de 3 bits
	input [31:0] AND, //Entrada para la AND
	input [31:0] OR, //Entrada para la OR
	input [31:0] RES, //Entrada para la resta
	input [31:0] SUM, //Entrada para la suma
	input [31:0] LLS, //Entrada para el desplazamiento a la izquierda
	input [31:0] ASR, //Entrada para el desplazamiento a la derecha
	output reg [31:0] ALUOut //Salida del MUX (ALU)
    );
	 
	// El seleccionador indica la operación, se hace con un case
   always @(ALUSEL, AND, OR, RES, SUM, LLS, ASR)
      case (ALUSEL)
			3'b000: ALUOut = AND;
         3'b001: ALUOut = OR;
         3'b010: ALUOut = RES;
         3'b011: ALUOut = SUM;
         3'b100: ALUOut = LLS;
         3'b101: ALUOut = ASR;
			
      endcase

endmodule
