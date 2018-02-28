`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:28:47 02/21/2018 
// Design Name: 
// Module Name:    VCJmRE 
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
module VCJmRE(
    input ce,
    input clk,
    input R,
	 output wire TC,
	 output wire CEO,
	 output reg [`m-1:0]Q=0
    );
	 assign TC=(Q==(1<<`m)-1);
	 assign CEO = ce & TC;
	 always @ (posedge clk) begin
	 Q <=R?0:ce?Q<<1| !Q[`m-1]:Q;
	 end
endmodule
