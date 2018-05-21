`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:17:34 03/22/2018 
// Design Name: 
// Module Name:    AR_TXD 
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
module AR_TXD (
input clk, output wire ce_tact, // Скорость (Tce=1/Vel)
input [1:0] Nvel, output wire TXD1, //Импульсы канала 1
input [7:0] ADR, output wire TXD0, //Импульсы канала 0
input [22:0]DAT, output wire SLP, // Крутизна фронтов
input st, output reg en_tx =0, // Интервал передачи данных
output wire T_cp, // Такт контрольного бита
output reg FT_cp=0, // Триггер контроля четности
output wire SDAT, // Последовательные данные
output reg QM=0, // Модулятор
output reg[5:0]cb_bit=0, //Счетчик бит
output reg en_tx_word=0); /*Интервал передачи слова (32+4 такта)*/

parameter Fclk=50000000 ; //50 MHz
parameter V1Mb=1000000 ; // 1000 kb/s
parameter V100kb=100000 ; // 100 kb/s
parameter V50kb= 50000 ; // 50 kb/s
parameter V12_5kb=12500 ; // 12.5 kb/s
wire [10:0]AR_Nt = (Nvel [1:0]==3)? (Fclk/(2*V1Mb)) : //1000.000 kb/s
(Nvel [1:0]==2)? (Fclk/(2*V100kb)) : // 100.000 kb/s
(Nvel [1:0]==1)? (Fclk/(2*V50kb)) : // 50.000 kb/s
(Fclk/(2*V12_5kb)); // 12.500 kb/s
reg [10:0]cb_ce=0 ; // Счетчик полутакта
reg [ 7:0]sr_adr=0 ; // Регистр сдвига адреса
reg [22:0]sr_dat=0 ; // Регистр сдвига данных
wire ce = (cb_ce==AR_Nt); // Tce=1/(2*VEL)
assign ce_tact = ce & QM ; // Tce_tact=2* Tce =1/VEL
assign T_cp = (cb_bit==31) ; // Такт контрольного бита
wire T_adr_dat = en_tx & !T_cp ; // Интервал адреса и данных
wire ce_end_word = (cb_bit==35) & ce_tact ; //Импульс конца слова
assign SDAT = sr_adr[7] | (T_cp & FT_cp) ; //Последовательные данные
assign TXD1 = en_tx & QM & SDAT ; //Импульсы канала 1
assign TXD0 = en_tx & QM & !SDAT ; //Импульсы канала 0
assign SLP = (Nvel ==0) ; // Крутизна фронтов
wire start = st & !en_tx_word ; // Запрет запуска пока идет передача слова

always @ (posedge clk) begin
cb_ce <= (start | ce)? 1 : cb_ce+1 ;
QM <= start? 0 : (en_tx_word & ce)? !QM : QM ; //Переключение триггера модулятора
cb_bit <= start? 0 : (en_tx_word & ce_tact)? cb_bit+1 : cb_bit ; //Счет бит
en_tx_word <= start? 1 : ce_end_word? 0 : en_tx_word ; /*Формирование интервала передачи с паузой*/
en_tx <= start? 1 : (T_cp & ce_tact)? 0 : en_tx; //Формирование интервала передачи данных
FT_cp <= start? 1: (sr_adr[7] & ce_tact & T_adr_dat)? !FT_cp : FT_cp ; /*Счет четности*/
sr_adr <= start? ADR : (ce_tact & en_tx)? sr_adr <<1 | sr_dat[0] : sr_adr ; /*Сдвиг адреса старшими битами вперед*/
sr_dat <= start? DAT : (ce_tact & en_tx)? sr_dat >>1 : sr_dat ; /*Сдвиг данных младшими битами вперед */
end

endmodule
