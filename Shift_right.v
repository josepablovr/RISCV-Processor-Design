`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:40:20 10/19/2021 
// Design Name: 
// Module Name:    Shift_right 
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
module Shift_right(
    input signed [31:0] A, //dato de entrada
	 input [4:0] B,	//dato que define la cantidad de desplazamientos a la derecha
    output reg [31:0] out //salida
    );

//Hola, funciona
/* Por medio de un case se realiza el desplazamiento lógico a la derecha */
always @*
   case (B)
      5'b00000: out = A;
      5'b00001: out = A >>> 1;
      5'b00010: out = A >>> 2;
      5'b00011: out = A >>> 3;
      5'b00100: out = A >>> 4;
      5'b00101: out = A >>> 5;
      5'b00110: out = A >>> 6;
      5'b00111: out = A >>> 7;
      5'b01000: out = A >>> 8;
      5'b01001: out = A >>> 9;
      5'b01010: out = A >>> 10;
      5'b01011: out = A >>> 11;
      5'b01100: out = A >>> 12;
      5'b01101: out = A >>> 13;
      5'b01110: out = A >>> 14;
		5'b01111: out = A >>> 15;
		5'b10000: out = A >>> 16;
		5'b10001: out = A >>> 17;
		5'b10010: out = A >>> 18;
		5'b10011: out = A >>> 19;
		5'b10100: out = A >>> 20;
		5'b10101: out = A >>> 21;
		5'b10110: out = A >>> 22;
		5'b10111: out = A >>> 23;
		5'b11000: out = A >>> 24;
		5'b11001: out = A >>> 25;
		5'b11010: out = A >>> 26;
		5'b11011: out = A >>> 27;
		5'b11100: out = A >>> 28;
		5'b11101: out = A >>> 29;
		5'b11110: out = A >>> 30;
		default: out = A >>> 31;
	
	endcase

endmodule
