--------------------------------------------------------------------------------
-- Company: Digilent RO
-- Engineer: Attila Kovacs
--
-- Create Date:    11:22:20 08/28/06
-- Design Name:    Nexys 2 Test
-- Module Name:    EppSyncMux - Behavioral
-- Project Name:   
-- Target Device:  XC3S500E
-- Tool versions:  Xilinx ISE 9.2
-- Description: 2:1 mux with three state outputs (8 bit vectors). 
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity EppSyncMux is
   Port ( 
      UsbMode  : in std_logic;
      UsbDir   : in std_logic;
      UsbRD    : out std_logic;
      UsbDB    : inout std_logic_vector(7 downto 0);

      EppWr 	: in  std_logic;
      EppWait  : in std_logic;
      BlockRamRd  : in std_logic;

      EppDBIn : in std_logic_vector(7 downto 0);
      BlockRamIn : in  std_logic_vector(7 downto 0));
end EppSyncMux;

architecture Behavioral of EppSyncMux is


begin

   UsbRd  <= EppWait when UsbMode = '1' else 
            BlockRamRd;

   UsbDB <= (others => 'Z') when (UsbMode = '0' and UsbDir = '0') or 
	                                   -- Sync mode and USB out (to FPGA)
                                 (UsbMode = '1' and EppWr = '0') else 
											     -- Epp mode and Epp write
            EppDBIn        when UsbMode = '1' else  -- Epp mode  (read)
            BlockRamIn;               -- Sync mode (USB in - from FPGA)

end Behavioral;
