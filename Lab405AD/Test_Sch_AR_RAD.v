`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:40:11 03/29/2018 
// Design Name: 
// Module Name:    Test_Sch_AR_RAD 
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
module Test_Sch_AR_RAD( //Выходы передатчика
input clk, output wire ce_tx, // Скорость (Tceo=1/Vel)
input [1:0]Nvel, output wire TXD1, //Импульсы канала 1
input [7:0]ADR, output wire TXD0, //Импульсы канала 0
input [22:0]DAT, output wire SLP, // Крутизна фронтов
input st, output wire en_tx_dat, // Интервал передачи данных
output wire T_cp_tx, // Такт конца кадра
output wire FT_tx, // Триггер контроля четности
output wire SDAT, // Последовательные данные
output wire QM, // Модулятор
output wire [5:0]cb_bit_tx, //Счетчик бит передатчика
output wire en_tx_word, //Интервал передачи слова
//Выходы приемника
output wire[22:0] sr_dat_rx, //Регистр сдвига данных
output wire[ 7:0] sr_adr_rx, //Регистр сдвига адреса
output wire ce_wr, //Разрешение записи принятого слова
output wire [4:0]cb_bit_rx, // Счетчик бит приемника
//output wire T_cp, // Интервал контрольного бита
//output wire en_rx, //Интервал приема слова
output wire FT_cp_rx, //T-триггер контроля четности
//output wire ok_rx, //Правильный прием слова
//output wire [15:0]cb_res,// Счетчик паузы
output wire res //Импульс сброса
);

// Модуль передатчика
AR_TXD DD1 (
.clk(clk), .ce_tact(ce_tx), // Скорость (Tceo=1/Vel)
.Nvel(Nvel), .TXD1(TXD1), //Импульсы канала 1
.ADR(ADR), .TXD0(TXD0), //Импульсы канала 0
.DAT(DAT), .SLP(SLP), // Крутизна фронтов
.st(st), .en_tx (en_tx_dat), // Интервал передачи данных
.T_cp(T_cp_tx), // Такт конца кадра
.FT_cp(FT_tx), // Триггер контроля четности
.SDAT(SDAT), // Последовательные данные
.QM(QM), // Модулятор
.cb_bit(cb_bit_tx), //Счетчик бит
.en_tx_word(en_tx_word)); //Интервал передачи слова
// Модуль приемника
AR_RXD DD2 ( .Inp0(TXD0), .sr_dat(sr_dat_rx),
.Inp1(TXD1), .sr_adr(sr_adr_rx),
.clk(clk), .ce_wr(ce_wr),
.cb_bit(cb_bit_rx),
//.T_cp(T_cp_rx),
//.en_rx(en_rx),
.FT_ct(FT_cp_rx),
//. ok_rx(ok_rx),
//. cb_res(cb_res),
.res(res)
);

endmodule
