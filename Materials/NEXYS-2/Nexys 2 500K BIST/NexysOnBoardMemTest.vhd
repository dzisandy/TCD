------------------------------------------------------------------------
--  NexysOnBoardMemTest.vhd -- Digilent C1 Memory Module programming controller
------------------------------------------------------------------------
--  Author : Mircea Dabacan
--           Copyright 2006 Digilent, Inc.
------------------------------------------------------------------------
-- Software version: Xilinx ISE 7.1.03i
--                   WebPack
------------------------------------------------------------------------
-- This is the source file for the PhoenixOnBoardMemTest component, 
-- provided by the Digilent Component Library.

-- This file contains the design for a memory test controller.
-- This component shortly tests the RAM and Flash memory chips on the 
-- Digilent Nexys2 board and displays the result on the 7-seg display.
-- This component, in conjunction with a communication module
-- (Nexys OnBoard USB controller),
-- a PC application program (a Digilent utility or user generated) 
-- and the EppCtrl Digilent Library component allows the user to
-- read the test status.

------------------------------------------------------------------------
--  Behavioral description
------------------------------------------------------------------------
-- PhoenixOnBoardMemTest implements the following registers:
------------------------------------------------------------------------
-- The component implements a set of 7 Epp registers (read only) 
-- for PC interface (via USB):

--  Register Function
--  -------- --------
--     0     Test Status register 
--     1     Memory address bits 0-7
--     2     Memory address bits 8-15
--     3     Memory address bits 16-23
--     4     Expected Data bits 0 - 7
--     5     Expected Data bits 8 - 15
--     6     Read Data bits 0 - 7
--     7     Read Data bits 8 - 15
--
-- The registers can be read at any time, but registers 1 - 7 only 
-- provide steady values after the test ends(see test description below)

-- Test description:
-- There are three sub-tests implemented:
--    The RAM test:

--      Write RAM (status = 0x00)
--      Writes the whole RAM on the Nexys board with a sequence of 
--       16 bit words, as below:
--       0x0000, 0x0001, 0x0002, ... 0xfffe, 0x0000, ...
--       Skiping value 0xffff, avoids address - data matching for all
--       the memory range.

--      Read RAM (status = 0x02)
--      Reads back the whole RAM and compares to the data pattern above.
--       If no differencies, continues with the Flash QRY test.
--       If a difference, the test ends with an RAM error message:

--      RAM error message (status alternates 0x03, 0x01)
--      Test is ended and the 7-seg displays alternate the messages:
--       FAIL, 1
--       In this state:
--         - registers 1, 2, 3 show the ADR+2 (ADR = mismach address)
--         - registers 4, 5 show the ExpData+1 (ExpData = expected data)
--         - registers 6, 7 show the actual RAM data.

--    Flash QRY test:
--      Set Flash chip in "read QRY" mode (status = 0x06)
--      Read Flash QRY (status = 0x04)
--      Read Flash addresses 0x000020, 0x0000022, 0x000024 and compare 
--       to the string "0x0051, 0x0052, 0x0059" (ASCII codes for "QRY)
--       If no differencies, continues with the Flash IDC test.
--       If a difference, the test ends with an QRY error message:
--       
--      QRY error message (status alternates 0x05, 0x07)
--      Test is ended and the 7-seg displays alternate the messages:
--       FAIL, 2
--       In this state:
--         - registers 1, 2, 3 show the ADR+2 (ADR = mismach address)
--         - registers 4, 5 show the ExpData (ExpData = expected data)
--         - registers 6, 7 show the actual RAM data.

--    Flash IDC test:
--      Set Flash chip in "read IDC" mode (status = 0x0c)
--      Read Flash IDC (status = 0x0e)
--      Read Flash addresses 0x000000, 0x0000001 and compare 
--       to the string "0x0089, 0x00yy, (Intel ID and Flash size codes:
--       yy = 16 -  32Mbits
--       yy = 17 -  64Mbits
--       yy = 18 - 128Mbits
--       yy = 1d - 256Mbits)
--       If no differencies, continues with the set Flash in Array mode.
--       If a difference, the test ends with an IDC error message:
--       
--      IDC error message (status alternates 0x0f, 0x0d)
--      Test is ended and the 7-seg displays alternate the messages:
--       FAIL, 3
--       In this state:
--         - registers 1, 2, 3 show the ADR+2 (ADR = mismach address)
--         - registers 4, 5 show the ExpData (ExpData = expected data)
--         - registers 6, 7 show the actual RAM data.

--      Set Flash chip in "read array" mode (status = 0x0a)
--      PASS message (status alternates 0x0b, 0x09)
--      Test is ended and the 7-seg displays alternate the messages:
--       PASS, zzzz (zzzz show the Flash sizs (in Mbits)) 
--       In this state:
--         - registers 1, 2, 3 show the 0x000006 
--         - registers 4, 5 show the ExpData (0x00ff)
--         - registers 6, 7 show the actual RAM data (0x00yy).

