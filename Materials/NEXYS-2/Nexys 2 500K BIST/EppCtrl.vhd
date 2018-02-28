------------------------------------------------------------------------
-- EppCtrl.vhd -- Digilent Epp Interface Module 
------------------------------------------------------------------------
-- Author : Mircea Dabacan
--          Copyright 2004 Digilent, Inc.
------------------------------------------------------------------------
-- Software version: Xilinx ISE 6.2.03i
--                   WebPack
------------------------------------------------------------------------
-- This file contains the design for an EPP interface controller.
-- This configuration, in conjunction with a communication module,
-- (Digilent USB, Serial, Network or Parallel module) allows the user
-- to interface some other FPGA implemented "client" components 
-- (Digilent Library components or user generated ones)
-- to a PC application program (a Digilent utility or user generated).

------------------------------------------------------------------------
--  Behavioral description
------------------------------------------------------------------------
-- All the Digilent communication modules above emulate an EPP interface
-- at the FPGA board connector pins, compatible to EppCtrl controller.
-- The controller performs the following functions:
--    - manages the EPP standard handshake
--    - implements the standard EPP Address Register
--    - provides the signals needed to read/write EPP Data Registers.
--      The "client" component(s) is (are) responsible to implement the
--      specific required data registers, as explained below:
--       - declare the data read and write registers; 
--       - assign an Epp address for each.
--           A couple of read- respective write- registers can be 
--           assigned to the same Epp address. Assign a unique address 
--           to each register (couple) throughout all the 
--           client components connected to the same EppCtrl. 
--           The totality of assigned addresses builds the component 
--           address range. If less the 256 (couples of) registers are
--           required, "mirror" or "alias" addresses can be used 
--           (incomplete regEppAdrOut(7:0) decoding). 
--           The mirror addresses are not allowed to overlap throughout
--           all the client components connected to the same EppCtrl. 
--       - use the same clock signal for all data registers as well as 
--           for EppCtrl component Write Data registers
--       - connect the inputs of all write registers to busEppOut(7:0)
--       - decode regEppAdrOut(7:0) to generate the CS signal for each 
--           write register
--       - use ctlEppDwrOut as WE signal for all the write registers 
--           Read Data registers
--       - connect the outputs of all read registers to busEppIn(7:0)
--           THROUGH A MUX
--       - use the regEppAdrOut(7:0) as MUX address lines.

--    - defines two types of Data Register access
--       - Register Transfer - reads or writes a client data register, 
--                           - no handshake to the client component.
--       - Process Launch - launches a client process and 
--                        - waits it to complete.
--          The client process is required to conform to the handshake
--          protocol described below. 
--          A client data register transfer is also performed.

--      The client component decides to which type the current 
--      Data Register Access belongs: a clock period (20ns for 50MHz 
--      clock frequency) after ctlEppDwrOut becomes active,
--      EppCtrl samples the HandShakeReqIn input signal. 
--         - if inactive, the current transfer cycle completes without a
--           handshake protocol.
--         - if active (HIGH), the current transfer cycle uses a 
--           handshake protocol:
--
--               The Handshake protocol
--            - the busEppOut, ctlEppRdCycleOut and regEppAdrOut(7:0) 
--              signals freeze
--            - (for a WRITE cycle, ctlEppDwrOut pulses LOW for 
--              1 CK period - the selected write register is set)  
--            - the ctlEppStartOut signal is set active (HIGH)
--            - (for a READ cycle, client application places data on 
--              busEppIn(7:0))
--            - the controller waits for the ctlEppDoneIn signal to 
--              become active (HIGH)
--            - (for a READ cycle, the data transfer is performed 1 CK 
--              period later)
--            - the ctlEppStartOut signal is set inactive (LOW)
--            - the controller waits for the ctlEppDoneIn signal to 
--              become inactive (LOW)
--            - a new transfer cycle can begin (if required by the PC 
--              application)

