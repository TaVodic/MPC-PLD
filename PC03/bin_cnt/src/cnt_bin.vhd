----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2025 08:55:36 AM
-- Design Name: 
-- Module Name: cnt_bin - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cnt_bin is
    Port ( SRST : in STD_LOGIC;
           CE   : in STD_LOGIC;
           CNT_LOAD : in STD_LOGIC;
           CNT_UP   : in STD_LOGIC;
           CLK  : in STD_LOGIC;
           CNT  : out STD_LOGIC_VECTOR (31 downto 0));
end cnt_bin;

architecture Behavioral of cnt_bin is

    SIGNAL cnt_sig : UNSIGNED (31 DOWNTO 0) := (OTHERS => '0');

begin
     
    process (CLK)
    begin
       if rising_edge(CLK) then
          if SRST = '1' then
             cnt_sig <= (OTHERS => '0');
          elsif CE = '1' then
             if CNT_LOAD = '1' then
                cnt_sig <= X"55555555";
             else
                if CNT_UP = '1' then
                   cnt_sig <= cnt_sig + 1;
                else
                   cnt_sig <= cnt_sig - 1;
                end if;
             end if;
          end if;
       end if;
    end process;
     
    CNT <= STD_LOGIC_VECTOR(cnt_sig);     

end Behavioral;
