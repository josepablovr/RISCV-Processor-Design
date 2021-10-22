`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:41:29 10/21/2021 
// Design Name: 
// Module Name:    comparador 
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
module comparador(
    input [31:0] RD1,
    input [31:0] RD2,
    output reg BrRes
    );
	 always @(*)
      if (RD1 != RD2)
         BrRes <= 1'b1;
      else
         BrRes <= 1'b0;
endmodule

