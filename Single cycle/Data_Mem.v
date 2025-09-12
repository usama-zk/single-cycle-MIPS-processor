`timescale 1ns / 1ps
module Data_Mem(Alu_ans,clk,MemRead,MemWrite,rt_out,data);
input clk,MemRead,MemWrite;
input [31:0] Alu_ans;
input [31:0] rt_out;
output reg [31:0] data;
reg [31:0] data_mem [51:0];

initial
begin
$readmemb("Data_Memory.mem",data_mem);

end

always@(*)
begin
if(MemRead)
case(Alu_ans)
32'd0:data<=data_mem[0];
32'd1:data<=data_mem[1];
32'd2:data<=data_mem[2];
32'd3:data<=data_mem[3];
32'd4:data<=data_mem[4];
32'd5:data<=data_mem[5];
32'd6:data<=data_mem[6];
32'd7:data<=data_mem[7];
32'd8:data<=data_mem[8];
32'd9:data<=data_mem[9];
32'd10:data<=data_mem[10];
32'd11:data<=data_mem[11];
32'd12:data<=data_mem[12];
32'd13:data<=data_mem[13];
32'd14:data<=data_mem[14];
32'd15:data<=data_mem[15];
32'd16:data<=data_mem[16];
32'd17:data<=data_mem[17];
32'd18:data<=data_mem[18];
32'd19:data<=data_mem[19];
32'd20:data<=data_mem[20];
32'd21:data<=data_mem[21];
32'd22:data<=data_mem[22];
32'd23:data<=data_mem[23];
32'd24:data<=data_mem[24];
32'd25:data<=data_mem[25];
32'd26:data<=data_mem[26];
32'd27:data<=data_mem[27];
32'd28:data<=data_mem[28];
32'd29:data<=data_mem[29];
32'd30:data<=data_mem[30];
32'd31:data<=data_mem[31];
end

always @(posedge clk)
begin
if(MemWrite)
data_mem[Alu_ans]<=rt_out;
end
endmodule
