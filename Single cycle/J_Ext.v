`timescale 1ns / 1ps
module J_Ext(J_val,J_ext);
input [25:0] J_val;
output reg [31:0] J_ext;
always@(*)
J_ext = {6'b0, J_val}; 
endmodule
