`timescale 1ns / 1ps
module Time_Mul(in,Sclk,LED_out,temp_en);
input Sclk;
input [15:0] in; //Alu answer
reg [3:0] display; //hold the number, being displayed at a particular instant
reg [20:0]counter=21'b00; //Counter to count from 0-0.4 million
reg [1:0]count=2'b00; // count represent the active andoe at a particular time
output reg [6:0] LED_out; //convert the number to 7 segment format
output reg [3:0] temp_en; //hold set the value of a particular node to zero to turn on


//in this block after every posedge counter is incremented by 1 till it reaches 0.4m, so count is
//incremented by 1 and next segment is illuminated. 
always @(posedge Sclk)
	begin
		if(counter==21'd400000)
			begin
				if(count==4) begin count<=0; counter<=0; end
				else begin counter<=0; count <= count + 2'b01; end
			end
			else
			begin
			counter<=counter+20'b01;
			end
	end
//In this block depending on the count value(0,1,2,3 means 1st,2nd,3rd and 4th 7-segment respectively) 
//values are assigned temp_en hold the value of count that should be enabled at particular instant of time 
always @ (*)
begin
case(count)  
2'b00 :
    begin
    display <= in[15:12];
    temp_en <= 4'b1110;  
    end
    
2'b01:
     begin
     display <= in[11:8];
     temp_en <= 4'b1101;
     end
    
2'b10:
      begin
    display <= in[7:4];
    temp_en <= 4'b1011;
    end
     
2'b11:  
    begin
    display <= in[3:0];
    temp_en <= 4'b0111;
    end
  endcase
 end  
//In this always block value is converted in 7 segment format
always @(*)
    begin
        case(display)
        4'b0000: LED_out <= 7'b0000001; // "0"     
        4'b0001: LED_out <= 7'b1001111; // "1" 
        4'b0010: LED_out <= 7'b0010010; // "2" 
        4'b0011: LED_out <= 7'b0000110; // "3" 
        4'b0100: LED_out <= 7'b1001100; // "4" 
        4'b0101: LED_out <= 7'b0100100; // "5" 
        4'b0110: LED_out <= 7'b0100000; // "6" 
        4'b0111: LED_out <= 7'b0001111; // "7" 
        4'b1000: LED_out <= 7'b0000000; // "8"     
        4'b1001: LED_out <= 7'b0000100; // "9" 
		  4'b1010: LED_out <= 7'b0001000; // "A" 
		  4'b1011: LED_out <= 7'b0000000; // "B" 
		  4'b1100: LED_out <= 7'b0110001; // "C" 
		  4'b1101: LED_out <= 7'b0000001; // "D"
		  4'b1110: LED_out <= 7'b0110000; // "E" 
		  4'b1111: LED_out <= 7'b0111000; // "F"
        default: LED_out <= 7'b0000001; //default value in case no any case matches.
		  endcase
		  end
endmodule

