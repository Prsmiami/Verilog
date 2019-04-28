`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:39:35 11/27/2018 
// Design Name: 
// Module Name:    RISCcontroller 
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
module RISCcontroller(
    input [15:0] data,
	 input [15:0] RegA,
	 input clk,
	 input reset,
	 input Z,
    output reg [3:0] Rd,
    output reg [3:0] Rs,
    output reg [3:0] Rt,
	 output reg [3:0] OP,
	 output reg writeregister,
	 output reg writeram,
	 output reg readram,
	 output reg [5:0] addresstorom,
	 output reg enablerom,
	 output reg [1:0] MUX2sel,
	 output reg [7:0] offset
    );
	 
	 reg [5:0] programcounter;
	 reg [15:0] storage;
	 reg [3:0] operand;
	 reg [3:0] destination;
	 reg [3:0] source;
	 reg [3:0] target;
	 reg state;
	 

	 always @ (posedge clk or posedge reset) begin

	
		if (reset==1) begin
			programcounter <= 6'b000000;
			Rd <= 4'b0000;
			Rs <= 4'b0000;
			Rt <= 4'b0000;
			operand <= 4'b0000;
			OP <= 4'b0000;
			state <= 0;
			end
		else begin
	
		if(state == 0) begin
	
			enablerom <= 1;		
			addresstorom <= programcounter;
			storage <= data;		
			operand <= storage[15:12];
			destination <= storage[11:8];
			source <= storage[7:4];
			target <= storage[3:0];
			state <= 1;
		end
		else begin
	
		if(state == 1) begin
		enablerom <= 0;

			case (operand)
				0: begin
				
						Rd <= destination;
						Rs <= source;
						Rt <= target;
						OP <= operand;
						MUX2sel <= 0;
						writeregister <= 1;
						writeram <= 0;
						readram <= 0;
						addresstorom <= 0;
						enablerom <= 0;
						offset <= 0;
						
					end
						
				1: begin
					
						Rd <= destination;
						Rs <= source;
						Rt <= target;
						OP <= operand;
						MUX2sel <= 0;
						writeregister <= 1;
						writeram <= 0;
						readram <= 0;
						addresstorom <= 0;
						enablerom <= 0;
						offset <= 0;
						
					end
						
				2: begin
					
						Rd <= destination;
						Rs <= source;
						Rt <= target;
						OP <= operand;
						MUX2sel <= 0;
						writeregister <= 1;
						writeram <= 0;
						readram <= 0;
						addresstorom <= 0;
						enablerom <= 0;
						offset <= 0;
						
					end
						
				3: begin
					
						Rd <= destination;
						Rs <= source;
						Rt <= target;
						OP <= operand;
						MUX2sel <= 0;
						writeregister <= 1;
						writeram <= 0;
						readram <= 0;
						addresstorom <= 0;
						enablerom <= 0;
						offset <= 0;
						
					end
						
				4: begin

						Rd <= destination;
						Rs <= source;
						Rt <= target;
						OP <= operand;
						MUX2sel <= 0;
						writeregister <= 1;
						writeram <= 0;
						readram <= 0;
						addresstorom <= 0;
						enablerom <= 0;
						offset <= 0;
						
					end
						
				5: begin
					
						Rd <= destination;
						Rs <= source;
						Rt <= 0;
						OP <= operand;
						MUX2sel <= 0;
						writeregister <= 1;
						writeram <= 0;
						readram <= 0;
						addresstorom <= 0;
						enablerom <= 0;
						offset <= 0;
						
					end
						
				6: begin
					
						Rd <= destination;
						Rs <= source;
						Rt <= 0;
						OP <= operand;
						MUX2sel <= 0;
						writeregister <= 1;
						writeram <= 0;
						readram <= 0;
						addresstorom <= 0;
						enablerom <= 0;
						offset <= 0;
						
					end
						
				7: begin
					
						Rd <= destination;
						Rs <= source;
						Rt <= 0;
						OP <= operand;
						MUX2sel <= 0;
						writeregister <= 1;
						writeram <= 0;
						readram <= 0;
						addresstorom <= 0;
						enablerom <= 0;
						offset <= 0;
						
					end
						
				8: begin
					//Return for immediate
						Rd <= destination;
						Rs <= 0;
						Rt <= 0;
						OP <= operand;
						MUX2sel <= 2;
						writeregister <= 1;
						writeram <= 0;
						readram <= 0;
						addresstorom <= 0;
						enablerom <= 0;
						offset <= {8'b00000000,storage[7:0]};
						
					end
						
				9: begin

						Rd <= destination;
						Rs <= source;
						Rt <= 0;
						OP <= operand;
						MUX2sel <= 1;
						writeregister <= 1;
						writeram <= 0;
						readram <= 1;
						addresstorom <= 0;
						enablerom <= 0;
						offset <= 0;
						
					end
						
				10: begin
					
						Rd <= 0;
						Rs <= source;
						Rt <= target;
						OP <= operand;
						MUX2sel <= 1;
						writeregister <= 0;
						writeram <= 1;
						readram <= 0;
						addresstorom <= 0;
						enablerom <= 0;
						offset <= 0;		
						
					end
						
				11: begin
					
						Rd <= 0;
						Rs <= destination;
						Rt <= 0;
						OP <= operand;
						MUX2sel <= 1;
						writeregister <= 0;
						writeram <= 0;
						readram <= 0;
						addresstorom <= 0;
						enablerom <= 0;
						offset <= 0;
						if(Z) programcounter <= programcounter + storage[5:0];
						
					end
						
				12: begin
					
						Rd <= destination;
						Rs <= source;
						Rt <= 0;
						OP <= operand;
						MUX2sel <= 1;
						writeregister <= 1;
						writeram <= 0;
						readram <= 1;
						addresstorom <= 0;
						enablerom <= 0;
						offset <= 0;
						if(~Z) programcounter <= programcounter + storage[5:0];
						
					end
						
				13: begin
					
						Rd <= destination;
						Rs <= 0;
						Rt <= 0;
						OP <= operand;
						MUX2sel <= 3;
						writeregister <= 1;
						writeram <= 0;
						readram <= 0;
						addresstorom <= 0;
						enablerom <= 0;
						offset <= {12'b000000000000,programcounter + 1};
						programcounter <= offset + storage[5:0];
						
					end
						
				14: begin

						Rd <= 0;
						Rs <= 0;
						Rt <= 0;
						OP <= operand;
						MUX2sel <= 0;
						writeregister <= 0;
						writeram <= 0;
						readram <= 0;
						addresstorom <= 0;
						enablerom <= 0;
						offset <= 0;
						programcounter <= programcounter + storage[5:0];
						
					 end

				15: begin
				
				//make sure instruction is being read correctly, input to controller changed to output of registers 
				//and is no longer output from ROM
						if(storage[11:8] == 0)
						begin
						
						Rd <= 0;
						Rs <= source;
						Rt <= 0;
						OP <= 0;
						writeregister <= 0;
						writeram <= 0;
						readram <= 0;
						addresstorom <= 0;
						enablerom <= 0;
						offset <= 0;
						programcounter <= RegA[5:0];
						
						end
						
					 end		
							
			endcase
			programcounter <= programcounter + 1;
			state <= 0;
		end
		end
	end
end
endmodule
