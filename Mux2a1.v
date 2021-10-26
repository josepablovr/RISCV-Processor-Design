`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:03:21 10/10/2021 
// Design Name: 
// Module Name:    Mux2a1 
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
module Mux2a1(sel, data_A, data_B, data_out);
	input sel;	
	input [31:0] data_A;
	input [31:0] data_B;
	output reg [31:0] data_out;
	
	always @(*)
			case (sel)
				0: data_out = data_A;
				1: data_out = data_B;			
				default: data_out = data_A;
			endcase		

endmodule