-- Test is running while the status is any even value (bit 0x01 = 0):
-- 0x00, 0x02, 0x04, 0x06, 0x08, 0x0a, 0x0c, 0x0e

-- Test is done while the status is any odd value (bit 0x01 = 1):
-- 0x01, 0x03, 0x05, 0x07, 0x09, 0x0b, 0x0d, 0x0f

-- Reading from any register generates a simple 
-- Register Transfer (see the EppCtrl.vhd header): 
-- the HandShakeReqOut is inactive.
-- (see the EppCtrl.vhd Component Header)

------------------------------------------------------------------------
-- Revision History:
-- 10/21/2004(MirceaD): created as MemCtrl
-- 12/19/2005(MirceaD): modified for PhoenixOnBoard Memory
-- 07/10/2006(MirceaD): modified for automatic RAM/Flash Test
------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity NexysOnBoardMemTest is
  Port(
       clk  : in std_logic;       -- system clock (50MHz)
-- Epp interface signals          (NU = not used in the current project)
       HandShakeReqOut: out std_logic; -- User Handshake Request  (NU)
       ctlMsmStartIn: in std_logic;    -- Automatic process Start (NU)
       ctlMsmDoneOut: out std_logic;   -- Automatic process Done  (NU)
       ctlMsmDwrIn: in std_logic;      -- Data Write pulse        (NU)
       ctlEppRdCycleIn: in std_logic;  -- Indicates a READ Epp cycle
       EppRdDataOut: out std_logic_vector(7 downto 0);-- Data Input bus
       EppWrDataIn: in std_logic_vector(7 downto 0);--DataOutput bus(NU)
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
       MemAdr: out std_logic_vector(23 downto 1);-- Memory Address bus
       FlashByte: out std_logic; -- Byte enable('0') or word enable('1')
       RamCS: out std_logic;   -- RAM CS
       FlashCS: out std_logic; -- Flash CS
       MemWR: out std_logic;   -- memory write 
       MemOE: out std_logic;    -- memory read (Output Enable), 
		                         -- also controls the MemDB direction
       RamUB: out std_logic;   -- RAM Upper byte enable 
       RamLB: out std_logic;   -- RAM Lower byte enable 
       RamCre: out std_logic;  -- Cfg Register enable 
       RamAdv: out std_logic;  -- RAM Address Valid pin
       RamClk: out std_logic;  -- RAM Clock 
       RamWait: in std_logic;  -- RAM Wait pin 
       FlashRp: out std_logic; -- Flash RP pin 
       FlashStSts: in std_logic; -- Flash ST-STS pin 
		  
       TestCtrlEnabled: out std_logic; -- MemCtrl takes bus control 

-- Display signals
        seg: out std_logic_vector(6 downto 0);
        an:  out std_logic_vector(3 downto 0)
       );
end NexysOnBoardMemTest;

architecture Behavioral of NexysOnBoardMemTest is

------------------------------------------------------------------------
-- Constant and Signal Declarations
------------------------------------------------------------------------

-- Test FSM states 

constant stTestReady           :std_logic_vector(3 downto 0) := "1000";
constant stTestWrRam           :std_logic_vector(3 downto 0) := "0000";
constant stTestRdRam           :std_logic_vector(3 downto 0) := "0010";
constant stTestWrFlash1        :std_logic_vector(3 downto 0) := "0110";
constant stTestRdFlash1        :std_logic_vector(3 downto 0) := "0100";
constant stTestWrFlash2        :std_logic_vector(3 downto 0) := "1100";
constant stTestRdFlash2        :std_logic_vector(3 downto 0) := "1110";
constant stTestWrFlash3        :std_logic_vector(3 downto 0) := "1010";
constant stTestPassed1         :std_logic_vector(3 downto 0) := "1011";
constant stTestPassed2         :std_logic_vector(3 downto 0) := "1001";
constant stTestFailedRam1      :std_logic_vector(3 downto 0) := "0011";
constant stTestFailedRam2      :std_logic_vector(3 downto 0) := "0001";
constant stTestFailedFlashQRY1 :std_logic_vector(3 downto 0) := "0101";
constant stTestFailedFlashQRY2 :std_logic_vector(3 downto 0) := "0111";
constant stTestFailedFlashId1  :std_logic_vector(3 downto 0) := "1111";
constant stTestFailedFlashId2  :std_logic_vector(3 downto 0) := "1101";

