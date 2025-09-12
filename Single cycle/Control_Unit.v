`timescale 1ns / 1ps
module Control_Unit(OpCode,RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,Jump);
input [5:0] OpCode;
output reg RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,Jump;
always @(*)
	begin
		case(OpCode)
		6'b000000: // LW-Format
			begin 
				RegDst<=0;ALUSrc<=1;MemToReg<=1;RegWrite<=1;MemRead<=1;MemWrite<=0;Branch<=0;Jump<=0;
			end
		
		6'b000001: //SW-Format
			begin
				RegDst<=0;ALUSrc<=1;MemToReg<=0;RegWrite<=0;MemRead<=0;MemWrite<=1;Branch<=0;Jump<=0;
			end
			
		6'b000010: //R-Format
			begin
				RegDst<=1;ALUSrc<=0;MemToReg<=0;RegWrite<=1;MemRead<=0;MemWrite<=0;Branch<=0;Jump<=0;
			end
			6'b000011: //BEQ-Format
			begin
				RegDst<=0;ALUSrc<=0;MemToReg<=0;RegWrite<=0;MemRead<=0;MemWrite<=0;Branch<=1;Jump<=0;
			end
			6'b000100: //J-Format
			begin
				RegDst<=0;ALUSrc<=0;MemToReg<=0;RegWrite<=0;MemRead<=0;MemWrite<=0;Branch<=0;Jump<=1;
			end
		
		endcase
	end
endmodule
