------------------------------------------------------------------------
-- Company: Digilent Inc.
-- Engineer: Mircea Dabacan
--
-- Create Date:    11:27:54 04/15/05
-- Design Name:    Phoenix ShortCutTest
-- Module Name:    PinDrivers - Behavioral
-- Project Name:   
-- Target Device:  XC2S200, f256
-- Tool versions:  WebPack 7.1.01i
-- Description:

-- The file implements IO drivers for XC3S500 / XC3S1200 FPGA (fg320) IO pins:
--           pIO : inout std_logic_vector(67 downto 0);
-- They can be written or read as bytes to or from registers 0x80 - …0x96:
-- reg 0x80 or 0x81 - BTN, 7Seg 	-	BTN3, BTN2, BTN1, BTN0, R-RxTx, R-RxRx, R-Ps2C, R-PS2D
-- reg 0x82 or 0x83 - Switch		- 	SW7, SW6, SW5, SW4, SW3, SW2, SW1, SW0
-- reg 0x88 or 0x89 - FX2 			-	IO15,13,11,9,7,5,3,1
-- reg 0x8a or 0x8b - FX2 			-	IO16,14,12,10,8,6,4,2
-- reg 0x8c or 0x8d - FX2 			-	IO31,29,27,25,23,21,19,17
-- reg 0x8e or 0x8f - FX2 			-	IO32,30,28,26,24,22,20,18
-- reg 0x90 or 0x91 - FX2 			-	IO40,38,36,34,39,37,35,33
-- reg 0x92 or 0x93 - 2*6pin		-	JA10, JA9, JA8, JA7, JA4, JA3, JA2, JA1
-- reg 0x94 or 0x95 - 2*6pin		-	JB10, JB9, JB8, JB7, JB4, JB3, JB2, JB1
-- reg 0x96 or 0x97 - 2*6pin		-	JC10, JC9, JC8, JC7, JC4, JC3, JC2, JC1
-- reg 0x98 or 0x99 - VGA, 2*6pin-	VSYNC, HSYNC, JD8, JD7, JD4, JD3, JD2, JD1
-- reg 0x9a or 0x9b - VGA			-	RED2, RED1, RED0, GRN2, GRN1, GRN0, BLU2, BLU1 

-- The IO drivers are shortcut-protected.

--	The SW and BTN state can be read with this module, .

-- The file is used together with communication modules and PC software
-- to implement a shortcut test for the target board. 
-- The PC software has to:
	-- set a test vector of 68 bits (all '1's)
	-- send the test vector (byte-wise) to registers 0x80...0x9b, via USB
	-- read same registers and compare to the original test vector.
	-- loop the previous steps 64 more times, with a moving '0' as test 
   -- vector. 
--
-- Dependencies:
-- 
-- Revision 0.01 - File Created for D2SB
--				0.02 - File modified for S3E Starter Board
--          0.03 - File modified for Phoenix Board
--          0.04 - File truncated to allow just read of BTN asn SW
--          0.05 - Pin drivers for Fx2, J and LCD connectors added back
--				08/20/2007 (TudorC): modified to work with Nexys2 Board, added rs232, ps2 and
--											VGA signals (Xilinx ISE 9.2i)
--											
-- Additional Comments:
-- 
------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PinDrivers is
    Port ( ck : in std_logic;									-- sys clk: 50Mhz
	        busIn : in std_logic_vector(7 downto 0);	-- data bus input
           busOut : out std_logic_vector(7 downto 0); -- data bus output
           wr : in std_logic;									-- write cycle
           adrIn : in std_logic_vector(7 downto 0);	-- Epp address
           compSel : in std_logic;							-- component select
           btn : in std_logic_vector(3 downto 0); 		-- button input
           sw : in std_logic_vector(7 downto 0); 		-- switch input
			  rsRx : in std_logic;                    	-- RS232 RX signal
			  rsTx : inout std_logic;                 	-- RS232 TX signal
			  ps2C : inout std_logic;                    -- PS2 Clock signal
			  ps2D : inout std_logic;                   	-- PS2 Data signal
			  pIO : inout std_logic_vector(67 downto 0); -- IO drivers
			  rgbOut: out std_logic_vector(7 downto 0);	-- rgb signal for vga
																		-- RED - rgbOut(7 downto 5)
																		-- GRN - rgbOut(4 downto 2)
																		-- BLU -	rgbOut(1 downto 0)
			  syncOut: out std_logic_vector(1 downto 0);	-- h/v sycronization signal for vga
																		--hsync - syncOut(0)
																		-- vsync - syncOut(1)
			  demoEn: in std_logic
	); 
	



