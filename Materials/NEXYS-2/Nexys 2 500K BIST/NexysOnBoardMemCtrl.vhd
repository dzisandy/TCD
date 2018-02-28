------------------------------------------------------------------------
--  NexysOnBoardMemCtrl.vhd -- Digilent C1 Memory Module programming controller
------------------------------------------------------------------------
--  Author : Mircea Dabacan
--           Copyright 2008 Digilent, Inc.
------------------------------------------------------------------------
-- Software version: Xilinx ISE 9.2.02i
--                   WebPack
------------------------------------------------------------------------
-- This is the source file for the NexysOnBoardMemCtrl component, 
-- provided by the Digilent Component Library.

-- This file contains the design for a programming controller.
-- This component, in conjunction with a communication module
--  (Nexys OnBoard USB controller),
-- a PC application program (a Digilent utility or user generated) 
-- and the EppCtrl Digilent Library component allows the user to
-- read or write the RAM and Flash memory chips on the 
-- Digilent Nexys board.

------------------------------------------------------------------------
--  Behavioral description
------------------------------------------------------------------------
-- NexysOnBoardMemCtrl acts as a "client" for EppCtrl. 
-- It implements the following Epp data registers:
------------------------------------------------------------------------
-- EPP Register Interface
--  Register Function
--  -------- --------
--     0     Memory control register (read/write)
--     1     Memory address bits 0-7 (read/write)
--     2     Memory address bits 8-15 (read/write)
--     3     Memory address bits 16-23 (read/write)
--     4     Memory data write holding register (read/write) -see Note 1
--     5     Memory data read register (read) - see Note 2
-- Registers 6 and 7 are used for block transfers
--     6     RAM auto read/write register (read/write) - see Note 3
--     7     Flash auto read/write register (read/write) - see Note 4
--

-- Reading from or writing to registers 0...5 generates a simple 
-- Register Transfer (see the EppCtrl.vhd header): 
-- the HandShakeReqOut is inactive when regEppAdrIn(2:0) = 0...5.
-- (see the EppCtrl.vhd Component Header)

-- Registers 6 and 7 belong to the "Process Launch" type, 
-- both for read and write operations (see the EppCtrl.vhd header):
-- the HandShakeReqOut activates when regEppAdrIn(2:0) = 6...7.
-- Consequently, at each Epp Data Register read or write cycle for this
-- address, the EppCtrl component activates the ctlEppStart signal. 
-- As response, the NexysOnBoardMemCtrl:
--  - performs the actions explained by Note 3 or 4.
--  - activates the ctlMsmDoneOut signal
--  - waits for the ctlEppStart signal to go inactive.
--  - inactivates the ctlMsmDoneOut signal
--  - returns to the idle state (stMsmReady) 
--   
--  Note 1: Writing to "registers" 6 or 7 also updates register 4.
--  Note 2: "Register 5" is not a physical register. The memory data bus  
--          content is read at this address.
--  Note 3: Writing to "register" 6, when in byte mode:
--          - updates the register 4 content AND
--          - launches an automatic RAM write cycle (asynchronous mode):
--            - generates the appropriate control signal sequence
--            - increments the Memory address register by 1.
--          Reading from address 6, when in byte mode:
--          - launches an automatic RAM read cycle (asynchronous mode):
--            - generates the appropriate control signal sequence
--            - loads the AutoReadData register with the content of the
--              addressed RAM location 
--            - increments the Memory address register by 1.
--          Writing to "register" 6, when in word mode and even address:
--          - launches a blind cycle to update the auxiliary register. 
--            No RAM cycle is launched.
--          - increments the Memory address register by 1.
--          Writing to "register" 6, when in word mode and odd address:
--          - updates the register 4 content AND
--          - launches an automatic RAM write cycle (asynchronous mode):
--            - generates the appropriate control signal sequence
--             (a word is written to RAM:
--              - memory address bus is set to the word address (A0 = 0)
--              - memory data bus is set with the previous stored value
--              of auxiliary register as lower byte and curent value of 
--              register 4 as higher byte)
--            - increments the Memory address register to the next even.
--          Reading from address 6, when in word mode and even address:
--          - launches an automatic RAM read cycle (asynchronous mode):
--            - generates the appropriate control signal sequence
--            - loads the AutoReadData register with the lower byte of 
--              the addressed RAM location (sent over the Epp) 
--            - loads the auxiliary register with the upper byte of 
--              the addressed RAM location (not yet sent over the Epp) 
--            - increments the Memory address register by 1.
--          Reading from address 6, when in word mode and odd address:
--          - launches a blind cycle to send the previous stored value 
--            of the auxiliary register. No RAM cycle is performed.
--            - increments the Memory address register by 1.
--          
--  Note 4: Writing to "register" 7, when in byte mode:
--          - updates the register 4 content AND
--          - launches an automatic Flash write cycle:
--            - generates the appropriate control signal sequence
--            - waits for the internal Flash write procedure to complete 
--            - increments the Memory address register by 1.
--          Reading from address 7, when in byte mode:
--          - launches an automatic Flash read cycle:
--            - generates the appropriate control signal sequence
--            - loads the AutoReadData register with the content of the
--              addressed Flash location 
--            - increments the Memory address register by 1.
--          Writing to "register" 7, when in word mode and even address:
--          - launches a blind cycle to update the auxiliary register. 
--            No Flash cycle is launched.
--          - increments the Memory address register by 1.
--          Writing to "register" 7, when in word mode and odd address:
--          - updates the register 4 content AND
--          - launches an automatic Flash write cycle:
--            - generates the appropriate control signal sequence
--             (a word is written to Flash:
--              - memory address bus is set to the word address (A0 = 0)
--              - memory data bus is set with the previous stored value
--              of auxiliary register as lower byte and curent value of 
--              register 4 as higher byte)
--            - waits for the internal Flash write procedure to complete 
--            - increments the Memory address register to the next even.
--          Reading from address 7, when in word mode and even address:
--          - launches an automatic Flash read cycle:
--            - generates the appropriate control signal sequence
--            - loads the AutoReadData register with the lower byte of 
--              the addressed Flash location (sent over the Epp) 
--            - loads the auxiliary register with the upper byte of 
--              the addressed Flash location (not yet sent over the Epp) 
--            - increments the Memory address register by 1.
--          Reading from address 7, when in word mode and odd address:
--          - launches a blind cycle to send the previous stored value 
--            of the auxiliary register. No Flash cycle is performed.
--            - increments the Memory address register by 1.
--
-- Memory control register
--  Bit      Function
--  -------- --------
--  0 (0x01) Output enable (read strobe) |
--  1 (0x02) Write enable (write strobe) | active LOW signals
--  2 (0x04) RAM chip select (not used)  |
--  3 (0x08) Flash chip select           |
--  4 (0x10) Memory module during programming 
--          (memory is not available for a user application) 
--          (not yet implemented)
--  5 (0x20) Byte enable ('0') or word enable ('1') 

