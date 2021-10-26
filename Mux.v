`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer student: Gabriel Fuentes 
// 
// Create Date:    16:42:10 10/10/2021 
// Design Name: 
// Module Name:    Mux 
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

module Mux(offset, imm_byte, Mem, data_out);
	input [1:0] offset;	
	input [31:0] Mem;
	input [7:0] imm_byte;
	output reg [31:0] data_out;
	
	always @(*)
			case (offset)
				2'd0: data_out = {Mem[31:8], imm_byte[7:0]};
				2'd1: data_out = {Mem[31:16], imm_byte[7:0], Mem[7:0]};
				2'd2: data_out = {Mem[31:24], imm_byte[7:0], Mem[15:0]};
				2'd3: data_out = {imm_byte[7:0], Mem[23:0]};				
				default: data_out = {Mem[31:8], imm_byte[7:0]};
			endcase			
endmodule