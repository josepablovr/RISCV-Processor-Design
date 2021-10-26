`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:47:31 10/17/2021 
// Design Name: 
// Module Name:    AND 
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
module AND(
    input [31:0] A, //Entrada A de la AND
    input [31:0] B, //Entrada B de la AND
    output [31:0] R //Salida de la AND
    );
	 
	 assign R = A & B; //Operación de la AND

endmodule
