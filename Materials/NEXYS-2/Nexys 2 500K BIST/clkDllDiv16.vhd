--------------------------------------------------------------------------------
-- Company: 	 Digilent Ro
-- Engineer:	 Mircea Dabacan
--
-- Create Date:    20:02:14 10/29/06
-- Design Name:    
-- Module Name:    clkDllDiv16 - Behavioral
-- Project Name:   
-- Target Device:  Spartan 3
-- Tool versions:  WebPack 7.01i
-- Description:	Provides 2 synchronised, 50% duty cycle clock signals:
--	          - ckOut    - twice the frequency of ckIn
--           - ckDivOut - divided by the value of attribute CLKDV_DIVIDE
-- Dependencies:
-- 
-- Revision: 0.01
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;


entity ClkDllDiv16 is
  port(ckIn: in std_logic;
       ckOut: inout std_logic;
       ckDivOut: inout std_logic);

end ClkDllDiv16;

architecture Behavioral of ClkDllDiv16 is

  component CLKDLL
    generic (CLKDV_DIVIDE : real := 16.0; -- (1.5, 2.0, 2.5,
														-- 3.0, 4.0, 5.0, 8.0, 16.0)
             DUTY_CYCLE_CORRECTION : Boolean := TRUE; -- (TRUE, FALSE)
             STARTUP_WAIT : boolean := FALSE); -- (TRUE, FALSE)

    port(CLK0 : out STD_ULOGIC;
         CLK180 : out STD_ULOGIC;
         CLK270 : out STD_ULOGIC;
         CLK2X : out STD_ULOGIC;
         CLK90 : out STD_ULOGIC;
         CLKDV : out STD_ULOGIC;
         LOCKED : out STD_ULOGIC;
         CLKFB : in STD_ULOGIC;
         CLKIN : in STD_ULOGIC;
         RST : in STD_ULOGIC);
  end component;
  
--CLKDLL Output Description
--		CLK0 	 -	Clock at 1x CLKIN frequency
--		CLK180 -	Clock at 1x CLKIN frequency, shifted 180o with regards to CLK0
--		CLK270 -	Clock at 1x CLKIN frequency, shifted 270o with regards to CLK0
--		CLK2X  -	Clock at 2x CLKIN frequency, in phase with CLK0
--		CLK90  -	Clock at 1x CLKIN frequency, shifted 90o with regards to CLK0
--		CLKDV  -	Clock at (1/n)x CLKIN frequency, n=CLKDV_DIVIDE value. CLKDV is in
--					phase with CLK0.
--		LOCKED -	 CLKDLL locked
--Libraries Guide www.xilinx.com 323
--ISE 6.3i 1-800-255-7778

	attribute CLKDV_DIVIDE : real;
	attribute DUTY_CYCLE_CORRECTION : boolean;
	attribute STARTUP_WAIT : boolean;
	
	signal ckX2: std_logic;

begin

--Bug in the WebPack 8.1. Without this "pointless" instantiation,
--which will be removed by minimization, the design is "unroutable"

   BUFG_inst1 : BUFG
   port map (
      O => open,   			-- Clock buffer output
      I => ckOut      		-- Clock buffer input
   );

   CLKDLL_inst : CLKDLL
   port map (
      CLK0 => open,     	-- 0 degree DLL CLK ouptput
      CLK180 => open, 		-- 180 degree DLL CLK output
      CLK270 => open, 		-- 270 degree DLL CLK output
      CLK2X => ckOut,  		-- 2X DLL CLK output
      CLK90 => open,  		-- 90 degree DLL CLK output
      CLKDV => ckDivOut,   -- Divided DLL CLK out (CLKDV_DIVIDE)
      LOCKED => open, 		-- DLL LOCK status output
      CLKFB => ckOut,   	-- DLL clock feedback
      CLKIN => ckIn,   		-- Clock input (from IBUFG, BUFG or DLL)
      RST => '0'        	-- DLL asynchronous reset input
   );

end Behavioral;
