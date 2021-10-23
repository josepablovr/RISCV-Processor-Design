`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:54:49 10/23/2021
// Design Name:   Control_Unit
// Module Name:   C:/Users/Jose Pablo/Documents/6to Semestre/Microprocesadores y Microcontroladores/Proyecto/Github/Proyecto_Microprocesadores/Test_Control_Unit.v
// Project Name:  Proyecto_Microprocesadores_V1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_Control_Unit;

	// Inputs
	reg [5:0] opcode;
	reg funct7;
	reg [2:0] funct3;
	reg BrRes;

	// Outputs
	wire PCSel;
	wire [2:0] ImmSel;
	wire RegWEn;
	wire Bsel;
	wire Asel;
	wire [2:0] ALUSel;
	wire MemW;
	wire [1:0] WBSel;
	wire Store_Select;
	wire Load_Select;

	// Instantiate the Unit Under Test (UUT)
	Control_Unit uut (
		.opcode(opcode), 
		.funct7(funct7), 
		.funct3(funct3), 
		.BrRes(BrRes), 
		.PCSel(PCSel), 
		.ImmSel(ImmSel), 
		.RegWEn(RegWEn), 
		.Bsel(Bsel), 
		.Asel(Asel), 
		.ALUSel(ALUSel), 
		.MemW(MemW), 
		.WBSel(WBSel), 
		.Store_Select(Store_Select), 
		.Load_Select(Load_Select)
	);

	initial begin
		// Initialize Inputs
		opcode = 6'b000000;
		funct7 = 1'b0;
		funct3 = 3'b000;
		BrRes = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		//add
		opcode = 6'b011001;
		funct7 = 1'b0;
		funct3 = 000;
		#100;
		
		
		//sub
		opcode = 6'b011001;
		funct7 = 1'b1;
		funct3 = 3'b000;
		#100;
		
		//addi
		opcode = 6'b001001;		
		funct3 = 3'b000;
		#100;
		
		//andi
		opcode = 6'b001001;		
		funct3 = 3'b111;
		#100;
		
		//xori
		opcode = 6'b001001;		
		funct3 = 3'b100;
		#100;
		
		//srai
		opcode = 6'b001001;		
		funct3 = 3'b101;
		#100;
		
		//slli
		opcode = 6'b001001;		
		funct3 = 3'b001;
		#100;
		
		
		//lw
		opcode = 6'b000001;		
		funct3 = 3'b010;
		#100;
		
		//lbu
		opcode = 6'b000001;		
		funct3 = 3'b100;
		#100;
		
		//sw
		opcode = 6'b010001;		
		funct3 = 3'b010;
		#100;
		
		//sb
		opcode = 6'b010001;		
		funct3 = 3'b000;
		#100;
		
		//bne Sin salto
		opcode = 6'b110001;		
		funct3 = 3'b001;
		#100;
		
		//bne con salto
		BrRes = 1;
		#100;
		
		//lui
		opcode = 6'b011011;
		#100;
		
		//jal
		opcode = 6'b110111;
		#100;

	end
      
endmodule

