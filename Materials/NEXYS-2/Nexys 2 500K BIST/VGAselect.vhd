----------------------------------------------------------------------------------
-- Company: Digilent
-- Engineer: Tudor Armand Ciuleanu
-- 
-- Create Date:    14:01:34 07/30/2007 
-- Design Name: 
-- Module Name:    RGBselect - Behavioral 
-- Project Name:   Nexys2BIST
-- Target Devices: 
-- Tool versions: 
-- Description: Selects the source for the VGA signals. The source can be either
--					the Demo or the test.
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

entity VgaSelect is
    Port ( rgbTestIn : 		in  STD_LOGIC_VECTOR (7 downto 0);
           redDemoIn : 		in  STD_LOGIC_VECTOR (3 downto 0);
           greenDemoIn : 	in  STD_LOGIC_VECTOR (3 downto 0);
           blueDemoIn : 	in  STD_LOGIC_VECTOR (3 downto 0);
       	  hsyncDemo: 		in  STD_LOGIC; 
			  vsyncDemo: 		in  STD_LOGIC; 
			  syncTestIn: 		in  STD_LOGIC_VECTOR (1 downto 0); 
			  hsync: 			out  STD_LOGIC; 
			  vsync: 			out  STD_LOGIC; 
			  vgaRed : 			out  STD_LOGIC_VECTOR (2 downto 0);
           vgaGreen :		out  STD_LOGIC_VECTOR (2 downto 0);
           vgaBlue : 		out  STD_LOGIC_VECTOR (2 downto 1);
           demoEn : 			in  STD_LOGIC);
end VgaSelect;

architecture Behavioral of VgaSelect is

begin

vgaRed (2 downto 0) 		<= rgbTestIn(7 downto 5) when demoEn='1' else
									redDemoIn(3 downto 1);
vgaGreen (2 downto 0)	<= rgbTestIn(4 downto 2) when demoEn='1' else
									greenDemoIn(3 downto 1);
vgaBlue (2 downto 1)		<= rgbTestIn(1 downto 0) when demoEn='1' else
									blueDemoIn(3 downto 2);
hsync 						<= syncTestIn(0) when demoEn='1' else
									hsyncDemo;
vsync 						<= syncTestIn(1) when demoEn='1' else
									vsyncDemo;
		

end Behavioral;

