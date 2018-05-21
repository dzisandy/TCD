`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:27:24 03/29/2018
// Design Name:   Test_Sch_AR_RAD
// Module Name:   E:/FRTK/411/Burkina/Lab405AD/Test_SCH_AR_RAD_tf.v
// Project Name:  Lab405AD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Test_Sch_AR_RAD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_SCH_AR_RAD_tf;

	// Inputs
	reg clk;
	reg [1:0] Nvel;
	reg [7:0] ADR;
	reg [22:0] DAT;
	reg st;

	// Outputs
	wire ce_tx;
	wire TXD1;
	wire TXD0;
	wire SLP;
	wire en_tx_dat;
	wire T_cp_tx;
	wire FT_tx;
	wire SDAT;
	wire QM;
	wire [5:0] cb_bit_tx;
	wire en_tx_word;
	wire [22:0] sr_dat_rx;
	wire [7:0] sr_adr_rx;
	wire ce_wr;
	wire [4:0] cb_bit_rx;
	wire FT_cp_rx;
	wire res;

	// Instantiate the Unit Under Test (UUT)
	Test_Sch_AR_RAD uut (
		.clk(clk), 
		.ce_tx(ce_tx), 
		.Nvel(Nvel), 
		.TXD1(TXD1), 
		.ADR(ADR), 
		.TXD0(TXD0), 
		.DAT(DAT), 
		.SLP(SLP), 
		.st(st), 
		.en_tx_dat(en_tx_dat), 
		.T_cp_tx(T_cp_tx), 
		.FT_tx(FT_tx), 
		.SDAT(SDAT), 
		.QM(QM), 
		.cb_bit_tx(cb_bit_tx), 
		.en_tx_word(en_tx_word), 
		.sr_dat_rx(sr_dat_rx), 
		.sr_adr_rx(sr_adr_rx), 
		.ce_wr(ce_wr), 
		.cb_bit_rx(cb_bit_rx), 
		.FT_cp_rx(FT_cp_rx), 
		.res(res)
	);

	parameter Tclk=20; //Tclk=20ns
	always begin clk=1'b0; #(Tclk/2) clk=1'b1; #(Tclk/2); end
	initial begin
	st = 0; 
	Nvel = 1;
	ADR = 8'b00000000;
	DAT = 23'h000000;
	#1005; st = 1; Nvel = 1; ADR = 8'b11111111; DAT = 23'h111111;
	#20; st = 0; Nvel = 1; ADR = 8'b11111111; DAT = 23'h111111;
	
	#720005; st = 1; Nvel = 1; ADR = 8'b10000010; DAT = 23'h567800;
	#20; st = 0; Nvel = 1; ADR = 8'b10000010; DAT = 23'h567800;
	end
      
endmodule

