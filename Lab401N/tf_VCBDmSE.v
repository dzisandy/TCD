`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:12:45 02/21/2018
// Design Name:   VCBDmSE
// Module Name:   D:/Xilinx/Dzis/Lab401N/tf_VCBDmSE.v
// Project Name:  Lab401N
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VCBDmSE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_VCBDmSE;

	// Inputs
	reg ce;
	reg clk;
	reg s;

	// Outputs
	wire TC;
	wire CEO;
	wire [3:0] Q;

	// Instantiate the Unit Under Test (UUT)
	VCBDmSE uut (
		.ce(ce), 
		.clk(clk), 
		.s(s), 
		.TC(TC), 
		.CEO(CEO), 
		.Q(Q)
	);

parameter Tclk=20; //������ ������� ������������� 20 ��
always begin clk=0; #(Tclk/2); clk=1; #(Tclk/2); end
// ��������� �������������� ������� ce
parameter Tce=80; //������ ������� ce 80 ��
always begin ce=0; #(3*Tce/4); ce=1; #(1*Tce/4); end
	initial begin
		// Initialize Inputs
		s = 0; //�������� ��������� ������
		#92; s = 1; //����� 92 �� 1
		#5; s = 0; // ����� 5 �� 0
		#111; s = 1; //����� 111 �� 1
		#70; s = 0; // ����� 70 �� 0
	end
endmodule