-- The Epp interfaces can only handle 8 bit data.
-- Word mode (16 bit) is only available for Automatic Read/Write, 
-- for both RAM (using register 6) and Flash (using register 7). 
-- A "Word write" operation consists in two Epp (byte) cycles:
   -- the first one, at even address, launces a "blind cycle", 
      -- which only stores the lower data byte in an auxiliary register.
   -- the second one, at odd address, combines the two data bytes to a 
      -- data word on the memory data bus, and writes it to memory.
-- A "Word read" operation consists in two Epp (byte) cycles:
   -- the first one, at even address, reads the data word from memory, 
      -- sends the lower data byte over the Epp bus and stores the upper
      -- byte in an auxiliary register.
   -- the second one, at odd address, launces a "blind cycle",
      -- which only sends the upper data byte over the Epp bus.

-- Manual mode is only allowed for Flash 
-- (Celullar RAM would hold CS active to long, blocking refresh cycles)
   -- Manual "Word" mode for flash reads the upper data bus byte for odd
     -- addresses and the lower data bus byte for even addresses.
   -- Manual "Byte" mode for flash reads the lower data bus byte 
     -- for both odd and even addresses:

-- These features are completely transparent to the Epp host, which only
-- needs to set the appropriate value in the Memory Control and 
-- memory address registers and read/write the data registers (4...7).

