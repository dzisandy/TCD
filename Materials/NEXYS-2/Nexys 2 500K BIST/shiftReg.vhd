--------------------------------------------------------------------------------
-- Company: Mircea Dabacan
-- Engineer:
--
-- Create Date:    17:35:37 08/27/06
-- Design Name:    
-- Module Name:    BlockRam - Behavioral
-- Project Name:   
-- Target Device:  
-- Tool versions:  
-- Description:
--
-- Dependencies: Inputs one on the data bus input and outputs 6 bytes on the
--						output bus. The input bytes are shifted into the ShiftReg6 vector.
--						After shifting 6 bytes into the shift register the output
--						stream is ready.
--						
-- Revision:
-- Revision 0.01 - (MirceaD) File Created
--				0.02 - (TudorC) Made the shift register synchronous on the clock input  
-- Additional Comments:
-- 
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ShiftReg is
    Port ( ck : in std_logic;								-- sys clk: 50Mhz
	        busIn : in std_logic_vector(7 downto 0);-- data bus input
           Wr : in std_logic;								-- write cycle
           CompSel : in std_logic;						-- component select
           Stream6Bytes : out std_logic_vector(47 downto 0)
			  ); 
end ShiftReg;

architecture Behavioral of ShiftReg is

signal ShiftReg6: std_logic_vector(47 downto 0); 
begin

-- Shift register 6 bytes	
	ShiftReg: process(ck, Wr) is
	begin
		if ck'event and ck = '1' then	
			if Wr = '1' and CompSel = '1' then  -- write cycle and component selected
				--busIn byte is put onto the last position of the shift register
				--and the contents of ShiftReg6 is shifted left 8 bits.
				ShiftReg6(7 downto 0) <= busIn; 
				ShiftReg6(15 downto 8) <= ShiftReg6(7 downto 0);
				ShiftReg6(23 downto 16) <= ShiftReg6(15 downto 8);
				ShiftReg6(31 downto 24) <= ShiftReg6(23 downto 16);
				ShiftReg6(39 downto 32) <= ShiftReg6(31 downto 24);
				ShiftReg6(47 downto 40) <= ShiftReg6(39 downto 32);
			else 
				null;
			end if;
		end if;
	end process;

Stream6Bytes <= ShiftReg6;

end Behavioral;