signal stTestCur  :std_logic_vector(3 downto 0) := stTestReady;
signal stTestNext :std_logic_vector(3 downto 0);

 -- The following constants define the state codes for the Memory
 -- control state machine. This state machine controls the sequence
 -- of operations needed to perform a write sequence or a read sequence
 -- on either flash or RAM memory. 
 -- The states are such a way assigned that each transition
 -- changes a single state register bit (Grey code - like)
 constant stMsmAdInc: std_logic_vector(2 downto 0) := "010";
 constant stMsmDone : std_logic_vector(2 downto 0) := "110";
 constant stMsmDir01: std_logic_vector(2 downto 0) := "000";
 constant stMsmDWr02: std_logic_vector(2 downto 0) := "001";
 constant stMsmDir03: std_logic_vector(2 downto 0) := "011";
 constant stMsmDRd02: std_logic_vector(2 downto 0) := "100";
 constant stMsmDRd03: std_logic_vector(2 downto 0) := "101";
 constant stMsmDRd04: std_logic_vector(2 downto 0) := "111";

-- Epp Data register addresses
constant TestStatusReg:  std_logic_vector(2 downto 0) := "000"; 
     --  0 Memory control register (read/write)
constant MemAdrL:     std_logic_vector(2 downto 0) := "001";
     --  1 Memory address bits 0-7 (read/write)
constant MemAdrM:     std_logic_vector(2 downto 0) := "010";
     --  2 Memory address bits 8-15 (read/write)
constant MemAdrH:     std_logic_vector(2 downto 0) := "011";
     --  3 Memory address bits 16-21 (read/write)
constant ExpDataL:  std_logic_vector(2 downto 0) := "100"; 
     --  4 Data pattern (low) expected (read)
constant ExpDataH:  std_logic_vector(2 downto 0) := "101"; 
     --  5 Data pattern (high) expected (read)
constant MemDataRdL:   std_logic_vector(2 downto 0) := "110";
     --  6 Memory actual data (low) (read)
constant MemDataRdH:   std_logic_vector(2 downto 0) := "111";
     --  7 Memory actual data (high) (read)

-- State register and next state for the FSMs
signal stMsmCur : std_logic_vector(2 downto 0) := stMsmDir01;
signal stMsmNext : std_logic_vector(2 downto 0);

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
attribute fsm_extract of stTestCur: signal is "no"; 
attribute fsm_extract of stTestNext: signal is "no"; 

attribute fsm_encoding : string;
attribute fsm_encoding of stMsmCur: signal is "user"; 
attribute fsm_encoding of stMsmNext: signal is "user"; 
attribute fsm_encoding of stTestCur: signal is "user"; 
attribute fsm_encoding of stTestNext: signal is "user"; 

attribute signal_encoding : string;
attribute signal_encoding of stMsmCur: signal is "user"; 
attribute signal_encoding of stMsmNext: signal is "user";
attribute signal_encoding of stTestCur: signal is "user"; 
attribute signal_encoding of stTestNext: signal is "user";

-- Signals dealing with memory chips
--signal regMemCtl: std_logic_vector(7 downto 0):= x"1f";
     -- Memory Control register
signal regMemAdr: std_logic_vector(23 downto 0):= x"000000";
     -- Memory Address register
signal carryoutL:std_logic:='0';
     -- Carry out for memory address low byte
signal carryoutM:std_logic:='0';
     -- Carry out for memory address middle byte
signal regMemWrData: std_logic_vector(15 downto 0) := x"0000";
     -- Memory Write Data register
signal regMemRdData: std_logic_vector(15 downto 0) := x"0000";  
     -- Memory Read Data register
signal busMemIn: std_logic_vector(15 downto 0);   
--signal busMemInHigh: std_logic_vector(7 downto 0);   
signal busMemOut: std_logic_vector(15 downto 0);

-- Signals in the memory control register - NOT USED
--signal ctlMcrOe: std_logic;      -- Output enable (read strobe)
--signal ctlMcrWr: std_logic;      -- Write enable (write strobe)
--signal ctlMcrRAMCs: std_logic;   -- RAM chip select
--signal ctlMcrFlashCs: std_logic; -- Flash chip select
--signal ctlMcrWord: std_logic := '1';    -- Word signal ('1')

--signal ctlMcrDir: std_logic;     -- composed out of previous ones

-- Signals used by Memory control state machine
signal ctlMsmOe : std_logic;
signal ctlMsmWr : std_logic;
signal ctlMsmRAMCs : std_logic;
signal ctlMsmFlashCs : std_logic;
signal ctlMsmDir : std_logic;
--signal ctlMsmAdrInc : std_logic;
signal ctlMsmWrCmd : std_logic;

signal flagTestRun: std_logic;    -- '1' => Memory Test running
                                  --        Enables the MemTest
                                  -- '0' => Memory Test ended
signal flagMsmWrCycle: std_logic; -- '1' => Write cycle in progress
signal flagRightCode: std_logic;  -- '1' => Right QRY ir ID code

