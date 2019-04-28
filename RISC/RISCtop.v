`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:04:10 11/27/2018 
// Design Name: 
// Module Name:    RISCtop 
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
module RISCtop(
    input [15:0] data_from_rom,
    input reset,
    input clk,
    input[15:0] data_from_ram,
    output [5:0] address_to_rom,
    output enable_to_rom,
    output[15:0] data_to_ram,
    output write_enable_to_ram,
    output read_enable_to_ram,
    output [5:0] address_to_ram,
    output enable_ram_read
	 
    );

//Components should be as follows:
//Register file for reading writing (complete)
//ALU
//Datapath
//Controller

	wire RW, WEnabletoRam, CheckZero;
	wire [1:0] MD;
	wire [3:0] opcode, Rd, Rs, Rt;
	wire [7:0] offsetsig;
	wire [15:0] A, B, C, RamOut, D, F, DfromMux;

	 RISCcontroller controller(
    .data			(data_from_rom),
	 .RegA			(A),
	 .clk				(clk),
	 .reset			(reset),
    .Rd				(Rd),
    .Rs				(Rs),
    .Rt				(Rt),
	 .OP				(opcode),
	 .writeregister		(RW),
	 .writeram				(WEnabletoRam),
	 .readram				(read_enable_to_ram),
	 .addresstorom			(address_to_rom),
	 .enablerom				(enable_to_rom),
	 .MUX2sel				(MD),
	 .offset					(offsetsig),
	 .Z						(CheckZero)
    );

	 RISCregfile regfile(
	 .reset			(reset),
    .R1		(Rs),
    .R2		(Rt),
	 .W1		(Rd),
	 .D1	(D),
	 .Wenable	(RW),
	 .clk		(clk),
	 .OUT1	(A),
	 .OUT2	(B)
	 );
	 
	 RISCmodified2to1mux mux1(
    .A			(data_from_ram),
    .B			(B),
    .Sel			(WEnabletoRam),
    .Z			(data_to_ram)
    );
	 
	 RISCmodified4to1mux mux3(
    .A			(F),
    .B			(data_from_ram),
	 .C			(offsetsig),
	 .D			(offsetsig),
    .Sel			(MD),
    .Z			(D)
    );

	 ALU topalu(
    .Opcode			(opcode),
    .A				(A),
    .B				(B),
    .Output			(F),
	 .Z				(CheckZero)
	 );

endmodule