end PinDrivers;

architecture Behavioral of PinDrivers is
	signal pIOInt : std_logic_vector(67 downto 0):=
				"1111"&x"FFFF"&x"FFFF"&x"FFFF"&x"FFFF";
	signal ps2Int: std_logic_vector(1 downto 0):= "11";
	
begin
-- Combinatorial busOut
	busOut <= "00000000"	when compSel = '0' else  -- prepared for OR-ing 
	                                              -- when not selected
	         btn(3 downto 0) & rsTx & rsRx & ps2C & ps2D when adrIn(4 downto 1) = "0000" else
				sw	(7 downto 0)     when adrIn(4 downto 1) = "0001" else
				pIO(7 downto 0)     when adrIn(4 downto 1) = "0100" else
				pIO(15 downto 8)    when adrIn(4 downto 1) = "0101" else
				pIO(23 downto 16)   when adrIn(4 downto 1) = "0110" else
				pIO(31 downto 24)   when adrIn(4 downto 1) = "0111" else
				pIO(39 downto 32)   when adrIn(4 downto 1) = "1000" else
				pIO(47 downto 40)   when adrIn(4 downto 1) = "1001" else
				pIO(55 downto 48)   when adrIn(4 downto 1) = "1010" else
				pIO(63 downto 56)   when adrIn(4 downto 1) = "1011" else
				"0000" & pIO(67 downto 64)   when (adrIn(4 downto 1) = "1100") else
				"00000000";	-- prepared for OR-ing

-- Output Latches	
	outLatch: process(ck, wr) is
	begin
		if ck'event and ck = '1' then	
			if wr = '1' and compSel = '1' then  -- component selected
				if adrIn(5 downto 1) = "00000" then 
					rsTx <= busIn(3);    -- setting a value for RS232 TX
					ps2Int<=busIn(1 downto 0);
				elsif adrIn(5 downto 1) = "00100" then 
					pIOInt(7 downto 0) <= busIn;
				elsif adrIn(5 downto 1) = "00101" then 
					pIOInt(15 downto 8) <= busIn;
				elsif adrIn(5 downto 1) = "00110" then 
					pIOInt(23 downto 16) <= busIn;
				elsif adrIn(5 downto 1) = "00111" then 
					pIOInt(31 downto 24) <= busIn;
				elsif adrIn(5 downto 1) = "01000" then 
					pIOInt(39 downto 32) <= busIn;
				elsif adrIn(5 downto 1) = "01001" then 
					pIOInt(47 downto 40) <= busIn;
				elsif adrIn(5 downto 1) = "01010" then 
					pIOInt(55 downto 48) <= busIn;
				elsif adrIn(5 downto 1) = "01011" then 
					pIOInt(63 downto 56) <= busIn;
				elsif adrIn(5 downto 1) = "01100" then 
					pIOInt(67 downto 64) <= busIn(3 downto 0);
					syncOut <= busIn(5 downto 4);
				elsif adrIn(5 downto 1) = "01101" then 
					rgbOut <= busIn;
				else			
					null;
				end if;
			end if;
		end if;
	end process;

-- Combinatorial Output buffers
	outBuf: process(wr, pIOInt, ps2Int, demoEn) is
	begin
		for i in 0 to 67 loop		
			if pIOInt(i) = '0' then
				pIO(i) <= 'L';
			else
				pIO(i) <= 'Z';
			end if;	
		end loop;
		 
		if ps2Int(1) = '0' and demoEn = '1' then
			ps2C <= 'L';
		else
			ps2C <= 'Z';
		end if;
		if ps2Int(0) = '0' and demoEn = '1' then
			ps2D <= 'L';
		else
			ps2D <= 'Z';
		end if;
	end process;


end Behavioral;
