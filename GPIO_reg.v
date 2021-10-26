`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:46:26 10/23/2021 
// Design Name: 
// Module Name:    GPIO_reg 
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
module GPIO_reg(in, En, Rst, clk, out);

	input [31:0] in;
	input En, Rst, clk;
	output reg [31:0] out = 0;
	
   always @(posedge clk or posedge Rst)
      if (Rst) begin
         out <= 32'd0;
      end else if (En) begin
         out <= in;
      end

endmodule
