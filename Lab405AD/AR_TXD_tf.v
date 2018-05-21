`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:23:07 03/22/2018
// Design Name:   AR_TXD
// Module Name:   E:/FRTK/411/Burkina/Lab405AD/AR_TXD_tf.v
// Project Name:  Lab405AD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: AR_TXD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module AR_TXD_tf;

	// Inputs
	reg clk;
	reg [1:0] Nvel;
	reg [7:0] ADR;
	reg [22:0] DAT;
	reg st;

	// Outputs
	wire ce_tact;
	wire TXD1;
	wire TXD0;
	wire SLP;
	wire en_tx;
	wire T_cp;
	wire FT_cp;
	wire SDAT;
	wire QM;
	wire [5:0] cb_bit;
	wire en_tx_word;

	// Instantiate the Unit Under Test (UUT)
	AR_TXD uut (
		.clk(clk), 
		.ce_tact(ce_tact), 
		.Nvel(Nvel), 
		.TXD1(TXD1), 
		.ADR(ADR), 
		.TXD0(TXD0), 
		.DAT(DAT), 
		.SLP(SLP), 
		.st(st), 
		.en_tx(en_tx), 
		.T_cp(T_cp), 
		.FT_cp(FT_cp), 
		.SDAT(SDAT), 
		.QM(QM), 
		.cb_bit(cb_bit), 
		.en_tx_word(en_tx_word)
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
		#1020; st = 1;
		#1021; st = 0;
		
		
		#720005; st = 1; Nvel = 1; ADR = 8'b10000010; DAT = 23'h567800;
		#20; st = 0; Nvel = 1; ADR = 8'b10000010; DAT = 23'h567800;
		end

      
endmodule

