---------------------------------------------------------------------------------------
-- Company: Digilent RO
-- Engineer: Mircea Dabacan
--
-- Create Date: 16:09:51 07/06/06
-- Design Name: Nexys2 board demo 
-- Module Name: dispMux - Behavioral
-- Project Name:   
-- Target Device:  XC3S500E
-- Tool versions:  Xilinx ISE 9.2
-- Description: This module is a kind of Mux. Selects the soruce for the 7 Segment Display outputs.
--				  	There are two input sources seg1, an1, dp1 and seg2, an2, dp2. The inputs from
--					the first source are used at outputs until one button is pressed or the state
--					of one switch is changed. Then the second input source will be shown on the
--					7 Segment Display.
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DispMux is
    Port ( ck 		: in std_logic;							--clock input
           sw 		: in std_logic_vector(7 downto 0);	--switch input
           btn 	: in std_logic_vector(3 downto 0);	--button input
           seg1 	: in std_logic_vector(6 downto 0);	--cathode input from first source
           an1 	: in std_logic_vector(3 downto 0); 	--anode input from first source
           dp1 	: in std_logic;							--enable from first source
           seg2 	: in std_logic_vector(6 downto 0);	--cathode input from second source
           an2 	: in std_logic_vector(3 downto 0);	--anode input from second source
           dp2 	: in std_logic;							--enable from second source
           seg 	: out std_logic_vector(6 downto 0); --cathode output
           an 		: out std_logic_vector(3 downto 0);	--anode output
           dp 		: out std_logic							--decimal point output
			  );
end DispMux;

architecture Behavioral of DispMux is

signal swOld: std_logic_vector(7 downto 0);
signal btnOld: std_logic_vector(3 downto 0);
signal sel: std_logic := '0';
signal init: integer range 0 to 7 := 0;

begin
	seg <= seg1 when sel = '0' else
			 seg2;
	an <= an1 when sel = '0' else
		   an2;
	dp <= dp1 when sel = '0' else
			dp2;

	selProc: process(ck)
	begin
		if ck'event and ck = '1' then
			swOld <= sw;
			btnOld <= btn;
			if init /= 7 then 
				init <= init + 1;
				sel <= '0';
			end if;
			if init = 7 and (swOld /= sw or btnOld /= btn) then
				sel <= '1';
				null;
			end if;
		end if;
	end process;

end Behavioral;
