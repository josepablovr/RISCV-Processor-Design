`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:01:57 10/21/2021
// Design Name:   Extensor
// Module Name:   C:/ProyectosVerilog/Proyecto_Micros/Extensor_tb.v
// Project Name:  Proyecto_Micros
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Extensor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Extensor_tb;

	// Inputs
	reg [1:0] ImmSel;
	reg [31:7] inst;

	// Outputs
	wire [31:0] ImmOut;
	wire [31:0] Imm_U;

	// Instantiate the Unit Under Test (UUT)
	Extensor uut (
		.ImmSel(ImmSel), 
		.inst(inst), 
		.ImmOut(ImmOut),
		.Imm_U(Imm_U)
	);

	initial begin
		// Initialize Inputs
		ImmSel = 0;
		inst = 0;
	end
      
	always #10 ImmSel[0] = ~ImmSel[0];
	always #20 ImmSel[1] = ~ImmSel[1];
	
	initial begin
		#40 inst = 25'b1011001110001111000011111;
		#40 inst = 25'b0110001110000111100000111;
		#40 inst = 25'b1011001110001111000011111;
		#40 inst = 25'b0110001110000111100000111;
		#40 $finish;
	end
		
endmodule

