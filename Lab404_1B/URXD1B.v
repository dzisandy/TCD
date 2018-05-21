`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:30:46 04/26/2018 
// Design Name: 
// Module Name:    URXD1B 
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
module URXD1B(
input Inp,
input clk,

output reg en_rx_byte = 0,
output reg [7:0]sr_dat = 0,
output reg [13:0] cb_bit = 0,
output wire T_start,
output wire start,
output wire T_stop,
output wire T_dat,
output wire ok_rx_byte,
output wire ce_tact,
output wire ce_bit,
output wire URXD
 );
reg tURXD = 0;
reg ttURXD = 0;
wire dRXD ;
assign URXD = tURXD;
reg [15:0]cb_tact = 0;

parameter Fclk = 50000000;
parameter VEL = 115200;
parameter Nt = Fclk/VEL ;

assign ce_tact = (cb_tact == Nt) ;
assign T_start = (cb_bit == 0) ; 
assign T_dat = (cb_bit<9) & (cb_bit>0);
assign T_stop = (cb_bit==9);
assign ok_rx_byte = URXD & T_stop & ce_bit ;
assign start =  dRXD & !en_rx_byte ;
assign ce_bit = (cb_tact == Nt/2);
assign dRXD = !tURXD & ttURXD; 

always@ (posedge clk) begin 
tURXD <= Inp;
ttURXD <= tURXD;
cb_tact <= (start | ce_tact)? 1: cb_tact+1;
en_rx_byte <= (!URXD & ce_bit & T_start)? 1: (T_stop & ce_bit)? 0: en_rx_byte;
cb_bit <= start? 0: (ce_tact & en_rx_byte) ? cb_bit +1 : cb_bit;
sr_dat <= (T_dat & ce_bit)? sr_dat <<1 | URXD: sr_dat ;
end 

endmodule