`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:55:01 02/21/2018
// Design Name:   VCGrey4Re
// Module Name:   D:/Xilinx/Dzis/Lab401N/tf_VCGrey4Re.v
// Project Name:  Lab401N
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VCGrey4Re
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_VCGrey4Re;

	// Inputs
	reg clk;
	reg ce;
	reg r;

	// Outputs
	wire [3:0] Y;
	wire CEO;
	wire TC;

	// Instantiate the Unit Under Test (UUT)
	VCGrey4Re uut (
		.clk(clk), 
		.ce(ce), 
		.r(r), 
		.Y(Y), 
		.CEO(CEO), 
		.TC(TC)
	);

parameter Tclk=20; //Период сигнала синхронизации 20 нс
always begin clk=0; #(Tclk/2); clk=1; #(Tclk/2); end
parameter Tce=80; //Период сигнала ce 80 нс
always begin ce=0; #(3*Tce/4); ce=1; #(1*Tce/4); end
initial begin // Initialize Inputs
clk = 0;
ce = 0;
r = 0; //Исходное состояние входов
#92; r = 1; //Через 92 нс 1
#5; r = 0; // Через 5 нс 0
#111; r = 1; //Через 111 нс 1
#70; r = 0; // Через 70 нс 0
end
      
endmodule

