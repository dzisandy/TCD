`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:09:41 02/15/2018 
// Design Name: 
// Module Name:    VCD4RE 
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
module VCD4RE(
    input clk,
    input ce,
    input R,
    output wire TC,
    output wire CEO,
	 output reg[3:0]Q=0
    );
assign TC = (Q == 9);
assign CEO = ce & TC;
always @ (posedge clk) begin
Q<=(R|CEO)?0:ce?Q+1:Q;
end
endmodule
