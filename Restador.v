`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:49 10/19/2021 
// Design Name: 
// Module Name:    Restador 
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
module Restador(
    
	 input signed [31:0] A, //Operador 1 de la resta, registro 1
	 input signed [31:0] B, //Operador 2 de la resta, registro 2
	 output [31:0] R //Resultado de la operación
    );
	 
	 reg signed [32:0] Res; 
	 
	 always @*
		Res <= A - B;
		
	 assign R = Res[31:0];

endmodule
