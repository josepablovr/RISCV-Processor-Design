`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:19:34 10/23/2021
// Design Name:   Comparador_igual
// Module Name:   C:/ProyectosVerilog/Proyecto_Micros/Comparador_igual_tb.v
// Project Name:  Proyecto_Micros
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Comparador_igual
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Comparador_igual_tb;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;

	// Outputs
	wire igual;

	// Instantiate the Unit Under Test (UUT)
	Comparador_igual uut (
		.A(A), 
		.B(B), 
		.igual(igual)
	);

	initial begin
		// Initialize Inputs
		A = 32'h0000ABC0;
		B = 32'h0000ABCD;
		
		#200 $finish;
	end
      
	always #10 A = A + 1;
		
endmodule

