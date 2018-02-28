------------------------------------------------------------------------
--  Bus8Or.vhd -- 8 two-input OR gates
------------------------------------------------------------------------
--  Author : Mircea Dabacan
--           Copyright 2004 Digilent, Inc.
------------------------------------------------------------------------
-- Software version: Xilinx ISE 6.2.03i
--                   WebPack
------------------------------------------------------------------------
--	This file performs a bit-by-bit OR of two 8-bit busses.
------------------------------------------------------------------------
-- Revision History:
--	10/21/2004(MirceaD): created
------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Bus8Or is
    Port ( D1In : in std_logic_vector(7 downto 0);
           D2In : in std_logic_vector(7 downto 0);
           D3In : in std_logic_vector(7 downto 0);
           DOut : out std_logic_vector(7 downto 0)
			  );
end Bus8Or;

architecture Behavioral of Bus8Or is

begin
DOut <= D1In or D2In or D3In;

end Behavioral;
