`timescale 1ns / 1ps
module Inst_Mem(instP,inst);
input [31:0] instP;
output reg [31:0] inst;
reg [31:0] mem [31:0];

initial
begin
$readmemb("Inst_Memory.mem",mem);
end
always @(instP)
case(instP)
32'd0:inst<=mem[instP];
32'd1:inst<=mem[instP];
32'd2:inst<=mem[instP];
32'd3:inst<=mem[instP];
32'd4:inst<=mem[instP];
32'd5:inst<=mem[instP];
32'd6:inst<=mem[instP];
32'd7:inst<=mem[instP];
32'd8:inst<=mem[instP];
32'd9:inst<=mem[instP];
32'd10:inst<=mem[instP];
32'd11:inst<=mem[instP];
32'd12:inst<=mem[instP];
32'd13:inst<=mem[instP];
32'd14:inst<=mem[instP];
32'd15:inst<=mem[instP];
32'd16:inst<=mem[instP];
32'd17:inst<=mem[instP];
32'd18:inst<=mem[instP];
32'd19:inst<=mem[instP];
32'd20:inst<=mem[instP];
32'd21:inst<=mem[instP];
32'd22:inst<=mem[instP];
32'd23:inst<=mem[instP];
32'd24:inst<=mem[instP];
32'd25:inst<=mem[instP];
32'd26:inst<=mem[instP];
32'd27:inst<=mem[instP];
32'd28:inst<=mem[instP];
32'd29:inst<=mem[instP];
32'd30:inst<=mem[instP];
32'd31:inst<=mem[instP];
endcase
endmodule
