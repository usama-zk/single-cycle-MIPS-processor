`timescale 1ns / 1ps
module Mux_MemToReg(MemToReg,Alu_ans,data,MemToReg_val);
input MemToReg;
input [31:0] Alu_ans,data;
output reg [31:0] MemToReg_val;
always@(*)
begin
if(MemToReg)
MemToReg_val<=data;
else
MemToReg_val<=Alu_ans;
end
endmodule
