`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:29:48 02/16/2018
// Design Name:   MIL_TXD
// Module Name:   E:/FRTK/Dzis/Lab_406AD/MIL_TXD_tf.v
// Project Name:  Lab_406AD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MIL_TXD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MIL_TXD_tf;

	// Inputs
	reg clk;
	reg [15:0] dat;
	reg txen;

	// Outputs
	wire TXP;
	wire TXN;
	wire SY1;
	wire SY2;
	wire en_tx;
	wire T_dat;
	wire T_end;
	wire SDAT;
	wire FT_cp;
	wire [4:0] cb_bit;
	wire ce_tact;

	// Instantiate the Unit Under Test (UUT)
	MIL_TXD uut (
		.clk(clk), 
		.TXP(TXP), 
		.dat(dat), 
		.TXN(TXN), 
		.txen(txen), 
		.SY1(SY1), 
		.SY2(SY2), 
		.en_tx(en_tx), 
		.T_dat(T_dat), 
		.T_end(T_end), 
		.SDAT(SDAT), 
		.FT_cp(FT_cp), 
		.cb_bit(cb_bit), 
		.ce_tact(ce_tact)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		dat = 0;
		txen = 0;

		// Wait 100 ns for global reset to finish
      dat = 0; txen = 0; //
		#100; dat = 16'h6699; txen = 1; // my CW
		#10000; dat = 16'h2D0F; txen = 1; // my WD
		#24000; dat = 16'h0000; txen = 0;
		
	end
   parameter PERIOD = 20;
	always begin clk = 1'b0; #(PERIOD/2) clk = 1'b1; #(PERIOD/2); end
endmodule

