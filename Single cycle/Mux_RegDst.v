`timescale 1ns / 1ps
module Mux_RegDst(RegDst,rt,rd,RegDst_val);
input RegDst;
input [4:0]rt,rd;
output reg [4:0] RegDst_val;
always@(*)
	begin
		if(RegDst)
			RegDst_val<=rd;
		else
			RegDst_val<=rt;
	end

endmodule