------------------------------------------------------------------------
-- Revision History:
-- 10/21/2004(MirceaD): created (Wp7.1)
-- 12/19/2005(MirceaD): modified for PhoenixOnBoard Memory
-- 20/03/2006(MirceaD): modified for NexysOnBoard Memory (16 bit)
-- 07/06/2006(MirceaD): modified for Nexys 2 On board Memory (Wp8.1)
-- 01/26/2008(MirceaD): updated source file comments (Wp9.2)
------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity NexysOnBoardMemCtrl is
  Port(
       clk  : in std_logic;       -- system clock (50MHz)
-- Epp interface signals
       HandShakeReqOut: out std_logic;    -- User Handshake Request
       ctlMsmStartIn: in std_logic;       -- Automatic process Start 
       ctlMsmDoneOut: out std_logic;      -- Automatic process Done 
       ctlMsmDwrIn: in std_logic;         -- Data Write pulse
       ctlEppRdCycleIn: in std_logic;     -- Indicates a READ Epp cycle
       EppRdDataOut: out std_logic_vector(7 downto 0);-- Data Input bus
       EppWrDataIn: in std_logic_vector(7 downto 0); -- Data Output bus
       regEppAdrIn: in std_logic_vector(7 downto 0) := "00000000"; 
		                -- Epp Address Register content (bits 7:3 ignored)
       ComponentSelect : in std_logic;    
		              -- active HIGH, selects the current MemCtrl instance
--      If a single "client" component (CxMemCfg or other) is connected
--      to a "host" component (EppCtrl or other), ComponentSelect signal 
--      can be held permanently active (connected to Vcc).
--      When more "client" components (CxMemCfg or other) are connected  
--      to a "host" component (EppCtrl or other), the ComponentSelect 
--      input of each client must be synthesized by decoding the higher
--      bits of regEppAdrOut bus, such a way to provide a distinct  
--      address range for each.
--      C1MemCfg component requires 8 Epp data registers 
--      (address range xxxxx000...xxxxx111)

-- Memory bus signals
       MemDB: inout std_logic_vector(15 downto 0);-- Memory data bus
       MemAdr: out std_logic_vector(23 downto 1); -- Memory Address bus
		 FlashByte: out std_logic; -- Byte enable('0') or word enable('1')
       RamCS: out std_logic;     -- RAM CS
       FlashCS: out std_logic;   -- Flash CS
       MemWR: out std_logic;     -- memory write 
       MemOE: out std_logic;     -- memory read (Output Enable), 
		                           -- also controls the MemDB direction
       RamUB: out std_logic;     -- RAM Upper byte enable 
       RamLB: out std_logic;     -- RAM Lower byte enable 
       RamCre: out std_logic;    -- Cfg Register enable 
       RamAdv: out std_logic;    -- RAM Address Valid pin
       RamClk: out std_logic;    -- RAM Clock 
       RamWait: in std_logic;    -- RAM Wait pin 
       FlashRp: out std_logic;   -- Flash RP pin 
       FlashStSts: in std_logic; -- Flash ST-STS pin 
		  
       MemCtrlEnabled: out std_logic -- MemCtrl takes bus control 

       );
end NexysOnBoardMemCtrl;

architecture Behavioral of NexysOnBoardMemCtrl is

------------------------------------------------------------------------
-- Constant and Signal Declarations
------------------------------------------------------------------------

 -- The following constants define the state codes for the Memory
 -- control state machine. This state machine controls the sequence
 -- of operations needed to perform a write sequence or a read sequence
 -- on either Flash or RAM memory. 
 -- The states are such a way assigned that each transition
 -- changes a single state register bit (Grey code - like)
 constant stMsmReady: std_logic_vector(3 downto 0) := "0000"; 
 constant stMsmFwr01: std_logic_vector(3 downto 0) := "0001";
 constant stMsmFwr02: std_logic_vector(3 downto 0) := "0101";
 constant stMsmFwr03: std_logic_vector(3 downto 0) := "0111";
 constant stMsmFwr04: std_logic_vector(3 downto 0) := "1111";
 constant stMsmFwr05: std_logic_vector(3 downto 0) := "1011";
 constant stMsmFwr06: std_logic_vector(3 downto 0) := "1001";
 constant stMsmFwr07: std_logic_vector(3 downto 0) := "1101";
 constant stMsmAdInc: std_logic_vector(3 downto 0) := "1100";
 constant stMsmDone : std_logic_vector(3 downto 0) := "1000";
 constant stMsmBlind: std_logic_vector(3 downto 0) := "0100";
 constant stMsmDir01: std_logic_vector(3 downto 0) := "0010";
 constant stMsmDWr02: std_logic_vector(3 downto 0) := "0110";
 constant stMsmDir03: std_logic_vector(3 downto 0) := "1110";
 constant stMsmDRd02: std_logic_vector(3 downto 0) := "1010";

-- Epp Data register addresses
constant MemCtrlReg:  std_logic_vector(2 downto 0) := "000"; 
     --  0 Memory control register (read/write)
constant MemAdrL:     std_logic_vector(2 downto 0) := "001";
     --  1 Memory address bits 0-7 (read/write)
constant MemAdrM:     std_logic_vector(2 downto 0) := "010";
     --  2 Memory address bits 8-15 (read/write)
constant MemAdrH:     std_logic_vector(2 downto 0) := "011";
     --  3 Memory address bits 16-21 (read/write)
constant MemDataWr:   std_logic_vector(2 downto 0) := "100"; 
     --  4 Memory data write holding register (read/write)  - see Note 1
constant MemDataRd:   std_logic_vector(2 downto 0) := "101";
     --  5 Memory data read register (read) - see Note 2
-- Register 7 is used for block transfers
constant RamAutoRW:   std_logic_vector(2 downto 0) := "110";
     --  6 RAM auto write register (read/write) - see Note 3
constant FlashAutoRW: std_logic_vector(2 downto 0) := "111";
     --  7 Flash auto write register (read/write) - see Note 4

-- State register and next state for the FSMs
signal stMsmCur : std_logic_vector(3 downto 0) := stMsmReady;
signal stMsmNext : std_logic_vector(3 downto 0);

