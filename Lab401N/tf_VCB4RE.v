`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:31:50 02/15/2018
// Design Name:   VCB4RE
// Module Name:   E:/FRTK/Dzis/Lab401N/tf_VCB4RE.v
// Project Name:  Lab401N
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VCB4RE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_VCB4RE;

	// Inputs
	reg clk;
	reg ce;
	reg R;

	// Outputs
	wire CEO;
	wire TC;
	wire [3:0] Q;

	// Instantiate the Unit Under Test (UUT)
	VCB4RE uut (
		.clk(clk), 
		.ce(ce), 
		.R(R), 
		.CEO(CEO), 
		.TC(TC), 
		.Q(Q)
	);

//Генратор периодичеккого сигнала синхронизации clk
parameter Tclk=20; //Период сигнала синхронизации 20 нс
always begin clk=0; #(Tclk/2); clk=1; #(Tclk/2); end
// Генератор периодического сигнала ce
parameter Tce=80; //Период сигнала ce 80 нс
always begin ce=0; #(3*Tce/4); ce=1; #(1*Tce/4); end
	initial begin
		// Initialize Inputs
		R = 0; //Исходное состояние входов
		#92; R = 1; //Через 92 нс 1
		#5; R = 0; // Через 5 нс 0
		#111; R = 1; //Через 111 нс 1
		#70; R = 0; // Через 70 нс 0
	end
endmodule

