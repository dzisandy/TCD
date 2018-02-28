`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:24:24 02/21/2018 
// Design Name: 
// Module Name:    D7seg 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module D7seg(
	input [3:0]dig,
	output wire [6:0]seg
    );
assign seg = (dig==0)? 7'b1000000:
				 (dig==1)? 7'b1111001:
				 (dig==2)? 7'b0100100:
				 (dig==3)? 7'b0110000:
				 (dig==4)? 7'b0011001:
				 (dig==5)? 7'b0010010:
				 (dig==6)? 7'b0000010:
				 (dig==7)? 7'b1111000:
				 (dig==8)? 7'b0000000:
				 (dig==9)? 7'b0010000:
				 (dig==10)? 7'b0001000:
				 (dig==11)? 7'b0000011:
				 (dig==12)? 7'b1000110:
				 (dig==13)? 7'b0100001:
				 (dig==14)? 7'b0000110:
								7'b0001110;
endmodule
