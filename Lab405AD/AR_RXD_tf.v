`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:19:35 03/29/2018
// Design Name:   AR_RXD
// Module Name:   E:/FRTK/411/Burkina/Lab405AD/AR_RXD_tf.v
// Project Name:  Lab405AD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: AR_RXD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module AR_RXD_tf;

	// Inputs
	reg Inp1;
	reg Inp0;
	reg clk;

	// Outputs
	wire [7:0] sr_adr;
	wire [22:0] sr_dat;
	wire ce_wr;
	wire res;

	// Instantiate the Unit Under Test (UUT)
	AR_RXD uut (
		.Inp1(Inp1), 
		.sr_adr(sr_adr), 
		.Inp0(Inp0), 
		.sr_dat(sr_dat), 
		.clk(clk), 
		.ce_wr(ce_wr), 
		.res(res)
	);

	parameter Tclk=20; //Tclk=20ns
	always begin clk=1'b0; #(Tclk/2) clk=1'b1; #(Tclk/2); end
	
	parameter T_qm=20000;
	always begin QM=1'b0; #(T_qm/2) QM=1'b1; #(T_qm/2); end
	always begin Inp1 = QM&SDAT; end
	always begin Inp0 = QM&!SDAT; end
	
	initial begin
	#0; SDAT = 1;
	#40000; SDAT = 0;
	
	#100000; SDAT = 1;
	#140000; SDAT = 0;
	
	end
      
endmodule

