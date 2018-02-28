--------------------------------------------------------------------------------
-- Company:   Digilent Ro
-- Engineer:  Mircea Dabacan
--
-- Create Date:    16:28:09 10/29/06
-- Design Name:    
-- Module Name:    gnd10 - Behavioral
-- Project Name:   
-- Target Device:  
-- Tool versions:  
-- Description:	 10 bit gnd
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

entity gnd10 is
    Port ( busGnd : out std_logic_vector(9 downto 0));
end gnd10;

architecture Behavioral of gnd10 is

begin
busGnd <= "0000000000";

end Behavioral;
