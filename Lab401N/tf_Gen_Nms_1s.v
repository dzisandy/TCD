`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:55:10 02/28/2018
// Design Name:   Gen_Nms_1s
// Module Name:   E:/Dzis/Lab401N/tf_Gen_Nms_1s.v
// Project Name:  Lab401N
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Gen_Nms_1s
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_Gen_Nms_1s;

	// Inputs
	reg clk;
	reg ce;
	reg Tmod;

	// Outputs
	wire CEO;

	// Instantiate the Unit Under Test (UUT)
	Gen_Nms_1s uut (
		.clk(clk), 
		.ce(ce), 
		.Tmod(Tmod), 
		.CEO(CEO)
	);

parameter Tclk=20; //������ ������� ������������� 20 ��
always begin clk=0; #(Tclk/2); clk=1; #(Tclk/2); end
// ��������� �������������� ������� ce
parameter Tce=80; //������ ������� ce 80 ��
always begin ce=0; #(3*Tce/4); ce=1; #(1*Tce/4); end
	initial begin
		// Initialize Inputs
		Tmod = 0; //�������� ��������� ������
		#92; Tmod = 1; //����� 92 �� 1
	end
      
endmodule