-- Counter used to generate delays
signal DelayCnt : std_logic_vector(4 downto 0);

-- The attribute lines below prevent the ISE compiler to extract and 
-- optimize the state machines.
-- WebPack 5.1 doesn't need them (the default value is NO)
-- WebPack 6.2 has the default value YES, so without these lines, 
-- it would "optimize" the state machines.
-- Although the overall circuit would be optimized, the particular goal
-- of "glitch free output signals" may not be reached. 
-- That is the reason of implementing the state machine as described in  
-- the constant declarations above. 

attribute fsm_extract : string;
attribute fsm_extract of stMsmCur: signal is "no"; 
attribute fsm_extract of stMsmNext: signal is "no"; 

attribute fsm_encoding : string;
attribute fsm_encoding of stMsmCur: signal is "user"; 
attribute fsm_encoding of stMsmNext: signal is "user"; 

attribute signal_encoding : string;
attribute signal_encoding of stMsmCur: signal is "user"; 
attribute signal_encoding of stMsmNext: signal is "user";

-- Signals dealing with memory chips
signal regMemCtl: std_logic_vector(7 downto 0):= x"0f"; 
     -- Memory Control register ( MemCtrl disabled )
signal regMemAdr: std_logic_vector(23 downto 0):= x"000000";
     -- Memory Address register
signal carryoutL:std_logic:='0';
     -- Carry out for memory address low byte
signal carryoutM:std_logic:='0';
     -- Carry out for memory address middle byte
signal regMemWrData: std_logic_vector(15 downto 0) := x"0000";
     -- Memory Write Data register
signal regMemRdData: std_logic_vector(7 downto 0) := x"00";  
     -- Memory Read Data register
signal regMemRdDataAux: std_logic_vector(7 downto 0) := x"00";  
     -- Auxiliary Memory Read Data register
signal busMemIn: std_logic_vector(15 downto 0);   
--signal busMemInHigh: std_logic_vector(7 downto 0);   
signal busMemOut: std_logic_vector(15 downto 0);

-- Signals in the memory control register
signal ctlMcrOe: std_logic;      -- Output enable (read strobe)
signal ctlMcrWr: std_logic;      -- Write enable (write strobe)
signal ctlMcrRAMCs: std_logic;   -- RAM chip select
signal ctlMcrFlashCs: std_logic; -- Flash chip select
signal ctlMcrEnable: std_logic;  -- '1' => Enables the MemCtrl
signal ctlMcrWord: std_logic;    -- PC enerated Word signal
									-- Byte enable ('0') or word enable ('1')

signal ctlMcrDir: std_logic;     -- composed out of previous ones

-- Signals used by Memory control state machine
signal ctlMsmOe : std_logic;
signal ctlMsmWr : std_logic;
signal ctlMsmRAMCs : std_logic;
signal ctlMsmFlashCs : std_logic;
signal ctlMsmDir : std_logic;
signal ctlMsmAdrInc : std_logic;
signal ctlMsmWrCmd : std_logic;

------------------------------------------------------------------------
-- Module Implementation
------------------------------------------------------------------------
    
begin

------------------------------------------------------------------------
-- Map basic status and control signals
------------------------------------------------------------------------
 MemCtrlEnabled <= ctlMcrEnable;

-- Epp signals
   -- Port signals
 EppRdDataOut <=
   regMemCtl              when regEppAdrIn(2 downto 0) = MemCtrlReg
                               and ComponentSelect = '1' else
   regMemAdr(7 downto 0)  when regEppAdrIn(2 downto 0) = MemAdrL 
                               and ComponentSelect = '1' else
   regMemAdr(15 downto 8) when regEppAdrIn(2 downto 0) = MemAdrM 
                               and ComponentSelect = '1' else
   regMemAdr(23 downto 16)
                          when regEppAdrIn(2 downto 0) = MemAdrH 
                               and ComponentSelect = '1' else
   regMemWrData(7 downto 0) when regEppAdrIn(2 downto 0) = MemDataWr
	                            and regMemAdr(0) ='0'  -- even address
                               and ComponentSelect = '1' else
   regMemWrData(15 downto 8) when regEppAdrIn(2 downto 0) = MemDataWr
	                            and regMemAdr(0) ='1'  -- odd address
                               and ComponentSelect = '1' else
   regMemRdData           when regEppAdrIn(2 downto 0) = RamAutoRW 
                               and ComponentSelect = '1' else
   regMemRdData           when regEppAdrIn(2 downto 0) = FlashAutoRW 
                               and ComponentSelect = '1' else
   -- Manual mode is only allowed for Flash 
   -- (Celullar RAM would hold CS active to long, blocking refresh cycles)
   -- Manual "Word" mode for flash reads the upper data bus byte
   -- when address odd:
   busMemIn(15 downto 8)  when ctlMcrWord = '1' 		  -- Word Mode
	                            and regMemAdr(0) = '1'  -- odd address
	                            and ComponentSelect = '1' else
   -- Manual "Byte" mode for flash reads the lower data bus byte 
   -- for both odd and even addresses:
   busMemIn(7 downto 0)   when ComponentSelect = '1' else
   "00000000"; -- prepared to "OR" EppRdDataOut to some other busses

