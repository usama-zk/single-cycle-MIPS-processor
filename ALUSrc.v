`timescale 1ns / 1ps
module Mux_ALUSrc(ALUSrc,rt_out,ex_immed,Oper2);
input ALUSrc;
input [31:0] rt_out,ex_immed;
output reg[31:0] Oper2;
always@(*)
	begin
		if(ALUSrc)
			Oper2<=ex_immed;
		else
			Oper2<=rt_out;
	end
endmodule