constant maxMemAdr: std_logic_vector (23 downto 0) := x"7ffffe";
type typestrQRY is array(0 to 2) of std_logic_vector(15 downto 0);
constant strQRY: typestrQRY :=     (x"0051",    --Q
                                    x"0052",    --R
                                    x"0059");   --Y
signal cntTimer : std_logic_vector(25 downto 0);

alias cntDisp: std_logic_vector(1 downto 0) is cntTimer(16 downto 15);
   -- a fragment of cntTimer used for 7 seg display control:
   -- cntTimer counts 50MHz/2^15 ~ 1525Hz

------------------------------------------------------------------------
-- Module Implementation
------------------------------------------------------------------------
    
begin

------------------------------------------------------------------------
-- Map basic status and control signals
------------------------------------------------------------------------
 TestCtrlEnabled <= flagTestRun;

-- Epp signals
   -- Port signals
 EppRdDataOut <=
   "0000" & stTestCur        when regEppAdrIn(2 downto 0) = TestStatusReg
                               and ComponentSelect = '1' else
   regMemAdr(7 downto 0)     when regEppAdrIn(2 downto 0) = MemAdrL 
                               and ComponentSelect = '1' else
   regMemAdr(15 downto 8)    when regEppAdrIn(2 downto 0) = MemAdrM 
                               and ComponentSelect = '1' else
   regMemAdr(23 downto 16)
                             when regEppAdrIn(2 downto 0) = MemAdrH 
                               and ComponentSelect = '1' else
   regMemWrData(7 downto 0)  when regEppAdrIn(2 downto 0) = ExpDataL
                               and ComponentSelect = '1' else
   regMemWrData(15 downto 8) when regEppAdrIn(2 downto 0) = ExpDataH
                               and ComponentSelect = '1' else
   regMemRdData(7 downto 0)  when regEppAdrIn(2 downto 0) = MemDataRdL 
                               and ComponentSelect = '1' else
   regMemRdData(15 downto 8) when regEppAdrIn(2 downto 0) = MemDataRdH 
                               and ComponentSelect = '1' else
   "00000000"; -- prepared to "OR" EppRdDataOut to some other busses

-- Memory signals

-- Memory control bus driven by automatic test state machine 

   flagTestRun <= '1' when (stTestCur = stTestReady or 
                            stTestCur = stTestWrRam or 
                            stTestCur = stTestRdRam or 
                            stTestCur = stTestWrFlash1 or
                            stTestCur = stTestRdFlash1 or
                            stTestCur = stTestWrFlash2 or
                            stTestCur = stTestRdFlash2 or
                            stTestCur = stTestWrFlash3) else

                  '0';

   flagMsmWrCycle <= '1' when (stTestCur = stTestWrRam or 
                               stTestCur = stTestWrFlash1 or
                               stTestCur = stTestWrFlash2 or
                               stTestCur = stTestWrFlash3) else
                  '0';

 RamCS <= 'Z'   when flagTestRun = '0' else	-- MemCtrl Disabled
			    ctlMsmRAMCs;                      -- MemCtrl generated RAM CS;
				 
 FlashCS <= 'Z' when flagTestRun = '0' else	-- MemCtrl Disabled
				ctlMsmFlashCs;                      -- MemCtrl generated Flash CS;

 MemOE   <= 'Z' when flagTestRun = '0' else	-- MemCtrl Disabled
 				ctlMsmOe;                           -- MemCtrl generated RAM CS;
 
 MemWR   <= 'Z' when flagTestRun = '0' else		-- MemCtrl Disabled
				ctlMsmWr;                           -- MemCtrl generated RAM CS;
 
 FlashByte <= 'Z' when flagTestRun = '0' else		-- MemCtrl Disabled
              '1';      -- Always in Word format;
   								    -- Byte enable ('0') or word enable ('1')

 RamLB <= 'Z' when flagTestRun = '0' else		-- MemCtrl Disabled
          '0';                              -- word mode

 RamUB <= 'Z' when flagTestRun = '0' else		-- MemCtrl Disabled
          '0';                              -- word mode

-- Memory control signals not yet used
 RamClk <= 'Z'       when flagTestRun = '0' else		-- MemCtrl Disabled 
           '0'; -- inactive for asinchronous mode

 RamCre <= 'Z'       when flagTestRun = '0' else		-- MemCtrl Disabled
           '0'; -- inactive for asinchronous default mode

 RamAdv <= 'Z'       when flagTestRun = '0' else		-- MemCtrl Disabled
           '0'; -- inactive for asinchronous mode

 FlashRp	<= 'Z'       when flagTestRun = '0' else		-- MemCtrl Disabled 
            '1'; -- no reset, no power down

 busMemIn <= MemDB;

 MemAdr <= "ZZZZZZZ" & "ZZZZZZZZ" & "ZZZZZZZZ" 
                 when flagTestRun = '0' else		-- MemCtrl Disabled
           regMemAdr(23 downto 1);

 MemDB <= regMemWrData when flagTestRun = '1' and -- MemCtrl Enabled
                         (ctlMsmDir = '1') else -- Msm controlled 
          "ZZZZZZZZ" & "ZZZZZZZZ";

