`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:41:30 02/21/2018 
// Design Name: 
// Module Name:    Gen1ms 
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
module Gen1ms(
    input clk, 
	 output reg ce1ms=0
    );
parameter Fclk = 50000000;
parameter F1kHz = 1000;
reg[15:0]cb_ms = 0;
wire ce = (cb_ms==1);
always @ (posedge clk) begin
cb_ms <=ce?((Fclk/F1kHz)):cb_ms-1;
ce1ms<=ce;
end
endmodule
