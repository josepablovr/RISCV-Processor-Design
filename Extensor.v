`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:00:03 10/21/2021 
// Design Name: 
// Module Name:    Extensor 
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
module Extensor(
	input [1:0] ImmSel,
	input [31:7] inst,
	output reg [31:0] ImmOut,
	output [31:0] Imm_U
    );
	
	wire [19:0] signo;
	assign signo = {20{inst[31]}};
	
	always @(ImmSel, signo, inst)
		case (ImmSel)
			2'b00: ImmOut = {signo, inst[31:20]};													//formato I
			2'b01: ImmOut = {signo, inst[31:25], inst[11:7]};									//formato S
			2'b10: ImmOut = {signo, inst[7], inst[30:25], inst[11:8], 1'b0};				//formato B
			2'b11: ImmOut = {signo[11:0], inst[19:12], inst[20], inst[30:21], 1'b0};	//formato J
		endcase

	assign Imm_U = {inst[31:12], 12'h000}; 	//salida individual para el inmediato de formato U

endmodule
