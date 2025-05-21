library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LED_top is
    Port ( BTN : in STD_LOGIC_VECTOR (1 to 4);
           SW : in STD_LOGIC_VECTOR (1 to 4);
           LED : out STD_LOGIC_VECTOR (7 downto 0));
end LED_top;

architecture Behavioral of LED_top is

begin
    LED(0) <= '1' WHEN 
        SW = "1010" AND (BTN = "0001" OR BTN = "1000") 
        ELSE '0';              
    
    --LED(1) <=     BTN(1);
    --LED(2) <= NOT BTN(2);
    
    --LED(7 downto 4) <= "1111";
   -- LED(7 downto 4) <= SW;
        
end Behavioral;
