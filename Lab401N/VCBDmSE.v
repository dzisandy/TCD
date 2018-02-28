`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:03:11 02/21/2018 
// Design Name: 
// Module Name:    VCBDmSE 
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
module VCBDmSE(
    input ce,
    input clk,
    input s,
	 output wire TC,
	 output wire CEO,
	 output reg[`m-1:0]Q=(1<<`m)-1
    );
	 assign TC = (Q==0);
	 assign CEO = ce & TC;
	 always @ (posedge clk) begin
	 Q<=s?((1<<`m)-1):ce?Q-1:Q;
	 end
endmodule
