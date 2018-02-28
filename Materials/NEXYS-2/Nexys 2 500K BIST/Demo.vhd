------------------------------------------------------------------------
-- Company: Digilent
-- Engineer: Mircea Dabacan
--
-- Create Date: 12:36:33 12/06/05
-- Design Name: Nexys2 board demo
-- Module Name: Demo - Behavioral
-- Project Name:   
-- Target Device: XC3S500E  
-- Tool versions: Xilinx ISE 9.2
-- Description: This file contains the demo for the 7 Segment Display and
--					and the leds on the Nexys 2 Board. 
--
--Each Led is assigned to a switch on the board. When a switch is moved to 
--the HIGH the coresponding led will turn on slowly. When it is moved to
--the LOW position the led will turn off slowly. This is done using PWM's.
--
--The Snake is the demo on the 7 Segment Display. A snake apears on one digit. 
--The head of the snake is the represented by the brightest line and it's tale
--by the least bright line. When a button is pressed the snake moves to the 
--coresponding digit.
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

Library UNISIM;
use UNISIM.vcomponents.all;

entity Demo is
  Port (ck:  in  std_logic;							-- clock input
        btn: in  std_logic_vector(3 downto 0);	-- buton input
        sw:  in  std_logic_vector(7 downto 0);	-- switch input
        led: out std_logic_vector(7 downto 0);	-- led output
        seg: out std_logic_vector(6 downto 0);	-- cathode output (7 Seg. Disp.)
        dp:  out std_logic;							-- enable output (7 Seg. Disp.)	
        an:  out std_logic_vector(3 downto 0));	-- anode output (7 Seg. Disp.)
end Demo;

architecture Behavioral of Demo is

signal cntDiv: std_logic_vector(16 downto 0); 
	-- general clock div/cnt
alias cntDisp: std_logic_vector(1 downto 0) is cntDiv(12 downto 11);
   -- a fragment of cntDiv used for 7 seg display control:
   -- cntDisp counts 50MHz/2^15 ~ 1525Hz
type typeIntArray is array(7 downto 0) of integer range 0 to 255;
   -- Intensity for each LED: 0 = off, 255 = full on.
signal cmpPwm: typeIntArray:=(0,0,0,0,0,0,0,0);
   -- reference values for PWM
constant ckPwmRange: integer:= 5; --50MHz/512 ~ 92KHz
   -- LSB in the cntPwm alias of cntDiv
alias cntPwm: std_logic_vector(7 downto 0) is cntDiv(7+ckPwmRange downto ckPwmRange);
   -- a fragment of cntDiv used for PW Modulator:
   -- cntPwm counts 50MHz/2^ckPwmRange
signal ckFade : std_logic:='0'; 
	--fade clock
signal ckSnake: std_logic:='0'; 
	--snake clock
type vertebra is array (0 to 1) of integer range 0 to 7;
   -- represents the position of a sanke vertebra on the 7-seg display:
   -- index 0: digit
   -- index 1: segment
type typeSnake is array(0 to 6) of vertebra;
   -- the snake consists of 7 vertebras (index 0 = the head)
constant initSnake: typeSnake:= ((1,6),(1,2),(1,3),(1,4),(1,5),(1,0),(1,1));
   -- snake twisted on digit 2, left headed
signal Snake: typeSnake:=initSnake; 
signal NextSnake: typeSnake:=initSnake; 

signal Target: integer range 0 to 7 := 1;
signal NextTarget: integer range 0 to 7 := 1;

type typeDirection is (left, right);
signal Direction: typeDirection; 

signal segPwm: std_logic_vector(7 downto 0); 

COMPONENT clkDllDiv16
PORT(
	ckIn 		: IN std_logic;       
	ckOut 	: INOUT std_logic;
	ckDivOut : INOUT std_logic
	);
END COMPONENT;