-- Memory signals

-- Memory control register
 ctlMcrOe      <= regMemCtl(0); -- Output enable (read strobe)
 ctlMcrWr      <= regMemCtl(1); -- Write enable (write strobe)
 ctlMcrRAMCs   <= regMemCtl(2); -- RAM chip select
 ctlMcrFlashCs <= regMemCtl(3); -- Flash chip select
 ctlMcrEnable  <= regMemCtl(4); -- MemCtrl enable ('1') or disable ('0')
 ctlMcrWord    <= regMemCtl(5); -- Byte enable ('0') or word enable ('1')

-- Memory control bus driven either by automatic state machine or by 
-- memory control register

 RamCS   <= 'Z'         when ctlMcrEnable = '0' else		-- MemCtrl Disabled
            ctlMcrRAMCs when stMsmCur = stMsmReady else	-- MemCtrl Idle
				ctlMsmRAMCs;                           -- MemCtrl generated RAM CS;
				 
 FlashCS <= 'Z'           when ctlMcrEnable = '0' else	-- MemCtrl Disabled
            ctlMcrFlashCs when stMsmCur = stMsmReady and -- MemCtrl Idle
										 ctlMcrRamCs = '1' else		-- RAM priority
				ctlMsmFlashCs;                       -- MemCtrl generated Flash CS;

 MemOE   <= 'Z'         when ctlMcrEnable = '0' else		-- MemCtrl Disabled
            ctlMcrOe    when stMsmCur = stMsmReady else	-- MemCtrl Idle
				ctlMsmOe;                           -- MemCtrl generated RAM CS;
 
 MemWR   <= 'Z'         when ctlMcrEnable = '0' else		-- MemCtrl Disabled
            ctlMcrWr    when stMsmCur = stMsmReady and	-- MemCtrl Idle
									  ctlMcrOe = '1' else 		   -- OE priority
				ctlMsmWr;                           -- MemCtrl generated RAM CS;
 
 FlashByte <= 'Z'       when ctlMcrEnable = '0' else		-- MemCtrl Disabled
              ctlMcrWord;      -- PC generated Word signal;
   								    -- Byte enable ('0') or word enable ('1')

 RamLB <= 'Z' when ctlMcrEnable = '0' else		-- MemCtrl Disabled
          '0' when ctlMcrWord = '1' or     -- word mode
                   regMemAdr(0) ='0' else  -- even address
			 '1';

 RamUB <= 'Z' when ctlMcrEnable = '0' else		-- MemCtrl Disabled
          '0' when ctlMcrWord = '1' or     -- word mode
                   regMemAdr(0) ='1' else  -- odd address
			 '1';

-- Memory control signals not yet used
 RamClk <= 'Z'       when ctlMcrEnable = '0' else		-- MemCtrl Disabled 
           '0'; -- inactive for asinchronous mode

 RamCre <= 'Z'       when ctlMcrEnable = '0' else		-- MemCtrl Disabled
           '0'; -- inactive for asinchronous default mode

 RamAdv <= 'Z'       when ctlMcrEnable = '0' else		-- MemCtrl Disabled
           '0'; -- inactive for asinchronous mode

 FlashRp	<= 'Z'       when ctlMcrEnable = '0' else		-- MemCtrl Disabled 
            '1'; -- no reset, no power down

 busMemIn <= MemDB;

 busMemOut <= "00000000" & "01000000" when ctlMsmWrCmd = '1' else -- WrC
              "00000000" & regMemWrData(15 downto 8) 
				                  when ctlMcrWord = '0' and  -- byte mode
				                       regMemAdr(0) = '1' and  -- odd addr
											  regEppAdrIn(2 downto 0) = FlashAutoRW
											       -- Flash accessed
											  else -- any other: -- all RAM 
											                     -- Flash word 
											                     -- Flash byte even 
              regMemWrData;--    when ctlMcrWord = '1';
 MemAdr <= "ZZZZZZZ" & "ZZZZZZZZ" & "ZZZZZZZZ" 
                 when ctlMcrEnable = '0' else		-- MemCtrl Disabled
           regMemAdr(23 downto 1);

 ctlMcrDir <= ctlMcrOe and 	         -- ctlMcrOe inactive
              ((not ctlMcrFlashCs) or 	-- ctlMcrFlashCs active
				   (not ctlMcrRAMCs));     -- ctlMcrRAMCs active
 
 MemDB <= busMemOut when ctlMcrEnable = '1' and -- MemCtrl Enabled
                         (ctlMsmDir = '1' or 	-- Msm controlled
								  ctlMcrDir = '1') else -- Mcr controlled 
          "ZZZZZZZZ" & "ZZZZZZZZ";