-- Handshake signal
 HandShakeReqOut <=  '0'; --not used

-- Memory state machine related signals

-- Control commands generated by the memory state machine.
 with stMsmCur select
   ctlMsmOe <= '0' when stMsmDRd02|stMsmDRd03|stMsmDRd04,
               '1' when others; -- Output enable (read strobe)

 with stMsmCur select
   ctlMsmWr <=  '0' when stMsmDWr02,
                '1' when others; -- Write enable (write strobe)

ctlMsmFlashCs <= '0' 
   when (stMsmCur = stMsmDWr02 or
			   stMsmCur = stMsmDRd02 or
			   stMsmCur = stMsmDRd03 or
			   stMsmCur = stMsmDRd04) and
        (stTestCur = stTestWrFlash1 or
			   stTestCur = stTestRdFlash1 or
         stTestCur = stTestWrFlash2 or
			   stTestCur = stTestRdFlash2 or
			   stTestCur = stTestWrFlash3) else
						'1';

ctlMsmRamCs <= '0' 
   when  (stMsmCur = stMsmDWr02 or
			    stMsmCur = stMsmDRd02 or
			    stMsmCur = stMsmDRd03 or
			    stMsmCur = stMsmDRd04) and
			   (stTestCur = stTestWrRam or
   			  stTestCur = stTestRdRam) else
               '1';

 with stMsmCur select
   ctlMsmDir <= '1' when stMsmDWr02,
                '0' when others;-- Memory bus direction: 1=toward memory

 -- Memory Address Register/Counter

regMemAdr(0) <= '0';     -- init.addr. for RAM read


MsmAdrL: process (clk)
  begin
   if clk = '1' and clk'Event then
    if stTestCur = stTestReady then        -- initial test state
       regMemAdr(7 downto 1) <= "0000000";     -- init Adr reg 
    elsif stMsmCur = stMsmAdInc then              -- address incremet state
     if regMemAdr = maxMemAdr and              -- max RAM size
        stTestCur = stTestWrRam then           -- write RAM
       regMemAdr(7 downto 1) <= "0000000";     -- init.addr. for RAM read
     elsif stTestCur = stTestWrFlash1 then     -- set "Read QRY" command
       regMemAdr(7 downto 1) <= "0010000";     -- init.addr. for read QRY
     elsif stTestCur = stTestWrFlash2 then      -- set "Read Idc" command
       regMemAdr(7 downto 1) <= "0000000";     -- init. address for read Idc
     else
       regMemAdr(7 downto 1) <= regMemAdr(7 downto 1) + 1; -- inc. address 
     end if;
    end if;
   end if;
  end process;
 carryoutL <= '1' when regMemAdr(7 downto 0) = x"fe" else 
              '0';                             -- Lower byte carry out

MsmAdrM: process (clk)
  begin
   if clk = '1' and clk'Event then
    if stTestCur = stTestReady then        -- initial test state
       regMemAdr(15 downto 8) <= x"00";     -- init Adr reg 
    elsif stMsmCur = stMsmAdInc and              -- address incremet state
       carryoutL = '1' then                    -- lower byte rollover
     if regMemAdr = maxMemAdr then
       regMemAdr(15 downto 8) <= "00000000"; -- init. address 
     else
       regMemAdr(15 downto 8) <= regMemAdr(15 downto 8) + 1; -- inc. address 
     end if;
    end if;
   end if;
  end process;
 carryoutM <= '1' when regMemAdr(15 downto 8) = x"ff" else 
              '0';                             -- Middle byte carry out

MsmAdrH: process (clk)
  begin
   if clk = '1' and clk'Event then
    if stTestCur = stTestReady then        -- initial test state
       regMemAdr(23 downto 16) <= x"00";     -- init Adr reg 
    elsif stMsmCur = stMsmAdInc and              -- address incremet state
       carryoutL = '1' and                     -- lower byte rollover
       carryoutM = '1' then                    -- middle byte rollover
     if regMemAdr = maxMemAdr then
       regMemAdr(23 downto 16) <= "00000000"; -- init. address 
     else
       regMemAdr(23 downto 16) <= regMemAdr(23 downto 16) + 1; -- inc. address 
     end if;
    end if;
   end if;
  end process;

 -- Memory read register: - holds data after an automatic read
 process (clk)
  begin
   if clk = '1' and clk'Event then
    if stMsmCur = stMsmDRd04 then    -- direct read state
         regMemRdData <= busMemIn;  -- update regMemRdData
    end if;
   end if;
  end process;      

