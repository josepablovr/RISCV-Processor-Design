`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:10:10 10/22/2021
// Design Name:   ALU
// Module Name:   D:/jcorv/Documents/One drive/OneDrive - Estudiantes ITCR/6 Semestre/Micros/Proyecto_ALU/ALU/ALU_tb.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
Objetivo de la prueba: Probar las distintas operaciones disponibles en la ALU como el AND, 
el Sumador, entre las otras, con distintos valores.

Estímulos: la señal de entrada corresponde al seleccionador de la ALU y las entradas de las ALU A y B

Descripción de resultados esperados: se espera que los resultados de las operaciones seleccionadas den el valor correcto
dependiendo de los valores ingresados.
*/

module ALU_tb;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [2:0] ALUSel;

	// Outputs
	wire [31:0] ALU_Output;
	wire [1:0] Offset;
	wire [31:0] Address;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.ALUSel(ALUSel), 
		.ALU_Output(ALU_Output), 
		.Offset(Offset), 
		.Address(Address)
	);

	initial begin
		// Initialize Inputs
		A = 32'h0000F0AF;
		B = 32'h0F0FF034;
		ALUSel = 3'b000;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//Pruebas realizadas usando distintos seleccionadores y datos de entradas
		//para ver el funcionamiento correcto de la ALU
		
		A = 32'h0000F0DF;
		B = 32'hF030F285;
		ALUSel = 3'b001;
		#100;
		
		A = 32'h000000FF;
		B = 32'h000000FF;
		ALUSel = 3'b010;
		#100;
		
		A = 32'h0000000A;
		B = 32'h00000005;
		ALUSel = 3'b010;
		#100;
		
		A = 32'h00000005;
		B = 32'h0000000A;
		ALUSel = 3'b010;
		#100;
		
		A = 32'd14;
		B = 32'd3;
		ALUSel = 3'b011;
		#100;
		
		A = 32'hF0000F2F;
		B = 32'd5;
		ALUSel = 3'b100;
		#100
		
		A = 32'hF0000F2F;
		B = 32'd5;
		ALUSel = 3'b101;
		#100;
		
	end
      
endmodule