-- Handshake signal
 HandShakeReqOut <=  '1' when (regEppAdrIn(2 downto 0) = RamAutoRW or 
                               regEppAdrIn(2 downto 0) = FlashAutoRW) 
                            and ComponentSelect = '1' else
                     '0';

-- Memory state machine related signals

-- Control commands generated by the memory state machine.
 with stMsmCur select
   ctlMsmOe <= '0' when stMsmDRd02|stMsmFwr05|stMsmFwr07,
               '1' when others; -- Output enable (read strobe)
 with stMsmCur select
   ctlMsmWr <=  '0' when stMsmDWr02|stMsmFwr01|stMsmFwr03,
                '1' when others; -- Write enable (write strobe)
-- with stMsmCur select
--   ctlMsmFlashCs <= '0' when "---1"|"010-", -- FlashCS
--                    '1' when others; -- Flash chip select
ctlMsmFlashCs <= '0' 
   when (stMsmCur = stMsmFwr01 or
	      stMsmCur = stMsmFwr02 or
			stMsmCur = stMsmFwr03 or
			stMsmCur = stMsmFwr04 or
			stMsmCur = stMsmFwr05 or
			stMsmCur = stMsmFwr06 or
			stMsmCur = stMsmFwr07) or
		   ((stMsmCur = stMsmDir01 or
			  stMsmCur = stMsmDWr02 or
			  stMsmCur = stMsmDRd02 or
			  stMsmCur = stMsmDir03) and
			 regEppAdrIn(2 downto 0) = FlashAutoRW) else
						'1';
ctlMsmRamCs <= '0' 
   when  ((stMsmCur = stMsmDir01 or
			  stMsmCur = stMsmDWr02 or
			  stMsmCur = stMsmDRd02 or
			  stMsmCur = stMsmDir03) and
			 regEppAdrIn(2 downto 0) = RamAutoRW) else
						'1';

 with stMsmCur select
   ctlMsmDir <= '1' when "0--1"|"011-", -- stMsmFwr01-03, stMsmDWr02
                '0' when others;-- Memory bus direction: 1=toward memory
 with stMsmCur select
   ctlMsmAdrInc <= '1' when stMsmAdInc,
                   '0' when others; -- Flag to automatically increment 
      -- the address after a step of automatic memory access.
 with stMsmCur select
   ctlMsmWrCmd <= '1' when stMsmFwr01|stMsmFwr02,
                  '0' when others; 
     -- Flag to place write command on the BusMemOut
 with stMsmCur select
   ctlMsmDoneOut <=  '1' when stMsmDone,
                     '0' when others; 
     -- Flag to tell the Epp state machine the current access cycle ended

 -- Memory Control Register
 process (clk, ctlMsmDwrIn)
  begin
   if clk = '1' and clk'Event then
    if ctlMsmDwrIn = '1' and                    -- write cycle
       regEppAdrIn(2 downto 0) = MemCtrlReg and -- MemCtrlReg addressed
       ComponentSelect = '1' then -- NexysOnBoardMemCtrl comp. selected
     regMemCtl <= EppWrDataIn;
    end if;
   end if;
  end process;

 -- Memory Address Register/Counter
MsmAdrL: process (clk, ctlMsmDwrIn, ctlMsmAdrInc)
  begin
   if clk = '1' and clk'Event then
    if ctlMsmAdrInc = '1' then                 -- automatic memory cycle
     regMemAdr(7 downto 0) <= regMemAdr(7 downto 0) + 1; -- inc. address 
    elsif ctlMsmDwrIn = '1' and                -- Epp write cycle
          regEppAdrIn(2 downto 0) = MemAdrL and-- MemAdrL reg. addressed
          ComponentSelect = '1' then --NexysOnBoardMemCtrl comp.selected
     regMemAdr(7 downto 0) <= EppWrDataIn;     -- update MemAdrL content
    end if;
   end if;
  end process;
 carryoutL <= '1' when regMemAdr(7 downto 0) = x"ff" else 
              '0';                             -- Lower byte carry out

MsmAdrM: process (clk, ctlMsmDwrIn, ctlMsmAdrInc)
  begin
   if clk = '1' and clk'Event then
    if ctlMsmAdrInc = '1' and                  -- automatic memory cycle
       carryoutL = '1' then                    -- lower byte rollover
     regMemAdr(15 downto 8) <= regMemAdr(15 downto 8) + 1;--inc. address
    elsif ctlMsmDwrIn = '1' and                -- Epp write cycle
          regEppAdrIn(2 downto 0) = MemAdrM and-- MemAdrM reg. addressed
          ComponentSelect = '1' then --NexysOnBoardMemCtrl comp.selected
     regMemAdr(15 downto 8) <= EppWrDataIn;    -- update MemAdrM content
    end if;
   end if;
  end process;
 carryoutM <= '1' when regMemAdr(15 downto 8) = x"ff" else 
              '0';                             -- Middle byte carry out