-- Memory write data holding register 
ExpData:process(clk, stTestCur)	  -- Error flag
  begin
   if clk = '1' and clk'Event then
    if stTestCur = stTestWrFlash1 then
         regMemWrData <= x"0098";   -- read QRY command 
    elsif stTestCur = stTestWrFlash2 then
         regMemWrData <= x"0090";   -- read Id Code command 
    elsif stTestCur = stTestWrFlash3 then
         regMemWrData <= x"00FF";   -- read Array command 
    elsif stTestCur = stTestRdFlash2 and
          regMemAdr = x"000000" then
         regMemWrData <= x"0089";  -- Expected Manufacturer code (Intel) 
    elsif stTestCur = stTestRdFlash2 and
          regMemAdr = x"000002" then
         regMemWrData <= x"0018";  -- Expected Flash size (128Mbit) 
    elsif stTestCur = stTestRdFlash1 then
         regMemWrData <= strQRY(CONV_INTEGER(regMemAdr(2 downto 1)));
    elsif stTestCur = stTestReady then    -- initial test state
         regMemWrData <= x"0000";   -- init Data reg 
    elsif stMsmCur = stMsmAdInc then    -- between mem cycles

      if stTestCur = stTestWrRam or  -- RAM write state
         stTestCur = stTestRdRam then  -- RAM read state
        if regMemAdr = maxMemAdr then      -- RAM wr done
             regMemWrData <= x"0000";   -- re-init for RAM read 
        elsif regMemWrData = x"FFFE" then
		       regMemWrData <= x"0000";	  -- 2^15-1 cycle
	      else 
		       regMemWrData <= regMemWrData + 1;	-- running pattern
        end if;
      end if;
    end if;
   end if;
  end process;

------------------------------------------------------------------------
 -- Test Control State Machine
------------------------------------------------------------------------

 process (clk)
  begin
   if clk = '1' and clk'Event then
    stTestCur <= stTestNext;
   end if;
  end process;

 process (stTestCur)
  begin

   case stTestCur is
-- initial state
     when stTestReady =>
         stTestNext <= stTestWrRam;

-- write RAM state
     when stTestWrRam =>
       if regMemAdr = maxMemAdr and      -- RAM wr done
          stMsmCur = stMsmAdInc then    -- between mem cycles
         stTestNext <= stTestRdRam;
       else
         stTestNext <= stTestWrRam;
       end if;

-- read RAM state
     when stTestRdRam =>
       if stMsmCur = stMsmAdInc then    -- between mem cycles
         if regMemRdData /= regMemWrData then -- wrong data
           stTestNext <= stTestFailedRam1;
         elsif regMemAdr = maxMemAdr then      -- RAM read done
           stTestNext <= stTestWrFlash1;
         else
           stTestNext <= stTestRdRam;
         end if;
       else
         stTestNext <= stTestRdRam;
       end if;

-- set Flash in Read QRY Code state
     when stTestWrFlash1 =>
       if stMsmCur = stMsmAdInc then    -- between mem cycles
         stTestNext <= stTestRdFlash1;
       else
         stTestNext <= stTestWrFlash1;
       end if;

-- read Flash QRY Code
     when stTestRdFlash1 =>
       if stMsmCur = stMsmAdInc then    -- between mem cycles
         if regMemRdData /= regMemWrData then -- wrong
           stTestNext <= stTestFailedFlashQRY1;
         elsif CONV_INTEGER(regMemAdr(2 downto 1)) = strQRY'length - 1 then
                                                       -- QRY read done
           stTestNext <= stTestWrFlash2;
         else
           stTestNext <= stTestRdFlash1;
         end if;
       else
         stTestNext <= stTestRdFlash1;
       end if;

-- set Flash in Read Identifier Codes state
     when stTestWrFlash2 =>
       if stMsmCur = stMsmAdInc then    -- between mem cycles
         stTestNext <= stTestRdFlash2;
       else
         stTestNext <= stTestWrFlash2;
       end if;

-- read Flash Identifier Codes
     when stTestRdFlash2 =>
       if stMsmCur = stMsmAdInc then    -- between mem cycles
         if flagRightCode = '0' then                -- wrong code
           stTestNext <= stTestFailedFlashId1;
         elsif regMemAdr(1) = '1' then         -- Flash Id read done
           stTestNext <= stTestWrFlash3;
         else
           stTestNext <= stTestRdFlash2;
         end if;
       else
         stTestNext <= stTestRdFlash2;
       end if;

-- set Flash in Read Array state
     when stTestWrFlash3 =>
       if stMsmCur = stMsmAdInc then    -- between mem cycles
         stTestNext <= stTestPassed1;
       else
         stTestNext <= stTestWrFlash3;
       end if;

