`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:48:22 02/22/2018 
// Design Name: 
// Module Name:    Sch1_lab401 
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
module Sch1_lab401(
   input clk,
	input BTN0,
	input [7:0]SW,
	output wire [3:0]AN,
	output wire [7:0]SEG
	);
wire CEO1,CEO2,CEO3,CEO4,ce1ms;
//wire [3:0]dat0;
//wire [3:0]dat1;
//wire [3:0]dat2;
//wire [3:0]dat3;
//wire [15:0]dat = {dat0, dat1,dat2, dat3};
wire [15:0]dat;
VCGrey4Re DD1 (.clk(clk), .r(BTN0), .ce(CEO4), .CEO(CEO1), .Y(dat[3:0]));

VCBDmSE DD2 (.clk(clk), .ce(CEO1), .CEO(CEO2), .Q(dat[7:4]), .s(BTN0));

VCB4RE DD3 (.clk(clk), .ce(CEO2), .R(BTN0), .CEO(CEO3), .Q(dat[11:8]));

VCJmRE DD4 (.clk(clk), .ce(CEO3), .Q(dat[15:12]), .R(BTN0));

Gen_Nms_1s DD5 (.clk(clk), .CEO(CEO4), .ce(ce1ms), .Tmod(SW[7]));

DISPLAY DD6 (.clk(clk), .dat(dat), .PTR(SW[5:4]), .An(AN), .SEG(SEG), .ce1ms(ce1ms));

endmodule