MsmAdrH: process (clk, ctlMsmDwrIn, ctlMsmAdrInc)
  begin
   if clk = '1' and clk'Event then
    if ctlMsmAdrInc = '1' and                  -- automatic memory cycle
       carryoutL = '1' and                     -- lower byte rollover
       carryoutM = '1' then                    -- middle byte rollover
     regMemAdr(23 downto 16) <= regMemAdr(23 downto 16) + 1;--inc. addr.
    elsif ctlMsmDwrIn = '1' and                -- Epp write cycle
          regEppAdrIn(2 downto 0) = MemAdrH and-- MemAdrM reg. addressed
          ComponentSelect = '1' then --NexysOnBoardMemCtrl comp.selected
     regMemAdr(23 downto 16) <= EppWrDataIn;-- update MemAdrH 
    end if;
   end if;
  end process;

-- Memory write data holding register 
 process (clk, ctlMsmDwrIn)
  begin
   if clk = '1' and clk'Event then
    if ctlMsmDwrIn = '1' and                   -- Epp write cycle
       (regEppAdrIn(2 downto 0) = RamAutoRW or  -- | Any register holding
        regEppAdrIn(2 downto 0) = FlashAutoRW or-- | data to be written
        regEppAdrIn(2 downto 0) = MemDataWr) and-- | to memory
       ComponentSelect = '1' then
	   if regMemAdr(0) = '0' then -- even address
        regMemWrData(7 downto 0) <= EppWrDataIn;  --load lB regMemWrData
		else                       -- odd address 
        regMemWrData(15 downto 8) <= EppWrDataIn; --load uB regMemWrData
    	end if;
	 end if;
   end if;
  end process;      

 -- Memory read register: - holds data after an automatic read
 process (clk)
  begin
   if clk = '1' and clk'Event then
    if stMsmCur = stMsmDRd02 then    -- direct read state
     if ctlMcrWord = '1' and    -- word mode
	     regMemAdr(0) = '1' then	 -- odd address
		     null;			 -- should never happen
	  elsif ctlMcrWord = '1' and    -- word mode
	        regMemAdr(0) = '0' then	 -- even address
             regMemRdData <= busMemIn(7 downto 0); --update regMemRdData
             regMemRdDataAux <= busMemIn(15 downto 8);  
				                            -- update auxiliary regMemRdData
	  elsif ctlMcrWord = '0' and    -- byte mode
	        regMemAdr(0) = '0' then	 -- even address
             regMemRdData <= busMemIn(7 downto 0); --update regMemRdData
	  elsif ctlMcrWord = '0' and    -- byte mode
	        regMemAdr(0) = '1' and	 -- odd address
			  regEppAdrIn(2 downto 0) = RamAutoRW then
             regMemRdData <= busMemIn(15 downto 8);--update regMemRdData
	  elsif ctlMcrWord = '0' and    -- byte mode
	        regMemAdr(0) = '1' and	 -- odd address
			  regEppAdrIn(2 downto 0) = FlashAutoRW then
             regMemRdData <= busMemIn(7 downto 0); --update regMemRdData
     end if;
	 elsif stMsmCur = stMsmBlind then
	  if ctlMcrWord = '1' and    -- word mode
	     regMemAdr(0) = '1' then	 -- odd address
             regMemRdData <= regMemRdDataAux;  -- update regMemRdData
	  end if;
    end if;
   end if;
  end process;      

------------------------------------------------------------------------
 -- Memory Control State Machine
