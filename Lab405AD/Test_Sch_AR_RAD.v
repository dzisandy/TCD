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
module Test_Sch_AR_RAD( //������ �����������
input clk, output wire ce_tx, // �������� (Tceo=1/Vel)
input [1:0]Nvel, output wire TXD1, //�������� ������ 1
input [7:0]ADR, output wire TXD0, //�������� ������ 0
input [22:0]DAT, output wire SLP, // �������� �������
input st, output wire en_tx_dat, // �������� �������� ������
output wire T_cp_tx, // ���� ����� �����
output wire FT_tx, // ������� �������� ��������
output wire SDAT, // ���������������� ������
output wire QM, // ���������
output wire [5:0]cb_bit_tx, //������� ��� �����������
output wire en_tx_word, //�������� �������� �����
//������ ���������
output wire[22:0] sr_dat_rx, //������� ������ ������
output wire[ 7:0] sr_adr_rx, //������� ������ ������
output wire ce_wr, //���������� ������ ��������� �����
output wire [4:0]cb_bit_rx, // ������� ��� ���������
//output wire T_cp, // �������� ������������ ����
//output wire en_rx, //�������� ������ �����
output wire FT_cp_rx, //T-������� �������� ��������
//output wire ok_rx, //���������� ����� �����
//output wire [15:0]cb_res,// ������� �����
output wire res //������� ������
);

// ������ �����������
AR_TXD DD1 (
.clk(clk), .ce_tact(ce_tx), // �������� (Tceo=1/Vel)
.Nvel(Nvel), .TXD1(TXD1), //�������� ������ 1
.ADR(ADR), .TXD0(TXD0), //�������� ������ 0
.DAT(DAT), .SLP(SLP), // �������� �������
.st(st), .en_tx (en_tx_dat), // �������� �������� ������
.T_cp(T_cp_tx), // ���� ����� �����
.FT_cp(FT_tx), // ������� �������� ��������
.SDAT(SDAT), // ���������������� ������
.QM(QM), // ���������
.cb_bit(cb_bit_tx), //������� ���
.en_tx_word(en_tx_word)); //�������� �������� �����
// ������ ���������
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
