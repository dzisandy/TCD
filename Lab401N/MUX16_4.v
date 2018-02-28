`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:35:31 02/21/2018 
// Design Name: 
// Module Name:    MUX16_4 
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
module MUX16_4( 
	 input [15:0]dat,
	 input [1:0]adr,
	 output wire [3:0]do
    );
assign do = (adr==0)? dat[3:0]:
				(adr==1)? dat[7:4]:
				(adr==2)? dat[11:8]:dat[15:12];
endmodule