begin
	
	ckDivider: process(ck)
	begin
		if ck'event and ck='1' then
			cntDiv <= cntDiv + '1';
		end if;
	end process;

	BUFG_inst1 : BUFG
   port map (
      O => ckFade,     	-- Clock buffer output
      I => cntDiv(12)   -- Clock buffer input
   );
	
	BUFG_inst2 : BUFG
   port map (
      O => ckSnake,     -- Clock buffer output
      I => cntDiv(16)   -- Clock buffer input
   );


	Fadder: process(ck, ckFade, sw, cmpPwm)
	begin
		for i in 0 to 7 loop           			-- for each LED
			if ckFade'event and ckFade='1' then 
				if sw(i) = '1' and cmpPwm(i) /= 255 then         
					-- coresponding switch ON, not yet full intensity
					cmpPwm(i) <= cmpPwm(i)+1;     -- increasing intensity
				elsif sw(i) = '0' and  cmpPwm(i) /= 0 then 
					-- coresponding switch OFF, not yet full dark
					cmpPwm(i) <= cmpPwm(i)-1;     -- decreasing intensity
				end if;
			end if;
		end loop;
	end process;


	PWM: process(cntPwm, cmpPwm)
	begin
		for i in 0 to 7 loop         	-- for each LED
			if conv_integer(cntPwm) < cmpPwm(i) then
				-- counter value less than reference
				Led(i) <= '1';          -- LED ON
			else 
				-- counter value greater than reference
				Led(i) <= '0';          -- LED OFF
			end if;
		end loop;
	end process;

	--in case a button is pressed sets the next target for the snake
	NextTargetSet: process(ck, ckSnake, btn)
	begin
		if ckSnake'event and ckSnake='1' then
			if btn(3) = '1' then 
				NextTarget <= 3;
			elsif btn(2) = '1' then 
				NextTarget <= 2;
			elsif btn(1) = '1' then 
				NextTarget <= 1;
			elsif btn(0) = '1' then 
				NextTarget <= 0;
			end if;
		end if;
	end process;

	TargetSet: process(ck, ckSnake, Snake, Target, NextTarget)
	begin
		if ckSnake'event and ckSnake='1' then
			if Snake(0) = (Target, 6) then -- already at target
				Target <= NextTarget;
				if NextTarget > Target then 
				--sets the direction for the snake depending on 
				--the position of the next target
					Direction <= left;
				elsif NextTarget < Target then
					Direction <= right;
				end if;
			end if;
		end if;
	end process;

	SnakeStateMachine: process(ck, ckSnake, NextSnake)
	begin
		if ckSnake'event and ckSnake='1' then
			Snake <= NextSnake;
		end if;
	end process;

	NextSnakeLogic: process(Snake(0), Snake(1), Snake(2), Snake(3), Snake(4), Snake(5), Snake(6), btn)
	begin
		if Snake(0) = (Target, 6)   then -- already at target
			if NextTarget>Target then
				NextSnake <= ((Target,6),(Target,1),(Target,0),(Target,5),(Target,4),(Target,3),(Target,2));   -- spinning to left
			elsif NextTarget<Target then
				NextSnake <= ((Target,6),(Target,5),(Target,0),(Target,1),(Target,2),(Target,3),(Target,4));   -- spinning to left
			else
				NextSnake <= Snake;   -- resting
			end if;
		else  -- snake moving
			NextSnake(1 to 6) <= Snake(0 to 5); 
			if Direction = left then-- snake moving left
				if Snake(0) = (Target-3,6)   then -- running to left
					NextSnake(0) <= (target-2,6);
				elsif Snake(0) = (Target-2,6)   then -- running to left
					NextSnake(0) <= (target-1,6);
				elsif Snake(0) = (Target-1,6)   then -- next right to target
					NextSnake(0) <= (target,2);
				elsif Snake(0) = (Target,2)   then -- roling in target digit
					NextSnake(0) <= (target,3);
				elsif Snake(0) = (Target,3)   then -- roling in target digit
					NextSnake(0) <= (target,4);
				elsif Snake(0) = (Target,4)   then -- roling in target digit
					NextSnake(0) <= (target,5);
				elsif Snake(0) = (Target,5)   then -- roling in target digit
					NextSnake(0) <= (target,0);
				elsif Snake(0) = (Target,0)   then -- roling in target digit
					NextSnake(0) <= (target,1);
				elsif Snake(0) = (Target,1)   then -- roling in target digit
					NextSnake(0) <= (target,6);
				else
					NextSnake(0) <= Snake(0);
				end if;
			else -- snake moving right
				if Snake(0) = (Target+3, 6)   then -- running to left
					NextSnake(0) <= (target+2,6);
				elsif Snake(0) = (Target+2,6)   then -- running to left
					NextSnake(0) <= (target+1,6);
				elsif Snake(0) = (Target+1,6)   then -- next right to target
					NextSnake(0) <= (target,4);
				elsif Snake(0) = (Target,4)   then -- roling in target digit
					NextSnake(0) <= (target,3);
				elsif Snake(0) = (Target,3)   then -- roling in target digit
					NextSnake(0) <= (target,2);
				elsif Snake(0) = (Target,2)   then -- roling in target digit
					NextSnake(0) <= (target,1);
				elsif Snake(0) = (Target,1)   then -- roling in target digit
					NextSnake(0) <= (target,0);
				elsif Snake(0) = (Target,0)   then -- roling in target digit
					NextSnake(0) <= (target,5);
				elsif Snake(0) = (Target,5)   then -- roling in target digit
					NextSnake(0) <= (target,6);
				else
					NextSnake(0) <= Snake(6);
				end if;
			end if;
		end if;
	end process;

