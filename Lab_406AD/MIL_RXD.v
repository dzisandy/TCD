`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:04:45 03/16/2018 
// Design Name: 
// Module Name:    MIL_RXD 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MIL_RXD( input In_P,		output wire RXN,
					 input In_N,		output wire RXP,
					 input clk,			output wire D_RXN,
											output wire D_RXP,
											output wire ok_SY_DW,
											output wire ok_SY_CW,
											output reg [6:0] cb_tact=0,
											output wire dRXPN,
											output wire en_wr,
											output wire ce_bit,
											output wire we_bit,
											output wire ce_tact,
											output reg sr_dat = 0, 
											output reg en_rx = 0,
											output reg T_dat_rx = 0,
											output wire T_end,
											output reg [15:0] data = 0,
											output reg FT_cp = 0,
											output wire ok_rx
											
											
											
    );
	
	reg [1:0] P_delay = {0, 0};
	reg [1:0] N_delay = {0, 0};
	reg [74:0] sr_RXN = 0;
	reg [74:0] sr_RXP = 0;
	reg [7:0] cb_SY_DW = 0;
	reg [7:0] cb_SY_CW = 0;
	wire DW_detect;
	wire CW_detect;
	reg [6:0] cb_we_bit = 0;
	reg [6:0] cb_ce = 0;
	reg [6:0] cb_rx_bit = 0;
	
	
	always @(posedge clk) begin
		P_delay <= P_delay << 1;
		P_delay[0] <= In_P;
		N_delay <= N_delay << 1;
		N_delay[0] <= In_N;
		sr_RXN <= sr_RXN << 1;
		sr_RXN[0] <= RXN;
		sr_RXP <= sr_RXP << 1;
		sr_RXP[0] <= RXP;
		
		cb_we_bit <= ce_bit ? 0 : cb_we_bit + 1;
		//DW and CW detecting
		cb_SY_DW <= DW_detect ? cb_SY_DW + 1 : !DW_detect ? 0 : cb_SY_DW;
		cb_SY_CW <= CW_detect ? cb_SY_CW + 1 : !CW_detect ? 0 : cb_SY_CW;
		
		//cb_tact configure
		cb_tact <= ce_bit ? 25 : ce_tact ? 0 : cb_tact + 1;
		cb_ce <= (ce_tact & (cb_ce < 20)) ? cb_ce + 1 : 0;
		
		//Read data
		en_rx <= (ok_SY_DW | ok_SY_CW) ? 1 : cb_rx_bit == 17 ? 0 : en_rx;
		T_dat_rx <= (ok_SY_DW | ok_SY_CW) ? 1 : cb_rx_bit == 16 ? 0 : T_dat_rx;//

		cb_rx_bit <= (ok_SY_DW | ok_SY_CW) ? 0 : ce_tact ? cb_rx_bit + 1 : cb_rx_bit;
		sr_dat = en_rx & we_bit & RXP ? 0 : en_rx & we_bit & !RXP ? 1 : en_rx ? sr_dat : 0;
		FT_cp <= (ok_SY_DW | ok_SY_CW) ? 1 : (T_dat_rx & we_bit & sr_dat) ? !FT_cp : FT_cp;//
		
		data <= (T_dat_rx & cb_we_bit == 12) ? (data << 1)|sr_dat : data;
		
	end
	
	//Delayed signals
	assign RXN = N_delay[1];
	assign RXP = P_delay[1];
	assign D_RXN = sr_RXN[74];
	assign D_RXP = sr_RXP[74];
	
	//DW and CW detection
	assign DW_detect = RXP & D_RXN;
	assign CW_detect = RXN & D_RXP;	
	assign ok_SY_DW = cb_SY_DW >= 70;
	assign ok_SY_CW = cb_SY_CW >= 70;
	
	//Correcting time
	assign dRXPN = (In_P & ! RXP) | (!In_P & RXP);
	assign en_wr = (cb_tact > 21 ) & (cb_tact < 28);
	assign ce_bit = en_wr & dRXPN;
	assign we_bit = cb_we_bit == 12;
	assign ce_tact = cb_tact == 49;
	assign T_end = cb_rx_bit == 16;
	assign ok_rx = T_end & !(sr_dat ^ FT_cp); //	
endmodule
