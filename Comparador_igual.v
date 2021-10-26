`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:14:18 10/23/2021 
// Design Name: 
// Module Name:    Comparador_igual 
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
module Comparador_igual(
	input [31:0] A,
	input [31:0] B,
	output igual
    );

	assign igual = (A == B);

endmodule
