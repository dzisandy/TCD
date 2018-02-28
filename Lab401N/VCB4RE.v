`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:16:48 02/15/2018 
// Design Name: 
// Module Name:    VCB4RE 
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
module VCB4RE(
    input clk,
    input ce,
    input R,
    output wire CEO,
    output wire TC,
	 output reg [`m-1:0]Q = 0);
assign TC = (Q == (1<<`m)-1); // Q0 & Q1 & ... & Q`m-1 == 1 
assign CEO = ce & TC; // Clock enable output
always @ (posedge clk) begin 
Q<=R?0:ce?Q+1:Q; // if clr = 1 reset into 0, else ce = 1, then 'sum', else 'stay'
end
endmodule
