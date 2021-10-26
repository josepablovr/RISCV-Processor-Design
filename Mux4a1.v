`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:37:11 10/21/2021 
// Design Name: 
// Module Name:    Mux4a1 
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
module Mux4a1(data_A, data_B, data_C, data_D, sel, data_out);
	input [1:0] sel;	
	input [31:0] data_A;
	input [31:0] data_B;
	input [31:0] data_C;
	input [31:0] data_D;
	output reg [31:0] data_out;
	
	always @(*)
			case (sel)
				2'd0: data_out = data_A;
				2'd1: data_out = data_B;
				2'd2: data_out = data_C;
				2'd3: data_out = data_D;				
				default: data_out = data_A;
			endcase

endmodule
