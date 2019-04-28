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
module RISCmodified4to1mux(
    input [15:0] A,
    input [15:0] B,
    input [15:0] C,
    input [15:0] D,
    input [1:0]  Sel,
    output reg [15:0] Z
    );
	 
	always @(A or B or C or D or Sel)
		case (Sel)
			2'b00:	Z = A;
			2'b01:	Z = B;
			2'b10:	Z = C;
			2'b11:	Z = D;
		endcase	
		
endmodule
