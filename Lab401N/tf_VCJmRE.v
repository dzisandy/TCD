`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:32:47 02/21/2018
// Design Name:   VCJmRE
// Module Name:   D:/Xilinx/Dzis/Lab401N/tf_VCJmRE.v
// Project Name:  Lab401N
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VCJmRE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_VCJmRE;

	// Inputs
	reg ce;
	reg clk;
	reg R;

	// Outputs
	wire TC;
	wire CEO;
	wire [3:0] Q;

	// Instantiate the Unit Under Test (UUT)
	VCJmRE uut (
		.ce(ce), 
		.clk(clk), 
		.R(R), 
		.TC(TC), 
		.CEO(CEO), 
		.Q(Q)
	);

parameter Tclk=20; //Период сигнала синхронизации 20 нс
always begin clk=0; #(Tclk/2); clk=1; #(Tclk/2); end
parameter Tce=80; //Период сигнала ce 80 нс
always begin ce=0; #(3*Tce/4); ce=1; #(1*Tce/4); end
initial begin // Initialize Inputs
clk = 0;
ce = 0;
R = 0; //Исходное состояние входов
#92; R = 1; //Через 92 нс 1
#5; R = 0; // Через 5 нс 0
#111; R = 1; //Через 111 нс 1
#70; R = 0; // Через 70 нс 0
end
      
endmodule