-- Display "PASS"
     when stTestPassed1 =>
       if conv_integer(cntTimer) = 0 then            -- timer overflow
         stTestNext <= stTestPassed2;
       else
         stTestNext <= stTestPassed1;
       end if;

-- Display Flash size
     when stTestPassed2 =>
       if conv_integer(cntTimer) = 0 then            -- timer overflow
         stTestNext <= stTestPassed1;
       else
         stTestNext <= stTestPassed2;
       end if;

-- Display "FAIL" - for RAM
     when stTestFailedRam1 =>
       if conv_integer(cntTimer) = 0 then            -- timer overflow
         stTestNext <= stTestFailedRam2;
       else
         stTestNext <= stTestFailedRam1;
       end if;

-- Display "rAm"
     when stTestFailedRam2 =>
       if conv_integer(cntTimer) = 0 then            -- timer overflow
         stTestNext <= stTestFailedRam1;
       else
         stTestNext <= stTestFailedRam2;
       end if;

-- Display "FAIL" - for QRY
     when stTestFailedFlashQRY1 =>
       if conv_integer(cntTimer) = 0 then            -- timer overflow
         stTestNext <= stTestFailedFlashQRY2;
       else
         stTestNext <= stTestFailedFlashQRY1;
       end if;
  
-- Display "QRY"
     when stTestFailedFlashQRY2 =>
       if conv_integer(cntTimer) = 0 then            -- timer overflow
         stTestNext <= stTestFailedFlashQRY1;
       else
         stTestNext <= stTestFailedFlashQRY2;
       end if;

-- Display "FAIL" - for Idc
     when stTestFailedFlashId1 =>
       if conv_integer(cntTimer) = 0 then            -- timer overflow
         stTestNext <= stTestFailedFlashId2;
       else
         stTestNext <= stTestFailedFlashId1;
       end if;

-- Display "idc"
     when stTestFailedFlashId2 =>
       if conv_integer(cntTimer) = 0 then            -- timer overflow
         stTestNext <= stTestFailedFlashId1;
       else
         stTestNext <= stTestFailedFlashId2;
       end if;

     when others =>
         stTestNext <= stTestWrRam;   


   end case;
  end process;

flagRightCode <= '1' when (regMemAdr(1) = '0' and      -- address 0
                           regMemRdData = x"89") else  -- Intel code
                 '1' when regMemAdr(1) = '1' and       -- address 1
                          (regMemRdData = x"16" or     --  32Mb flash
                           regMemRdData = x"17" or     --  64Mb flash
                           regMemRdData = x"18" or     -- 128Mb flash
                           regMemRdData = x"1d") else  -- 256Mb flash
                 '0';                                  -- wrong code

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
  begin

   case stMsmCur is

-- direct access
     when stMsmDir01 =>
       if stTestCur = stTestReady then
         stMsmNext <= stMsmDir01;
       elsif flagTestRun = '0' then -- test ended
         stMsmNext <= stMsmDone;
       elsif flagMsmWrCycle = '1' then  -- write to RAM cycle
         stMsmNext <= stMsmDWr02;
       else
         stMsmNext <= stMsmDRd02;     -- read (either from RAM or Flash)
       end if;


-- Direct write
     when stMsmDWr02 =>
       if DelayCnt = "--111" then
         stMsmNext <= stMsmDir03;
       else
         stMsmNext <= stMsmDWr02;  -- keep state
       end if;

-- Direct read cont.
     when stMsmDRd02 =>
         stMsmNext <= stMsmDRd03;

-- Direct read cont.
     when stMsmDRd03 =>
         stMsmNext <= stMsmDRd04;  -- keep state

-- Direct read cont.
     when stMsmDRd04 =>
       if DelayCnt = "--111" then
         stMsmNext <= stMsmDir03;
       else
         stMsmNext <= stMsmDRd04;  -- keep state
       end if;

     when stMsmDir03 =>
         stMsmNext <= stMsmAdInc;

    when stMsmAdInc =>
       stMsmNext <= stMsmDir01;

    when stMsmDone =>                -- test ended
       if flagTestRun = '1' then
         stMsmNext <= stMsmDir01;    -- recovering from unknown states
       else stMsmNext <= stMsmDone;
       end if;
--     null;

-- Unknown states
    when others =>
     stMsmNext <= stMsmDone;

   end case;
  end process;

------------------------------------------------------------------------
 -- Delay Counter
------------------------------------------------------------------------

 process (clk)
  begin
   if clk'event and clk = '1' then
    if stMsmCur = stMsmAdInc then
     DelayCnt <= "00000";
    else
     DelayCnt <= DelayCnt + 1;
    end if;
   end if;
  end process;

------------------------------------------------------------------------
 -- Timer Counter