--Only one digit is active at a certain moment, this is done by activating one anodeat a time.
--The change of the active digits is done very fast and it makes you belive that all digits 
--are lit at the same time
	anodeCtrl:process(cntDisp, Snake(0), Snake(1), Snake(2), Snake(3), Snake(4), Snake(5), Snake(6))
	begin  
		an <= "1111";
		if Snake(0) = (Target, 6) then --snake not moving, one digit is lit
			an(Target) <= '0';
		elsif cntDisp ="00" then
			an <= "1110";
		elsif cntDisp ="01" then
			an <= "1101";
		elsif cntDisp ="10" then
			an <= "1011";
		else
			an <= "0111";
		end if;
	end process;

--The output segment vector is created here.
	SegAssignment: process(cntDisp, Snake(0), Snake(1), Snake(2), Snake(3), Snake(4), Snake(5), Snake(6))
	begin
		seg <= "1111111";
      for k in 0 to 6 loop
			for i in 0 to 6 loop --loops all vertebras of the snake
				if Snake(i) = (conv_integer(cntDisp),k) then 
					seg(k) <= segPwm(i);   
				end if;
				if target = conv_integer(cntDisp) then -- current 7seg digit
					dp <= '0';  -- segment OFF
				else
					dp <= '1';	-- segment ON
				end if;
			end loop;
		end loop;
	end process;
	
--Each segment of the snake has a different brightness. The head is the brightest.
	segPwm(0) <= '0';
	segPwm(1) <= cntDiv(ckPwmRange) and cntDiv(ckPwmRange+1);
	segPwm(2) <= cntDiv(ckPwmRange) ;
	segPwm(3) <= cntDiv(ckPwmRange) or cntDiv(ckPwmRange+1);
	segPwm(4) <= cntDiv(ckPwmRange) or cntDiv(ckPwmRange+1) or cntDiv(ckPwmRange+2);
	segPwm(5) <= cntDiv(ckPwmRange) or cntDiv(ckPwmRange+1) or cntDiv(ckPwmRange+2) or cntDiv(ckPwmRange+3);
	segPwm(6) <= cntDiv(ckPwmRange) or cntDiv(ckPwmRange+1) or cntDiv(ckPwmRange+2) or cntDiv(ckPwmRange+3) or cntDiv(ckPwmRange+4);

end Behavioral;
         