`timescale 1ns / 1ps
module Sign_Ext(immed,ex_immed);
input [15:0]immed;
output reg [31:0] ex_immed;
always@(*)
ex_immed <= {{16{immed[15]}}, immed};
endmodule
