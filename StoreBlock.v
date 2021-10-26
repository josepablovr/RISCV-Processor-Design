`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:38:31 10/10/2021 
// Design Name: 
// Module Name:    StoreBlock 
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
module StoreBlock(Mem, imm_byte, offset, store_select, store_word, store_out);
	input [31:0] Mem;
	input [7:0] imm_byte;
	input [1:0] offset;
	input store_select;
	input [31:0] store_word;
	output [31:0] store_out;
	
wire [31:0] Mux_byte_out;

Mux Multiplexor_byte (
    .offset(offset), 
    .Mem(Mem), 
    .imm_byte(imm_byte), 
    .data_out(Mux_byte_out)
    );
	 
Mux2a1 Multiplexor_2a1 (
    .sel(store_select), 
    .data_A(Mux_byte_out), 
    .data_B(store_word), 
    .data_out(store_out)
    );

endmodule
