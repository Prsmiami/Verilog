`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:10:40 11/27/2018 
// Design Name: 
// Module Name:    RISCmodifiedmux 
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
module RISCmodified2to1mux(
    input [15:0] A,
    input [15:0] B,
    input Sel,
    output reg [15:0] Z
    );

	
	always @(A or B or Sel)
		if(Sel == 1'b0)
			Z = A;
		else
			Z = B;

endmodule
