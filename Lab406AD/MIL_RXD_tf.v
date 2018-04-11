`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:21:52 03/16/2018
// Design Name:   MIL_RXD
// Module Name:   E:/FRTK/Dzis/Lab_406AD/MIL_RXD_tf.v
// Project Name:  Lab_406AD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MIL_RXD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MIL_RXD_tf;

	// Inputs
	reg clk_rx;

	// Outputs
	wire RXN;
	wire RXP;
	wire D_RXN;
	wire D_RXP;
	wire ok_SY_DW;
	wire ok_SY_CW;
	wire [6:0] cb_tact;
	wire dRXPN;
	wire en_wr;
	wire ce_bit;
	wire we_bit;
	wire ce_tactRx;
	wire sr_dat;
	wire en_rx;
	wire T_dat_rx;
	wire T_endRx;
	wire[15:0] rx_dat; 
	wire FT_cp_rx;
	wire ok_rx; 
	// Instantiate the Unit Under Test (UUT)
	MIL_RXD uut1 (
		.In_P(TXP), 
		.RXN(RXN), 
		.In_N(TXN), 
		.RXP(RXP), 
		.clk(clk_rx), 
		.D_RXN(D_RXN), 
		.D_RXP(D_RXP), 
		.ok_SY_DW(ok_SY_DW), 
		.ok_SY_CW(ok_SY_CW),
		.cb_tact(cb_tact),
		.dRXPN(dRXPN),
		.en_wr(en_wr),
		.ce_bit(ce_bit),
		.we_bit(we_bit), 
		.ce_tact(ce_tactRx), 
		.sr_dat(sr_dat),
		.en_rx(en_rx),
		.T_dat_rx(T_dat_rx),
		.T_end(T_endRx),
		.data(rx_dat),
		.FT_cp(FT_cp_rx),
		.ok_rx(ok_rx)
	);
	
	//Inputs
	reg [15:0] dat;
	reg txen;
	reg clk;
	
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
		#100;
        
		// Add stimulus here
		
      dat = 0; txen = 0; //
		#100; dat = 16'h9ABC; txen = 1; // my CW
		#10000; dat = 16'h6523; txen = 1; // my WD
		#24000; dat = 16'h0000; txen = 0;

	end
	parameter PERIOD1 = 20;
   parameter PERIOD = 20;
	always begin clk = 1'b0; #(PERIOD/2) clk = 1'b1; #(PERIOD/2); end
	//always begin clk_rx = 1'b0; #9.8 clk_rx = 1'b1; #9.8; end
	always begin clk_rx = 1'b0; #10 clk_rx = 1'b1; #10; end
	//always begin clk_rx = 1'b0; #10.3 clk_rx = 1'b1; #10.3; end	
	 	
endmodule

