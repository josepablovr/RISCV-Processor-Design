`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:21:51 11/16/2021
// Design Name:   MUX_ALU
// Module Name:   D:/jcorv/Documents/One drive/OneDrive - Estudiantes ITCR/6 Semestre/Micros/Proyecto_ALU/Nueva_ALU/MUX_ALU_tb.v
// Project Name:  Nueva_ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX_ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

/*
Objetivo de la prueba: Probar el correcto funcionamiento de la MUX perteneciente a la ALU.

Estímulos: la señal de entrada corresponde a las entradas proporcionadas por la ALU del seleccionador (ALUSEL), para 
obtener las distintas operaciones.

Descripción de resultados esperados: se esperan obtener las disntintas operaciones disponibles según el seleccionador, como 
las operaciones no están vinculas solo se va a observar el valor arbitrario que se le de.
*/

module MUX_ALU_tb;

	// Inputs
	reg [2:0] ALUSEL;
	reg [31:0] AND;
	reg [31:0] OR;
	reg [31:0] RES;
	reg [31:0] SUM;
	reg [31:0] LLS;
	reg [31:0] ASR;

	// Outputs
	wire [31:0] ALUOut;

	// Instantiate the Unit Under Test (UUT)
	MUX_ALU uut (
		.ALUSEL(ALUSEL), 
		.AND(AND), 
		.OR(OR), 
		.RES(RES), 
		.SUM(SUM), 
		.LLS(LLS), 
		.ASR(ASR), 
		.ALUOut(ALUOut)
	);

	initial begin
		// Initialize Inputs
		//Debe de arrojar solo la de la AND
		ALUSEL = 3'b000;
		AND = 32'd23;
		OR = 32'd1;
		RES = 32'd2;
		SUM = 32'd10;
		LLS = 32'd5;
		ASR = 32'd100;

		// Wait 100 ns for global reset to finish
		#25;
        
		// Add stimulus here
		//Debe de arrojar solo 1 de la OR
		ALUSEL = 3'b001;
		AND = 32'd23;
		OR = 32'd1;
		RES = 32'd2;
		SUM = 32'd10;
		LLS = 32'd5;
		ASR = 32'd100;
		#25;
		
		//Debe de arrojar solo 2 de la RES
		ALUSEL = 3'b010;
		AND = 32'd23;
		OR = 32'd1;
		RES = 32'd2;
		SUM = 32'd10;
		LLS = 32'd5;
		ASR = 32'd100;
		#25;
		
		//Debe de arrojar solo 10 de la SUM
		ALUSEL = 3'b011;
		AND = 32'd23;
		OR = 32'd1;
		RES = 32'd2;
		SUM = 32'd10;
		LLS = 32'd5;
		ASR = 32'd100;
		#25;
		
		//Debe de arrojar solo 5 de la LLS
		ALUSEL = 3'b100;
		AND = 32'd23;
		OR = 32'd1;
		RES = 32'd2;
		SUM = 32'd10;
		LLS = 32'd5;
		ASR = 32'd100;
		#25;
		
		//Debe de arrojar solo 100 de la ASR
		ALUSEL = 3'b101;
		AND = 32'd23;
		OR = 32'd1;
		RES = 32'd2;
		SUM = 32'd10;
		LLS = 32'd5;
		ASR = 32'd100;
		#25;
		
	end
      
endmodule

