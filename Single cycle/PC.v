`timescale 1ns / 1ps
module PC(clk,rst,Zflag,Branch,ex_immed,instP,Jump,J_ext);
input clk,rst,Zflag,Branch,Jump;
input [31:0] ex_immed,J_ext;
output reg [31:0]instP;

initial
begin
instP<=32'd0;
end

always @(posedge clk)
	begin
		if(rst)
			instP<=32'd0;
		else if(Branch && Zflag)
			instP<=ex_immed;
		else if(Jump)
			instP<=J_ext;
		else
			instP<=instP+32'd1;
	end
endmodule