------------------------------------------------------------------------

 process (clk)
  begin
   if clk = '1' and clk'Event then
    stMsmCur <= stMsmNext;
   end if;
  end process;

 process (stMsmCur)

 variable flagMsmCycle: std_logic;   -- 1 => Msm cycle requested
 variable flagBlindCycle: std_logic; -- 1 => Blind Msm cycle requested:
     -- no memory cycle, but either:
 -- store the low regMemWrData byte in preparation for a 16 bit write or
 -- send the high regMemWrData byte after a 16 bit read cycle
 variable flagFlashAutoWr: std_logic; 
     -- 1 => Flash Auto Write Cycle cycle requested:

  begin

   if ctlMsmStartIn = '1' and  -- process launch 
		ComponentSelect = '1' and -- comp. selected
		((regEppAdrIn(2 downto 0) = FlashAutoRW) or
		 (regEppAdrIn(2 downto 0) = RamAutoRW)) then
	                 flagMsmCycle := '1';
	else
					     flagMsmCycle := '0';
	end if;

	if ctlMcrWord = '1' and  -- 16 bit mode 
		((ctlEppRdCycleIn = '0' and -- write cycle
		  regMemAdr(0) = '0') or -- even address
		 (ctlEppRdCycleIn = '1' and -- read cycle
		  regMemAdr(0) = '1')) then -- odd address
	                 flagBlindCycle := '1';
   else						   
				        flagBlindCycle := '0';
	end if;

	if regEppAdrIn = FlashAutoRW and  -- auto flash cycle requested  
		ctlEppRdCycleIn = '0' then -- write cycle
	                 flagFlashAutoWr := '1';
	else
				        flagFlashAutoWr := '0';
	end if;

   case stMsmCur is
    -- Idle state waiting for the beginning of an EPP cycle
    when stMsmReady =>
     if flagMsmCycle = '1' then
      if flagBlindCycle = '1' then
        stMsmNext <= stMsmBlind;  -- Blind state 
      elsif flagFlashAutoWr = '1' then
       stMsmNext <= stMsmFwr01;	 -- Flash auto write (with write cmd)
      else
       stMsmNext <= stMsmDir01;	 -- Direct access	(without cmds)
      end if;
     else
      stMsmNext <= stMsmReady;
     end if;

-- Automatic flash write cont.
    when stMsmFwr01 =>
     if DelayCnt = "00101" then
      stMsmNext <= stMsmFwr02;
     else 
      stMsmNext <= stMsmFwr01;
     end if;

    when stMsmFwr02 =>
     if DelayCnt = "00111" then
      stMsmNext <= stMsmFwr03;
     else 
      stMsmNext <= stMsmFwr02;
     end if;

    when stMsmFwr03 =>
     if DelayCnt = "01101" then
      stMsmNext <= stMsmFwr04;
     else 
      stMsmNext <= stMsmFwr03;
     end if;

    when stMsmFwr04 =>
     if DelayCnt = "01101" then
      stMsmNext <= stMsmFwr05;
     else 
      stMsmNext <= stMsmFwr04;
     end if;

    when stMsmFwr05 =>
     if DelayCnt = "--101" then
      if busMemIn(7) = '0' then 
       stMsmNext <= stMsmFwr06;
      else
       stMsmNext <= stMsmFwr04;
      end if;
     else 
      stMsmNext <= stMsmFwr05;
     end if;

    when stMsmFwr06 =>
     if DelayCnt = "--111" then
      stMsmNext <= stMsmFwr07;
     else 
      stMsmNext <= stMsmFwr06;
     end if;

    when stMsmFwr07 =>
     if DelayCnt = "--101" then
      if busMemIn(7) = '1' then 
       stMsmNext <= stMsmAdInc;
      else
       stMsmNext <= stMsmFwr06;
      end if;
     else 
      stMsmNext <= stMsmFwr07;
     end if;

-- Direct access cont.
     when stMsmDir01 =>
--       if DelayCnt = "---11" then
         if ctlEppRdCycleIn = '1' then
              stMsmNext <= stMsmDRd02;  -- Direct write
         else
              stMsmNext <= stMsmDWr02;  -- Direct read
         end if;
--     	 else
--              stMsmNext <= stMsmDir01;  -- keep state
--		 end if;

-- Direct write
     when stMsmDWr02 =>
       if DelayCnt = "--000" then
         stMsmNext <= stMsmDir03;
       else
         stMsmNext <= stMsmDWr02;  -- keep state
       end if;

-- Direct read cont.
     when stMsmDRd02 =>
       if DelayCnt = "--000" then
         stMsmNext <= stMsmDir03;
       else
         stMsmNext <= stMsmDRd02;  -- keep state
       end if;

     when stMsmDir03 =>
--       if DelayCnt = "---11" then
         stMsmNext <= stMsmAdInc;
--       else
--         stMsmNext <= stMsmDir03;  -- keep state
--       end if;

    when stMsmAdInc =>
     stMsmNext <= stMsmDone;

    when stMsmDone =>
     if ctlMsmStartIn = '1' then 
      stMsmNext <= stMsmDone;
     else
      stMsmNext <= stMsmReady;
     end if;

-- Automatic flash read cont.
    when stMsmBlind =>
      stMsmNext <= stMsmAdInc;

-- Unknown states
    when others =>
     stMsmNext <= stMsmReady;
   end case;
  end process;

------------------------------------------------------------------------
 -- Delay Counter
------------------------------------------------------------------------

 process (clk)
  begin
   if clk'event and clk = '1' then
    if stMsmCur = stMsmReady then
     DelayCnt <= "00000";
    else
     DelayCnt <= DelayCnt + 1;
    end if;
   end if;
  end process;

end Behavioral;
