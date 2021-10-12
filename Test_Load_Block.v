`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:29:57 10/12/2021
// Design Name:   Load_Block
// Module Name:   C:/Users/Jose Pablo/Documents/6to Semestre/Microprocesadores y Microcontroladores/Proyecto/Github/Proyecto_Microprocesadores/Test_Load_Block.v
// Project Name:  Proyecto_Microprocesadores_V1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Load_Block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Load_Block;

	// Inputs
	reg [31:0] Load_Memory;
	reg Load_Select;
	reg [1:0] Offset;

	// Outputs
	wire [31:0] Load_data;

	// Instantiate the Unit Under Test (UUT)
	Load_Block uut (
		.Load_Memory(Load_Memory), 
		.Load_Select(Load_Select), 
		.Offset(Offset), 
		.Load_data(Load_data)
	);

	initial begin
		// Initialize Inputs
		Load_Memory = 32'hA14BC5F3;
		Load_Select = 0;
		Offset = 2'b00;

		// Wait 100 ns for global reset to finish
		#100;
		
      Load_Select = 1;
		Offset = 2'b00;
		
		
		#100;      
		Offset = 2'b01;		
		#100;     
		Offset = 2'b10;
		#100;     
		Offset = 2'b11;
		#100;
	end
        



      
endmodule

