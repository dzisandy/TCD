`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:16:13 02/15/2018
// Design Name:   VCD4RE
// Module Name:   E:/FRTK/Dzis/Lab401N/tf_VCD4RE.v
// Project Name:  Lab401N
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VCD4RE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_VCD4RE;

	// Inputs
	reg clk;
	reg ce;
	reg R;

	// Outputs
	wire TC;
	wire CEO;
	wire [3:0] Q;

	// Instantiate the Unit Under Test (UUT)
	VCD4RE uut (
		.clk(clk), 
		.ce(ce), 
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

