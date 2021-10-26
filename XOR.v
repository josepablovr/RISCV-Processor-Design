`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:47:44 10/18/2021 
// Design Name: 
// Module Name:    OR 
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
module XOR(
    input [31:0] A, //Registro 1 de la OR
    input [31:0] B, //Lectura de inmediato 
    output [31:0] R //Sálida con el resultado de la OR
    );
	 
	 assign R = A^B;  //Aplicación de la OR


endmodule