--      A client component can use the handshake protocol feature for 
--      various purposes:
--        - blocking the EppCtrl at all:
--            - activate the HandShakeReqIn input signal
--            - wait for the ctlEppStartOut signal to become active.
--            - keep the ctlEppDoneIn signal inactive (LOW) for the 
--              desired time (the Epp interface freezes - the PC 
--              software could exit with a time-out error)
--            - activate the ctlEppDoneIn signal.
--            - wait for the ctlEppStartOut signal to become inactive.
--            - inactivate ctlEppDoneIn,
--            - continue its own action.
--        - blocking the EppCtrl cycles for a specific client component:
--            - activate the HandShakeReqIn input signal when the
--              regEppAdrOut(7:0) value belongs to the address range 
--              assigned to the specific client component.
--            - wait for the ctlEppStartOut signal to become active.
--            - keep the ctlEppDoneIn signal inactive (LOW) for the 
--              desired time (the Epp interface freezes - the PC 
--              software could exit with a time-out error)
--            - activate the ctlEppDoneIn signal.
--            - wait for the ctlEppStartOut signal to become inactive.
--            - inactivate ctlEppDoneIn,
--            - continue its own action.
--        - enlarging the EppCtrl cycles for specific data register 
--           transfer cycles:
--            - activate the HandShakeReqIn input signal when the 
--              regEppAdrOut(7:0) value equals any Data Register address
--              that requires an internal process.
--              (ctlEppRdCycleOut signal can be used to discriminate 
--               between read and write cycles; ctlEppDwrOut signal 
--               cannot be used because it is not yet active when 
--               HandshakeReqIn is sampled)
--            - wait for the ctlEppStartOut signal to become active.
--            - launch the appropriate process (based on the 
--              regEppAdrOut(7:0) and ctlEppRdCycleOut values)
--            - keep the ctlEppDoneIn signal inactive (LOW) until the 
--              process completes(the Epp interface freezes - the PC 
--              software could exit with a time-out error)
--            - get ready for the current transfer cycle completion.
--            - activate the ctlEppDoneIn signal.
--            - wait for the ctlEppStartOut signal to become inactive.
--            - inactivate ctlEppDoneIn,
--            - continue its own action.

------------------------------------------------------------------------
--  Port definitions
------------------------------------------------------------------------
-- Epp bus signals
--      clk    : in std_logic;      -- system clock (50MHz)
--      EppAstb: in std_logic;      -- Address strobe
--      EppDstb: in std_logic;      -- Data strobe
--      EppWr  : in std_logic;      -- Port write signal
--      EppRst : in std_logic;      -- Port reset signal
--      pint   : out std_logic;     -- Port interrupt request (not used)

   -- Changend when adding the Synchronous mode 
--      EppDBIn  : in std_logic_vector(7 downto 0);    -- port data bus
--      EppDBOut : out std_logic_vector(7 downto 0);    -- port data bus
--      EppWait: out std_logic;     -- Port wait signal
-- User signals
--      busEppOut: out std_logic_vector(7 downto 0); -- Data Output bus
--      busEppIn: in std_logic_vector(7 downto 0);   -- Data Input bus
--      ctlEppDwrOut: out std_logic;                 -- Data Write pulse
--      ctlEppRdCycleOut: inout std_logic; -- Indicates a READ Epp cycle       
--      regEppAdrOut: inout std_logic_vector(7 downto 0) := "00000000"; 
                                         -- Epp Address Register content
--      HandShakeReqIn: in std_logic;    -- User Handshake Request
--      ctlEppStartOut: out std_logic;   -- Automatic process Start   
--      ctlEppDoneIn: in std_logic       -- Automatic process Done 


------------------------------------------------------------------------
-- Revision History:
--   10/21/2004(MirceaD): created
------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity EppCtrl is
    Port (

-- Epp-like bus signals
      clk    : in std_logic;        -- system clock (50MHz)
      EppAstb: in std_logic;        -- Address strobe
      EppDstb: in std_logic;        -- Data strobe
      EppWr  : in std_logic;        -- Port write signal
      EppRst : in std_logic;        -- Port reset signal
      EppDBOut : out std_logic_vector(7 downto 0); -- port data bus
      EppDBIn  : in std_logic_vector(7 downto 0); 	-- port data bus
      EppWait: out std_logic;       -- Port wait signal
-- User signals
      busEppOut: out std_logic_vector(7 downto 0); -- Data Output bus
      busEppIn: in std_logic_vector(7 downto 0);   -- Data Input bus
      ctlEppDwrOut: out std_logic;         -- Data Write pulse
      ctlEppRdCycleOut: inout std_logic;   -- Indicates a READ Epp cycle
      regEppAdrOut: inout std_logic_vector(7 downto 0) := "00000000"; 
                                         -- Epp Address Register content
      HandShakeReqIn: in std_logic;      -- User Handshake Request
      ctlEppStartOut: out std_logic;     -- Automatic process Start   
      ctlEppDoneIn: in std_logic         -- Automatic process Done 
         );
end EppCtrl;

architecture Behavioral of EppCtrl is

------------------------------------------------------------------------
-- Constant and Signal Declarations
------------------------------------------------------------------------

-- The following constants define state codes for the EPP port interface
-- state machine. 
-- The states are such a way assigned that each transition
-- changes a single state register bit (Grey code - like)
   constant stEppReady     : std_logic_vector(2 downto 0) := "000";  
   constant stEppStb       : std_logic_vector(2 downto 0) := "010";   
   constant stEppRegTransf : std_logic_vector(2 downto 0) := "110";   
   constant stEppSetProc   : std_logic_vector(2 downto 0) := "011";
   constant stEppLaunchProc: std_logic_vector(2 downto 0) := "111";
   constant stEppWaitProc  : std_logic_vector(2 downto 0) := "101";
   constant stEppDone      : std_logic_vector(2 downto 0) := "100";

