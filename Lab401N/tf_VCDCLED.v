`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:33:08 03/01/2018
// Design Name:   VCDCLED
// Module Name:   G:/Dzis/Lab401N/tf_VCDCLED.v
// Project Name:  Lab401N
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VCDCLED
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_VCDCLED;

	// Inputs
	reg clk;
	reg ce;
	reg s;
	reg up;

	// Outputs
	wire [3:0] Q;
	wire TC;
	wire CEO;

	// Instantiate the Unit Under Test (UUT)
	VCDCLED uut (
		.clk(clk), 
		.ce(ce), 
		.s(s), 
		.up(up), 
		.Q(Q), 
		.TC(TC), 
		.CEO(CEO)
	);

	parameter Tclk=20; //������ ������� ������������� 20 ��
	always begin clk=0; #(Tclk/2); clk=1; #(Tclk/2); end
	// ��������� �������������� ������� ce
	parameter Tce=80; //������ ������� ce 80 ��
	always begin ce=0; #(3*Tce/4); ce=1; #(1*Tce/4); end
	initial begin // Initialize Inputs
	up = 0;
	s = 0; //�������� ��������� ������
	#112; s = 1; //����� 111 �� 1
	#145; s = 0; //����� 145 �� 1
	#215; up = 1;
	end
      
endmodule

