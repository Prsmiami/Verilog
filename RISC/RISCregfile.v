`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:24:26 11/27/2018 
// Design Name: 
// Module Name:    RISCregfile 
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
module RISCregfile(
	 input reset,
    input [3:0] R1, R2,
    input [3:0] W1,
    input [15:0] D1,
    input Wenable,
	 input clk,
    output reg [15:0] OUT1,
    output reg [15:0] OUT2
    );
	 
	 reg [15:0] register[15:0];
	 
	 always @ (posedge clk or posedge reset) begin
	 
	 if(reset == 1) begin
	 register[0] <= 0;
	 register[1] <= 0;
	 register[2] <= 0;
	 register[3] <= 0;
	 register[4] <= 0;
	 register[5] <= 0;
	 register[6] <= 0;
	 register[7] <= 0;
	 register[8] <= 0;
	 register[9] <= 0;
	 register[10] <= 0;
	 register[11] <= 0;
	 register[12] <= 0;
	 register[13] <= 0;
	 register[14] <= 0;
	 register[15] <= 0;
	 OUT1 <= 16'b0000000000000000;
	 OUT2 <= 16'b0000000000000000;
	 end
	 else begin
	 
	 if(Wenable == 1) begin
	 
	 register[W1] <= D1;
	 OUT1 <= register[R1];
	 OUT2 <= register[R2];
	 
	 end
	 end
	 
	 end
endmodule