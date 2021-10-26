`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:53 10/23/2021 
// Design Name: 
// Module Name:    MicroArquitectura 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MicroArquitectura(clk, rst);
// Entradas externas
input clk;
input rst;

//Salidas temporales

// Entradas y salidas alambradas
wire [31:0] ALU_out;
wire [31:0] PC_in;
wire [31:0] PC_out;
wire [31:0] PC_4;
wire [31:0] Inst;
wire [31:0] RD1;
wire [31:0] RD2;
wire [31:0] WD3;
wire [31:0] Imm_tipo_U;
wire [31:0] Mux_A;
wire [31:0] Mux_B;
wire [31:0] Imm_out;
wire [31:0] Address;
wire [31:0] Read_data;
wire [31:0] Store_out;
wire [31:0] Load_out;
wire [1:0] Offset;

// Salidas de la Unidad de Control (CU)
wire PCsel;
wire RegWEn;
wire [1:0] WBsel;
wire Asel;
wire Bsel;
wire [1:0] ImmSel;
wire [2:0] ALUSel;
wire StoreSel;
wire LoadSel;
wire MemW;

// Entradas de la Unidad de Control (CU)
wire BrRes;

// Bloques
PC PC (
    .clk(clk), 
    .rst(rst), 
    .PC_in(PC_in), 
    .PC_out(PC_out)
    );
	 
Sumador SUMADOR_PC (
    .A(PC_out), 
    .B(32'd4), 
    .S(PC_4)
    );
	 
Mux2a1 MUX_PC (
    .sel(PCsel), 
    .data_A(PC_4), 
    .data_B(ALU_out), 
    .data_out(PC_in)
    );
	 
InsMem INSTRUCTION_MEMORY (
    .PC(PC_out), 
    .Inst(Inst)
    );

RegFile REGISTER_FILE (
    .A1(Inst[19:15]), 
    .A2(Inst[24:20]), 
    .A3(Inst[11:7]), 
    .WD3(WD3), 
    .RegWEn(RegWEn), 
    .clock(clk), 
    .Reset(rst), 
    .RD1(RD1), 
    .RD2(RD2)
    );

Mux4a1 MUX_WD3 (
    .data_A(Load_out), 
    .data_B(ALU_out), 
    .data_C(PC_4), 
    .data_D(Imm_tipo_U), 
    .sel(WBsel), 
    .data_out(WD3)
    );
	 
COMPARADOR BRANCH_COMPARE (
    .RD1(RD1), 
    .RD2(RD2), 
    .BrRes(BrRes)
    );
	 
Mux2a1 MUX_A_ALU (
    .sel(Asel), 
    .data_A(RD1), 
    .data_B(PC_out), 
    .data_out(Mux_A)
    );
	 
Mux2a1 MUX_B_ALU (
    .sel(Bsel), 
    .data_A(RD2), 
    .data_B(Imm_out), 
    .data_out(Mux_B)
    );
	 
Extensor SIGN_EXTENSION (
    .ImmSel(ImmSel), 
    .inst(Inst[31:7]), 
    .ImmOut(Imm_out),
	 .Imm_U(Imm_tipo_U)
    );

ALU ALU (
    .A(Mux_A), 
    .B(Mux_B), 
    .ALUSel(ALUSel), 
    .ALU_Output(ALU_out), 
    .Offset(Offset), 
    .Address(Address)
    );

StoreBlock STORE_BLOCK (
    .Mem(Read_data), 
    .imm_byte(RD2[7:0]), 
    .offset(Offset), 
    .store_select(StoreSel), 
    .store_word(RD2), 
    .store_out(Store_out)
    );

DataMem DATA_MEMORY (
    .Address(Address), 
    .Wdata(Store_out), 
    .MemRW(MemW), 
    .clock(clk), 
    .Rdata(Read_data)
    );

Load_Block LOAD_BLOCK (
    .Load_Memory(Read_data), 
    .Load_Select(LoadSel), 
    .Offset(Offset), 
    .Load_data(Load_out)
    );	

Control_Unit CU (
    .opcode(Inst[6:0]), 
    .funct7(Inst[30]), 
    .funct3(Inst[14:12]), 
    .BrRes(BrRes), 
    .PCSel(PCsel), 
    .ImmSel(ImmSel), 
    .RegWEn(RegWEn), 
    .Bsel(Bsel), 
    .Asel(Asel), 
    .ALUSel(ALUSel), 
    .MemW(MemW), 
    .WBSel(WBsel), 
    .Store_Select(StoreSel), 
    .Load_Select(LoadSel)
    );
endmodule
