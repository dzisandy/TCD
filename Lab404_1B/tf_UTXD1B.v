`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:25:06 04/26/2018
// Design Name:   UTXD1B
// Module Name:   G:/Dzis/404_1B/Lab404_1B/tf_UTXD1B.v
// Project Name:  Lab404_1B
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UTXD1B
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tf_UTXD1B;

	// Inputs
	reg clk;
	reg [7:0] dat;
	reg st;

	// Outputs
	wire UTXD;
	wire ce_tact;
	wire en_tx_byte;
	wire [3:0] cb_bit;
	wire T_start;
	wire T_dat;
	wire T_stop;
	wire ce_stop;
	wire [7:0] sr_dat;

	// Instantiate the Unit Under Test (UUT)
	UTXD1B uut (
		.clk(clk), 
		.UTXD(UTXD), 
		.dat(dat), 
		.ce_tact(ce_tact), 
		.st(st), 
		.en_tx_byte(en_tx_byte), 
		.cb_bit(cb_bit), 
		.T_start(T_start), 
		.T_dat(T_dat), 
		.T_stop(T_stop), 
		.ce_stop(ce_stop), 
		.sr_dat(sr_dat)
	);

	initial begin
		// Initialize Inputs
		st = 0 ; dat = 0 ;
		#1000; st = 1; dat = 8'b10000001; // my tx_dat (из таблицы 1)
		#20; st = 0;
		
		always begin clk = 1'b1; #10; end // PERIOD = 20
	 //always begin rx_clk = 1'b0; #10.4 rx_clk = 1'b1; #10.4; end // PERIOD = 20.8
    //always begin rx_clk = 1'b0; #9.7 rx_clk = 1'b1; #9.7; end // PERIOD = 19.4
	end
      
endmodule

