`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:57:33 10/23/2021
// Design Name:   MicroArquitectura
// Module Name:   C:/Users/Usuario/Documents/TEC/Semestre 8/Microprocesadores y Microcontroladores/Proyecto Final/Main/MicroArquitectura_tb.v
// Project Name:  Main
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MicroArquitectura
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MicroArquitectura_tb();

	// Inputs
	reg clk;
	reg rst;
	
	integer  i=0;
		
	//Outputs
	wire [31:0] WD3;
	wire [31:0] Mux_A;
	wire [31:0] Mux_B;
	wire [31:0] Store_out;
	wire [31:0] GPIO_out;
	wire [31:0] PC_out;
	wire [31:0] ALU_out;
	wire [31:0] Read_data;

	// Instantiate the Unit Under Test (UUT)
	MicroArquitectura uut (
		.clk(clk), 
		.rst(rst),
		.WD3(WD3),
		.Mux_A(Mux_A),
		.Mux_B(Mux_B),
		.Store_out(Store_out),
		.GPIO_out(GPIO_out),
		.PC_out(PC_out),
		.ALU_out(ALU_out),
		.Read_data(Read_data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		#5 rst = 0;
end
	always #50 clk = ~clk;

endmodule


 
