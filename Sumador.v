`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:24:04 10/17/2021 
// Design Name: 
// Module Name:    Sumador 
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
module Sumador(A, B, S);
	 input signed [31:0] A; //Registro 1 de la suma
	 input signed [31:0] B; //Registro 2 o Inmediato de la suma 
	 output reg signed [31:0] S;
	 
	 always @*
		S <= A + B;

endmodule

