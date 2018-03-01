`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:02:46 03/01/2018 
// Design Name: 
// Module Name:    VCDCLED 
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
module VCDCLED(
    input clk,
    input ce,
    input s,
	 input up,	
	 output reg[3:0]Q=0,
	 output wire TC,
	 output wire CEO
    );
assign TC = up?(Q==9):(Q==0);	 
assign CEO = ce & TC;
always @ (posedge s or posedge clk) begin
if (s) Q<=0;

else Q<=(up&CEO)? 0:(!up & CEO)? 9:(up & ce)?Q+1:(!up& ce)?Q-1:Q;
end

endmodule