-- Epp state register and next state signal for the Epp FSM
   signal stEppCur: std_logic_vector(2 downto 0) := stEppReady;
   signal stEppNext: std_logic_vector(2 downto 0);

-- The attribute lines below prevent the ISE compiler to extract and 
-- optimize the state machines.
-- WebPack 5.1 doesn't need them (the default value is NO)
-- WebPack 6.2 has the default value YES, so without these lines would 
-- "optimize" the state machines.
-- Although the overall circuit would be optimized, the particular goal 
-- of "glitch free output signals" may not be reached. 
-- That is the reason of implementing the state machine as described in  
-- the constant declarations above. 

attribute fsm_extract : string;
attribute fsm_extract of stEppCur: signal is "no"; 
attribute fsm_extract of stEppNext: signal is "no"; 

attribute fsm_encoding : string;
attribute fsm_encoding of stEppCur: signal is "user"; 
attribute fsm_encoding of stEppNext: signal is "user"; 

attribute signal_encoding : string;
attribute signal_encoding of stEppCur: signal is "user"; 
attribute signal_encoding of stEppNext: signal is "user"; 

-- Signals used by Epp state machine
   signal   busEppInternal: std_logic_vector(7 downto 0);
--   signal   ctlEppDir   : std_logic;
   signal   ctlEppAwr   : std_logic;



------------------------------------------------------------------------
-- Module Implementation
------------------------------------------------------------------------
    
begin

------------------------------------------------------------------------
-- Map basic status and control signals
------------------------------------------------------------------------

-- Epp signals
   -- Port signals

-- Synchronized Epp inputs:
   process(clk)
   begin
      if clk'event and clk='1' then
         if stEppCur = stEppReady then
            ctlEppRdCycleOut <= '0';
         elsif stEppCur = stEppStb then
            ctlEppRdCycleOut <= EppWr;   
            -- not equivalent to EppWr due to default state
         end if;
      end if;
   end process;


-- Changes to add the synchronous mode (next two lines)
   busEppOut <= EppDBIn;   -- bus toward FPGA (transparent)
   EppDBOut <=busEppInternal; -- when (ctlEppRdCycleOut = '1') else "ZZZZZZZZ";

   busEppInternal <= regEppAdrOut when EppAstb = '0' else busEppIn; 

-- Epp State machine related signals

   EppWait <= '1' when stEppCur = stEppDone else '0';
   ctlEppAwr <= '1' when stEppCur = stEppRegTransf and 
                         EppAstb = '0' and 
                         EppWr = '0' else 
                '0';
   ctlEppDwrOut <= '1' when (stEppCur = stEppRegTransf or 
                             stEppCur = stEppSetProc) 
                         and EppDstb = '0' 
                         and EppWr = '0' else 
                   '0';
   ctlEppStartOut <= '1' when stEppCur = stEppLaunchProc else 
                     '0';
  
------------------------------------------------------------------------
-- EPP Interface Control State Machine
------------------------------------------------------------------------
   process (clk)
      begin
         if clk = '1' and clk'Event then
            if EppRst = '0' then 
               stEppCur <= stEppReady;
            else
               stEppCur <= stEppNext;
            end if;
         end if;
      end process;

   process (stEppCur)
      begin
         case stEppCur is
            -- Idle state waiting for the beginning of an EPP cycle
            when stEppReady =>
               if EppAstb = '0' or EppDstb = '0' then
                  -- Epp cycle recognized
                  stEppNext <= stEppStb;
               else 
                  -- Remain in ready state
                  stEppNext <= stEppReady;
               end if;                                 

            when   stEppStb =>

                  if EppDstb = '0' and HandShakeReqIn = '1' then
                        stEppNext <= stEppSetProc;
                  else
                        stEppNext <= stEppRegTransf;
                  end if;

            -- Data or Address register transfer

            when stEppRegTransf =>
               stEppNext <= stEppDone;

            -- Automatic Process 

            when stEppSetProc =>
               stEppNext <= stEppLaunchProc;

            when stEppLaunchProc =>
               if ctlEppDoneIn = '0' then
                  stEppNext <= stEppLaunchProc;
               else
                  stEppNext <= stEppWaitProc;
               end if;

            when stEppWaitProc =>
               if ctlEppDoneIn = '1' then
                  stEppNext <= stEppWaitProc;
               else
                  stEppNext <= stEppDone;
               end if;

            when stEppDone =>
               if EppAstb = '0' or EppDstb = '0' then
                  stEppNext <= stEppDone;
               else
                  stEppNext <= stEppReady;
               end if;

            -- Some unknown state            
            when others =>
               stEppNext <= stEppReady;

         end case;
      end process;
      
   -- EPP Address register

   process (clk, ctlEppAwr)
      begin
         if clk = '1' and clk'Event then
            if ctlEppAwr = '1' then
               regEppAdrOut <= EppDBIn;
            end if;
         end if;
      end process;

end Behavioral;

