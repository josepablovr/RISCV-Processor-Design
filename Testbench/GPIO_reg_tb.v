`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:52:43 10/23/2021
// Design Name:   GPIO_reg
// Module Name:   C:/ProyectosVerilog/Proyecto_Micros/GPIO_reg_tb.v
// Project Name:  Proyecto_Micros
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: GPIO_reg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module GPIO_reg_tb;

	// Inputs
	reg [31:0] in;
	reg En;
	reg Rst;
	reg clk;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	GPIO_reg uut (
		.in(in), 
		.En(En), 
		.Rst(Rst), 
		.clk(clk), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		En = 0;
		Rst = 0;
		clk = 0;
	end
	
	always #5 clk = ~clk;
	
	always #10 in = in + 1;
	
	always begin
		#30 En = 1'b1;
		#10 En = 1'b0;
	end
	
	always begin
		#200 Rst = 1'b1;
		#10  Rst = 1'b0;
	end
      
endmodule

