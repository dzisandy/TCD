`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:18:26 02/21/2018 
// Design Name: 
// Module Name:    VCBmLED 
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
`define m 4 
module VCBmLED(
    input ce,
    input up,
    input L,
    input clk,
    input clr,
	 input [`m-1:0]di,
	 output reg [`m-1:0]Q = 0,
	 output wire CEO,
	 output wire TC
    );
assign TC = up?(Q==(1<<`m)-1):(Q==0);
assign CEO = ce & TC;
always @ (posedge clr or posedge clk) begin
if (clr) Q <=0;
else Q<=L?di:(up & ce)?Q+1:(!up & ce)?Q-1:Q;
end
endmodule
