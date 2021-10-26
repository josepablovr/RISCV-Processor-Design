`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:35:16 10/23/2021
// Design Name:   GPIO_control
// Module Name:   C:/ProyectosVerilog/Proyecto_Micros/GPIO_control_tb.v
// Project Name:  Proyecto_Micros
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: GPIO_control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module GPIO_control_tb;

	// Inputs
	reg MemW;
	reg [31:0] ALU_out;

	// Outputs
	wire GPIO_W;

	// Instantiate the Unit Under Test (UUT)
	GPIO_control uut (
		.MemW(MemW), 
		.ALU_out(ALU_out), 
		.GPIO_W(GPIO_W)
	);

	initial begin
		// Initialize Inputs
		MemW = 0;
		ALU_out = 32'h0000ABC0;
	end
	
	always #30 MemW = ~MemW;
      
	always #10 ALU_out[3:0] = ALU_out[3:0] + 1;
	
endmodule

