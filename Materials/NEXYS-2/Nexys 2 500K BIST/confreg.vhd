----------------------------------------------------------------------------------
-- Company: 			DigilentRO
-- Engineer: 			Tudor Armand Ciuleanu
-- 
-- Create Date:    	11:00:32 07/23/2007 
-- Design Name: 		
-- Module Name:		confReg - Behavioral 
-- Project Name: 		Nexys2BIST
-- Target Devices:	XC3S500 
-- Tool versions: 	Xilinx ISE 9.2i
-- Description: Sets demo enable depending on the last bit of the configuration register
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ConfReg is
    Port ( CompSel : in  STD_LOGIC;
           busIn : 	in  STD_LOGIC_VECTOR (7 downto 0);
           Wr : 		in  STD_LOGIC;
			  ck : 		in  STD_LOGIC;
			  DemoEn : 	out  STD_LOGIC);
end ConfReg;

architecture Behavioral of ConfReg is
signal configReg : std_logic_vector(7 downto 0):= x"00";
begin

DemoEn <= configReg(0);

enLatch: process(ck, Wr) is
	begin	
		if ck'event and ck = '1' then	
			if Wr = '1' and CompSel='1' then
				configReg <= busIn;
			end if;
		end if;
	end process;
end Behavioral;