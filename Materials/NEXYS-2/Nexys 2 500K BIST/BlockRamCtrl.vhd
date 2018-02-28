--------------------------------------------------------------------------------
-- Company: Digilent RO
-- Engineer: Kovacs Laszlo Attila
--
-- Create Date:    17:35:37 08/27/06
-- Design Name:    
-- Module Name:    BlockRam - Behavioral
-- Project Name:   Nexys Epp Stream Test BRam CellRam
-- Target Device:  Digilnet Nexys
-- Description:    Synchronous transfer sample for Block Ram
-- 
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BlockRamCtrl is
    Port ( 
      UsbClk      : in  std_logic;
      UsbMode     : in  std_logic;
      UsbDir      : in  std_logic;
      UsbOE       : out std_logic;
      UsbRD       : out std_logic;
      UsbWR       : out std_logic;
      UsbPktEnd   : out std_logic;
      UsbFlag     : in  std_logic;
      UsbAdr      : out std_logic_vector(1 downto 0); 
      UsbDBIn     : in  std_logic_vector(7 downto 0);
      UsbDBOut    : out std_logic_vector(7 downto 0);

      Stream6Bytes: in std_logic_vector(47 downto 0));
end BlockRamCtrl;

architecture Behavioral of BlockRamCtrl is


type RamType is array (0 to 24575) of std_logic_vector(7 downto 0);
signal RamData : RamType;

type stateType is (stIdle, stWait, stOut, stInStart, stIn, stInStop);

signal state, next_state : stateType := stIdle;

signal StreamAdr: std_logic_vector(14 downto 0);
signal StreamLen: std_logic_vector(31 downto 0);

signal adrCounter : std_logic_vector(14 downto 0);
signal byteCounter: std_logic_vector(31 downto 0);

signal RamDO : std_logic_vector(7 downto 0);

signal iUsbOp, RamWr, counterZero : std_logic;


begin

  StreamAdr <= Stream6Bytes(46 downto 32);
  StreamLen <= Stream6Bytes(31 downto 0);
   

   UsbDBOut  <= RamDO;

   UsbAdr <= UsbDir&'0';

   UsbOe  <= '1' when UsbMode = '1' else UsbDir;

   UsbRd  <= '1' when UsbMode = '1' else iUsbOp when UsbDir = '0' else '1';

   UsbWr  <= '1' when UsbMode = '1' else iUsbOp when UsbDir = '1' else '1';

   RamWr    <= iUsbOp when UsbDir = '0' else '1';
   
   
   counterZero <= '1' when byteCounter = x"00000000" else '0';

   SYNC_PROC: process(UsbClk)
   begin
      if rising_edge(UsbClk) then
         state <= next_state;

         -- the byte counter will be sync loaded when we are in Epp Mode
         -- on internal iUsbOp signal will count down
         if state = stIdle then
            byteCounter <= StreamLen;
         elsif iUsbOp = '0' and counterZero = '0' then
            byteCounter <= byteCounter - '1';
         end if;
         
         -- the PktEnd signal will be activated when IN transfer is done
         UsbPktEnd <= '1';
         if state = stIn then
            if counterZero = '1' then
               UsbPktEnd <= '0';
            end if;
         end if;         

         -- the address is loaded in Epp Mode
         -- and incremented with every USB FIFO Operation (Read or Write)
         -- also incremented before FIFO Write because of the BRAM DataOut delay
         -- so when entering in Wait state we have to get rif of this step ahead
         if state = stIdle then
            adrCounter <= StreamAdr;
         elsif state = stInStart or iUsbOp = '0' then
            adrCounter <= adrCounter + '1';
         elsif state = stInStop then
            adrCounter <= adrCounter - '1';
         end if;

      end if;
   end process;


-- the output of the state mashine can be written in the following form also
-- iUsbOp <= '0' when counterZero = '0' and UsbFlag = '1' and
--                   (state = stOut or state = stIn) else '1'

   OUTPUT_DECODE: process(state, counterZero, UsbFlag)
   begin
      iUsbOp <= '1';
      case(state) is
         when stIdle  =>
         when stWait  =>
         when stOut   =>
            if counterZero = '0' and UsbFlag = '1' then
               iUsbOp <= '0';
            end if;
         when stInStart =>
         when stIn    =>
            if counterZero = '0' and UsbFlag = '1' then
               iUsbOp <= '0';
            end if;
         when stInStop =>
         when others  => 
      end case;
   end process;

   NEXT_STATE_DECODE: process(state, counterZero, UsbMode, UsbDir, UsbFlag, adrCounter, StreamAdr)
   begin
      next_state <= state;
      case(state) is
			-- wait in idle for the UsbMode to switch to enable Synchronous mode
			when stIdle  =>
				if counterZero = '0' and UsbMode = '0' then
               next_state <= stWait;
            else
               next_state <= stIdle;
            end if;
			-- wait for the UsbMode then continue the data transfer
			when stWait  =>
            if UsbMode = '1' then
               next_state <= stIdle; 
            elsif UsbFlag = '1' then
               if UsbDir = '0' then
                  next_state <= stOut;
               else
                  next_state <= stInStart;
               end if;
            else
               next_state <= stWait;
            end if;
         -- perform OUT transfer until data transfer finished and (Empty) Flag not signaled 
			when stOut   =>
            if UsbMode = '1' or counterZero = '1' then
               next_state <= stIdle;
            elsif UsbFlag = '0' then
               next_state <= stWait;
            else
               next_state <= stOut;
            end if;
         -- start (or resume) IN transfer, 
         -- this state will advance the reading from th BRAM
			when stInStart =>
            next_state <= stIn;
         -- perform IN transfer until data transfer finished and (Full) Flag not signaled
         when stIn    =>
            if UsbMode = '1' or counterZero = '1' then
               next_state <= stIdle;
            elsif UsbFlag = '0' then
               next_state <= stInStop;
            else
               next_state <= stIn;
            end if;
         -- pause the IN transfer,
         -- this state will take back the advance of the BRAM, decrement counter
         when stInStop =>
            next_state <= stWait;
         when others  => 
            next_state <= stIdle;
      end case;
   end process;

  -- BRAM module
   process (UsbClk)
   begin
      if rising_edge(UsbClk) then
         if RamWr = '0' then
            RamData(conv_integer(adrCounter)) <= UsbDBIn;
            RamDO <= UsbDBIn;
         else
            RamDO <= RamData(conv_integer(adrCounter));
         end if;
      end if;
   end process;

end Behavioral;