------------------------------------------------------------------------

 process (clk)
  begin
   if clk'event and clk = '1' then
     cntTimer <= cntTimer + '1';
   end if;
  end process;

------------------------------------------------------------------------
 -- 7 segment display
------------------------------------------------------------------------
anodeCtrl:process(cntDisp)
  begin  
    if cntDisp ="00" then
      an <= "1110";
    elsif cntDisp ="01" then
      an <= "1101";
    elsif cntDisp ="10" then
      an <= "1011";
    else
      an <= "0111";
    end if;
  end process;

cathodeCtrl:process(cntDisp)
  begin  
    if stTestCur = stTestWrRam or
       stTestCur = stTestRdRam or
       stTestCur = stTestWrFlash1 or
       stTestCur = stTestRdFlash1 or
       stTestCur = stTestWrFlash2 or
       stTestCur = stTestRdFlash2 or
       stTestCur = stTestWrFlash3 then
     if cntDisp ="11" then
      seg <= "1111111"; -- blank
     elsif cntDisp ="10" then
      seg <= "0101111"; -- r
     elsif cntDisp ="01" then
      seg <= "1100011"; -- u
     else
      seg <= "0101011"; -- n
     end if;

    elsif stTestCur = stTestFailedRam1  or
       stTestCur = stTestFailedFlashQRY1  or
       stTestCur = stTestFailedFlashId1 then
     if cntDisp ="11" then
      seg <= "0001110"; -- F
     elsif cntDisp ="10" then
      seg <= "0001000"; -- A
     elsif cntDisp ="01" then
      seg <= "1001111"; -- I
     else
      seg <= "1000111"; -- L
     end if;

    elsif stTestCur = stTestFailedRam2 then
     if cntDisp ="11" then
      seg <= "1111111"; -- blank
     elsif cntDisp ="10" then
      seg <= "1111111"; -- blank
     elsif cntDisp ="01" then
      seg <= "1111111"; -- blank
     else
      seg <= "1111001"; -- 1
     end if;

    elsif stTestCur = stTestFailedFlashQRY2 then
     if cntDisp ="11" then
      seg <= "1111111"; -- blank
     elsif cntDisp ="10" then
      seg <= "1111111"; -- blank
     elsif cntDisp ="01" then
      seg <= "1111111"; -- blank
     else
      seg <= "0100100"; -- 2
     end if;

    elsif stTestCur = stTestFailedFlashId2 then
     if cntDisp ="11" then
      seg <= "1111111"; -- blank
     elsif cntDisp ="10" then
      seg <= "1111111"; -- blank
     elsif cntDisp ="01" then
      seg <= "1111111"; -- blank
     else
      seg <= "0110000"; -- 3
     end if;

    elsif stTestCur = stTestPassed1 then
     if cntDisp ="11" then
      seg <= "0001100"; -- P
     elsif cntDisp ="10" then
      seg <= "0001000"; -- A
     elsif cntDisp ="01" then
      seg <= "0010010"; -- S
     else
      seg <= "0010010"; -- S
     end if;

    elsif stTestCur = stTestPassed2 and
          regMemRdData = x"16" then
     if cntDisp ="11" then
      seg <= "1111111"; -- blank
     elsif cntDisp ="10" then
      seg <= "1111111"; -- blank
     elsif cntDisp ="01" then
      seg <= "0110000"; -- 3
     else
      seg <= "0100100"; -- 2
     end if;

    elsif stTestCur = stTestPassed2 and
          regMemRdData = x"17" then
     if cntDisp ="11" then
      seg <= "1111111"; -- blank
     elsif cntDisp ="10" then
      seg <= "1111111"; -- blank
     elsif cntDisp ="01" then
      seg <= "0000010"; -- 6
     else
      seg <= "0011001"; -- 4
     end if;

    elsif stTestCur = stTestPassed2 and
          regMemRdData = x"18" then
     if cntDisp ="11" then
      seg <= "1111111"; -- blank
     elsif cntDisp ="10" then
      seg <= "1111001"; -- 1
     elsif cntDisp ="01" then
      seg <= "0100100"; -- 2
     else
      seg <= "0000000"; -- 8
     end if;

    elsif stTestCur = stTestPassed2 and
          regMemRdData = x"1d" then
     if cntDisp ="11" then
      seg <= "1111111"; -- blank
     elsif cntDisp ="10" then
      seg <= "0100100"; -- 2
     elsif cntDisp ="01" then
      seg <= "0010010"; -- 5
     else
      seg <= "0000010"; -- 6
     end if;
	 else
     if cntDisp ="11" then
      seg <= "1111111"; -- blank
     elsif cntDisp ="10" then
      seg <= "1111111"; -- blank
     elsif cntDisp ="01" then
      seg <= "1111111"; -- blank
     else
      seg <= "1111111"; -- blank
     end if;
    end if;
  end process;

end Behavioral;
