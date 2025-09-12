`timescale 1ns / 1ps
module Processor(rst,clk,swclk);
input rst,clk;
wire [31:0]instP,inst,rs_out,rt_out,rd_in,ex_immed,Oper2,Alu_ans,MemToReg_val,data,J_ext;
wire [25:0] J_val;
wire [15:0] immed;
wire [5:0] OpCode,funct;
wire [4:0]rt,rs,rd,RegDst_val; 
wire RegDst,ALUSrc,MemToReg,RegWrite,MemRead,MemWrite,Branch,Zflag,Jump;
output reg LED_out,temp_en,Sclk;

	PC pc(.clk(clk),.rst(rst),.Zflag(Zflag),.Branch(Branch),.ex_immed(ex_immed),.instP(instP),.Jump(Jump),.J_ext(J_ext));
	
	Inst_Mem IM(.instP(instP),.inst(inst));
	
	Decoder DC(.inst(inst),.OpCode(OpCode),.rs(rs),.rt(rt),.rd(rd),.funct(funct),.immed(immed),.J_val(J_val));
	
	Control_Unit CU(.OpCode(OpCode),.RegDst(RegDst),.ALUSrc(ALUSrc),.MemToReg(MemToReg),
	.RegWrite(RegWrite),.MemRead(MemRead),.MemWrite(MemWrite),.Branch(Branch),.Jump(Jump));
	
	Mux_RegDst M_Rd(.RegDst(RegDst),.rt(rt),.rd(rd),.RegDst_val(RegDst_val));
	
	Regfile RF(.clk(clk),.RegWrite(RegWrite),.rs(rs),.rt(rt),.rd(rd),.rs_out(rs_out),.rt_out(rt_out),.rd_in(MemToReg_val));

	Mux_ALUSrc M_As(.ALUSrc(ALUSrc),.rt_out(rt_out),.ex_immed(ex_immed),.Oper2(Oper2));
	
	Sign_Ext SE(.immed(immed),.ex_immed(ex_immed));
	
	J_Ext JE(.J_val(J_val),.J_ext(J_ext));
	
	ALU alu(.OpCode(OpCode),.funct(funct),.rs_in(rs_out),.Oper2(Oper2),.Alu_ans(Alu_ans),.Zflag(Zflag));
	
	Data_Mem DM(.Alu_ans(Alu_ans),.clk(clk),.MemRead(MemRead),.MemWrite(MemWrite),.rt_out(rt_out),.data(data));
	
	Mux_MemToReg M_MR(.MemToReg(MemToReg),.Alu_ans(Alu_ans),.data(data),.MemToReg_val(MemToReg_val));
	always@(*)
	begin
	
	end
	Time_Mul(in,Sclk,LED_out,temp_en);
	

endmodule
