`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   
// Design Name:   
// Module Name:   
// Project Name: 
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VCBmLED
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_VCBmLED;

	// Inputs
	reg ce;
	reg up;
	reg L;
	reg clk;
	reg clr;
	reg [3:0] di;

	// Outputs
	wire [3:0] Q;
	wire CEO;
	wire TC;

	// Instantiate the Unit Under Test (UUT)
	VCBmLED uut (
		.ce(ce), 
		.up(up), 
		.L(L), 
		.clk(clk), 
		.clr(clr), 
		.di(di), 
		.Q(Q), 
		.CEO(CEO), 
		.TC(TC)
	);

	//Генратор периодичеккого сигнала синхронизации clk
	parameter Tclk=20; //Период сигнала синхронизации 20 нс
	always begin clk=0; #(Tclk/2); clk=1; #(Tclk/2); end
	// Генератор периодического сигнала ce
	parameter Tce=80; //Период сигнала ce 80 нс
	always begin ce=0; #(3*Tce/4); ce=1; #(1*Tce/4); end
	initial begin // Initialize Inputs
	di[0] = 1;
	di[1] = 0;
	di[2] = 1;
	di[3] = 0;
	up = 0;
	L = 0;
	clr = 0; //Исходное состояние входов
	#112; clr = 1; //Через 111 нс 1
	#145; clr = 0; //Через 145 нс 1
	#171; L = 1;
	#192; L = 0;
	#215; up = 1;
	end
      
endmodule