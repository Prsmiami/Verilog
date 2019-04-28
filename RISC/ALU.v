`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:06:05 11/13/2018 
// Design Name: 
// Module Name:    ALU Top 
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
module ALU(
   input [3:0] Opcode,
   input [15:0] A,
   input [15:0] B,
   output reg [15:0] Output,
	output reg Z
	);
	
	reg [15:0]result;
	always @(*)
	begin
		case(Opcode)
		4'b0000:
			result = A + B;
		4'b0001:
			result = A - B;
		4'b0010:
			result = A & B;
		4'b0011:
			result = A | B;
		4'b0100:
			result = A ^ B;
		4'b0101:
			result = ~A;
		4'b0110:
			result = A << 1;
		4'b0111:
			result = A >> 1;
	endcase
	Output = result;
	if (A == 0)begin
		Z = 1;
	end
	
	end
	
endmodule
