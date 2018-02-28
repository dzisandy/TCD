`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:37:19 02/21/2018 
// Design Name: 
// Module Name:    VCGrey4Re 
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
module VCGrey4Re(
    input clk,
    input ce,
    input r,
	 output wire [3:0]Y,
	 output wire CEO,
	 output wire TC
    );
	 reg [4:0]q=0;
	 assign TC = (q[4:0]==((1<<4)|1));
	 assign CEO = ce & TC;
	 assign Y = q[4:1];
	 always @ (posedge clk) begin
	 q[0]<=(r|CEO)?0:ce?!q[0]:q[0];
	 q[1]<=(r|CEO)?0:((q[0]==0)&ce)?!q[1]:q[1];
	 q[2]<=(r|CEO)?0:((q[1:0]==((1<<1)|1))&ce)?!q[2]:q[2];
	 q[3]<=(r|CEO)?0:((q[2:0]==((1<<2)|1))&ce)?!q[3]:q[3];
	 q[4]<=(r|CEO)?0:((q[3:0]==((1<<3)|1))&ce)?!q[4]:q[4];
	 end

endmodule
