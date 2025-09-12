`timescale 1ns / 1ps
module ALU(OpCode,funct,rs_in,Oper2,Alu_ans,Zflag);
input [5:0] OpCode,funct;
input [31:0] rs_in,Oper2;
output reg [31:0] Alu_ans;
output reg Zflag;
	
always @(*)

		begin
			case(OpCode)
					6'b000010:
						case(funct)
							6'b000000: Alu_ans<=rs_in + Oper2;
							6'b000001: Alu_ans<=rs_in - Oper2;
							6'b000010: Alu_ans<=rs_in & Oper2;
							6'b000011: Alu_ans<=rs_in | Oper2;
							6'b000100: Alu_ans<=(rs_in<Oper2)?1:0;
							default: Alu_ans <= 32'd441250;
						endcase
					6'b000001:Alu_ans<=rs_in + Oper2;
					6'b000000:Alu_ans<=rs_in + Oper2;
					6'b000011:Alu_ans<=rs_in - Oper2;
						default: Alu_ans <= 32'd9999999;
			endcase
		end
	always @(Alu_ans)
		begin
			if(Alu_ans)
				Zflag<=0;
			else
				Zflag<=1;
		end
endmodule
