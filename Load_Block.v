`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:20:34 10/11/2021 
// Design Name: 
// Module Name:    Load_Block 
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
module Load_Block(
    input [31:0] Load_Memory,
    input Load_Select,
    input [1:0] Offset,
    output reg [31:0] Load_data
    );
	 	 
		 
	 reg [31:0] Load_Byte;
			 
	 always @(*)
      case (Offset)
         2'b00: Load_Byte = {24'h000000, Load_Memory[7:0]};
         2'b01: Load_Byte = {16'h0000, Load_Memory[15:8], 8'h00};
         2'b10: Load_Byte = {8'h00, Load_Memory[23:16], 16'h0000};
         2'b11: Load_Byte = {Load_Memory[31:24], 24'h000000};
      endcase
		
		 
		 
    always @(*)
       case (Load_Select)
          1'b0: Load_data = Load_Memory;
          1'b1: Load_data = Load_Byte;       
       endcase
					
endmodule
