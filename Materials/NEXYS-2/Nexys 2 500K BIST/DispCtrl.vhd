--------------------------------------------------------------------------------
-- Company: 	Digilent Ro
-- Engineer:	Mircea Dabacan
--
-- Create Date:    11:43:28 10/28/06
-- Design Name:    
-- Module Name:    DispCtrl - Behavioral
-- Project Name:   
-- Target Device:  
-- Tool versions:  
-- Description:	 Generates the immage for the  VGA Demo
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
--          0.02 - modified for std_logic_vector Hcnt and Vcnt, Basys
--          0.03 - modified for Nexys (12 color bits, 128X64 pixel Logo, 
--                                      no transparency)
-- Additional Comments:
-- 
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DispCtrl is
  Port (clk25MHz : in std_logic;
        bitMouseLeftBtn: in std_logic;     				-- left btn of mouse
        xPos : in std_logic_vector(9 downto 0);	 		-- horizontal mouse position
        yPos : in std_logic_vector(9 downto 0);	 		-- vertical mouse position
        Hcnt: in std_logic_vector(10 downto 0);      	-- horizontal counter
        Vcnt: in std_logic_vector(10 downto 0);      	-- verical counter
        inRed   : in std_logic_vector(3 downto 0);	 	-- Digilent Logo
        inGreen : in std_logic_vector(3 downto 0);		-- color inputs
        inBlue  : in std_logic_vector(3 downto 0);
        outRed  : out std_logic_vector(3 downto 0); 	-- final color
        outGreen: out std_logic_vector(3 downto 0);	-- outputs
        outBlue : out std_logic_vector(3 downto 0);
        adrVideoMem : out std_logic_vector(13 downto 0)); 
							-- addr in the Logo immage
end DispCtrl;

architecture Behavioral of DispCtrl is

-- constants for Synchro module
  constant PAL:integer:=640;		--Pixels/Active Line (pixels)
  constant LAF:integer:=480;		--Lines/Active Frame (lines)
-- constants for VGA Demo
  constant HBorder:integer:=40;		-- Horizontal border (pixels)
  constant VBorder:integer:=40;		-- Vertical border (lines)
  constant Hsize:integer:=141;--128;		-- Horizontal logo size (pixels)
  constant Vsize:integer:=64;		-- Vertical logo size (pixels)

  signal Horigin:integer:=60;		-- Horizontal logo origin (pixels)
  signal Vorigin:integer:=60;		-- Vertical logo origin (pixels)

  signal adrVideoPixel: std_logic_vector(7 downto 0);
  signal adrVideoLine: std_logic_vector(5 downto 0);
  signal cntDyn: integer range 0 to 2**28-1;		-- dynamic effect counter

  signal intHcnt: integer range 0 to 800-1; --PLD-1 - horizontal counter
  signal intVcnt: integer range 0 to 521-1; -- LFD-1 - verical counter

begin
-- mapping the std_logic_vector ports to internal integers
  intHcnt <= conv_integer(Hcnt);
  intVcnt <= conv_integer(Vcnt);

  adrVideoPixel <= conv_std_logic_vector(intHcnt - Horigin,8);--7
  adrVideoLine <= conv_std_logic_vector(intVcnt - Vorigin,6);

  adrVideoMem <= adrVideoLine & adrVideoPixel;

-- counter for color bar dynamics
  diynamic:process (clk25MHz)
  begin
    if clk25MHz'event and clk25MHz = '1' then
      cntDyn <= cntDyn+1;
    end if;
  end process;

  mixer: process(clk25MHz,intHcnt, intVcnt) 
  begin
    if intHcnt < PAL and intVcnt < LAF then	-- in the active screen
      if intHcnt > Horigin and intHcnt < Horigin + Hsize and	 -- during logo 
         intVcnt > Vorigin and intVcnt < Vorigin + Vsize 
			then		 -- image
           outRed <= inRed; 
           outGreen <= inGreen; 
           outBlue <= inBlue; 
		else -- the moving lines area
	        -- red
           outRed <= 
		  conv_std_logic_vector((-intVcnt-intHcnt-cntDyn/2**20),8)(7 downto 4);
		     -- green
           outGreen <= 
		  conv_std_logic_vector((intHcnt-cntDyn/2**20),8)(7 downto 4); 
		    -- blue
           outBlue <= 
		  conv_std_logic_vector((intVcnt-cntDyn/2**20),8)(7 downto 4); 
		end if;
    else
         outRed <= (others => '0'); 
         outGreen <= (others => '0'); 
         outBlue <= (others => '0'); 
    end if;   
  end process;

-- place the logo at the mouse pos, if left button pressed
  LogoPlacement: process(bitMouseLeftBtn) 
  begin
	 if bitMouseLeftBtn = '1' then
         Horigin <= conv_integer(xPos); 
			Vorigin <= conv_integer(yPos);
    end if;   
  end process;

end Behavioral;
