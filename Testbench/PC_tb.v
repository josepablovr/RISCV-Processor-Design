`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:05:51 10/22/2021
// Design Name:   PC
// Module Name:   C:/Users/Usuario/Documents/TEC/Semestre 8/Microprocesadores y Microcontroladores/Proyecto Final/Progras/StoreBlock/PC_tb.v
// Project Name:  StoreBlock
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PC_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] PC_in;
	
	// Outputs
	wire [31:0] PC_out;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.clk(clk), 
		.rst(rst), 
		.PC_in(PC_in),
		.PC_out(PC_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		PC_in = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
	end
	
		// Add stimulus here
		always #10 clk=~clk;
		always #50 PC_in=PC_in+32'd4;
		



      
endmodule

