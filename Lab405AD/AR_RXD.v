`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:26:53 03/22/2018 
// Design Name: 
// Module Name:    AR_RXD 
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
`define threshold 3001
module AR_RXD (input Inp1,	output reg [7:0] sr_adr = 0,
					input Inp0,	output reg [22:0] sr_dat = 0,
					input clk,  output reg ce_wr = 0, 
									output wire res,
									output reg[4:0]cb_bit = 0, //T-триггер контроля четности
									output reg FT_ct = 0);//счетчик бит 


reg[15:0]cb_res = 0; //счетчик паузы

reg ok_rx=0; 

wire RXCLK = Inp1|Inp0;
reg T_cp = 0;
reg tRXCLK = 0, ttRXCLK = 0;

assign res = (cb_res == `threshold);
wire ce_tact = (tRXCLK & !ttRXCLK);

always @(posedge clk) begin

tRXCLK <= RXCLK;
ttRXCLK <= tRXCLK;
T_cp <= ce_tact&(cb_bit == 31) ? 1 : 0;

cb_res <= (ce_tact | res) ? 0: cb_res+1;

cb_bit <= res ? 0 : ce_tact ? cb_bit + 1 : cb_bit;
sr_adr <= (ce_tact & (cb_bit == 0)) ? Inp1 : (ce_tact & (cb_bit < 8)) ? ((sr_adr<<1)|Inp1) : sr_adr;
sr_dat <= (ce_tact & (cb_bit == 0)) ? 0 : (ce_tact & (cb_bit >7) & (cb_bit < 31 )) ? ((sr_dat>>1)|(Inp1 << 22)) : sr_dat;
FT_ct <= res ? 0 : (Inp1 & ce_tact) ? !FT_ct : FT_ct;
ok_rx <= res? 0:T_cp? FT_ct : ok_rx;
ce_wr <= (cb_bit == 0) ? ok_rx : 0;


end
endmodule
