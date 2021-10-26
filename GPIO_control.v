`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:28:54 10/23/2021 
// Design Name: 
// Module Name:    GPIO_control 
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
module GPIO_control(
	input MemW,
	input [31:0] ALU_out,
	output GPIO_W
    );

	wire igual;
	
	Comparador_igual Comparador (
    .A(ALU_out), 
    .B(32'h0000ABCD), 
    .igual(igual)
    );
	
	assign GPIO_W = (MemW & igual);

endmodule
