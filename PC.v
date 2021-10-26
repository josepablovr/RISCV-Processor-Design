`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:59:58 10/21/2021 
// Design Name: 
// Module Name:    PC 
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
module PC(clk, rst, PC_in, PC_out);
	input clk;	
	input rst;	
	input [31:0] PC_in;
	output reg [31:0] PC_out=0;
	
   always @(posedge clk or posedge rst)
      if (rst)
         PC_out <= 1'b0;
		else
         PC_out <= PC_in;
endmodule
