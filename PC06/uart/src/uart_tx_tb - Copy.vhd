----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/20/2025 09:24:25 AM
-- Design Name: 
-- Module Name: uart_tx_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uart_tx_tb is
--  Port ( );
end uart_tx_tb;

architecture Behavioral of uart_tx_tb is

  COMPONENT bcd_counter
      PORT (
        CLK                         : IN  STD_LOGIC;
        CE_100HZ                    : IN  STD_LOGIC;
        CNT_ENABLE                  : IN  STD_LOGIC;
        DISP_ENABLE                 : IN  STD_LOGIC;
        CNT_RESET                   : IN  STD_LOGIC;
        CNT_0                       : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
        CNT_1                       : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
        CNT_2                       : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0);
        CNT_3                       : OUT STD_LOGIC_VECTOR( 3 DOWNTO 0)
      );
  END COMPONENT bcd_counter;

begin


end Behavioral;
