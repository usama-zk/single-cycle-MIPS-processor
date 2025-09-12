`timescale 1ns / 1ps
module Decoder(inst,OpCode,rs,rt,rd,funct,immed,J_val);
input [31:0] inst;
output reg [5:0]OpCode,funct;
output reg [4:0] rs,rt,rd;
output reg [15:0] immed;
output reg [25:0] J_val;
always @(*)
	begin
	OpCode<=inst[31:26];
	rs<=inst[25:21];
	rt<=inst[20:16];
	rd<=inst[15:11];
	immed<=inst[15:0];
	funct<=inst[5:0];
	J_val<=inst[25:0];
end
endmodule
